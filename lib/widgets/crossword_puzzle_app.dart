import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../providers/category_provider.dart';
import '../providers/timer_provider.dart';
import '../providers/audio_provider.dart';
import 'crossword_generator_widget.dart';
import 'crossword_puzzle_widget.dart';
import 'puzzle_completed_widget.dart';

class CrosswordPuzzleApp extends StatelessWidget {
  const CrosswordPuzzleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _EagerInitialization(
      child: Consumer(
        builder: (context, ref, _) {
          // Verificar si hay categoría seleccionada
          final selectedCategory = ref.watch(selectedCategoryProvider);
          
          // Si no hay categoría, debe seleccionarse primero
          // (esto se manejará en main.dart)
          
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF001133),
              actions: [
                _MusicToggleButton(),
                _TimerDisplay(),
                _CrosswordPuzzleAppMenu(),
              ],
              title: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF00BFFF), Color(0xFF0099FF), Color(0xFF00D9FF), Color(0xFF0066FF)],
                ).createShader(bounds),
                child: Text(
                  (selectedCategory?.name ?? 'CROSSWORD PUZZLE').toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              elevation: 0,
            ),
            body: SafeArea(
              child: Consumer(
                builder: (context, ref, _) {
                  final workQueueAsync = ref.watch(workQueueProvider);
                  final puzzleSolved = ref.watch(
                    puzzleProvider.select((puzzle) => puzzle.solved),
                  );
                  
                  // Iniciar temporizador cuando el puzzle esté listo
                  ref.listen(
                    workQueueProvider.select((wq) => wq.value?.isCompleted ?? false),
                    (previous, next) {
                      if (next == true) {
                        final timer = ref.read(gameTimerProvider.notifier);
                        if (!timer.isRunning) {
                          timer.start();
                        }
                      }
                    },
                  );
                  
                  // Detener temporizador cuando se complete
                  ref.listen(
                    puzzleProvider.select((puzzle) => puzzle.solved),
                    (previous, next) {
                      if (next == true && previous == false) {
                        final timer = ref.read(gameTimerProvider.notifier);
                        timer.stop();
                      }
                    },
                  );

                  return workQueueAsync.when(
                    data: (workQueue) {
                      if (puzzleSolved) {
                        return PuzzleCompletedWidget();
                      }
                      if (workQueue.isCompleted &&
                          workQueue.crossword.characters.isNotEmpty) {
                        return CrosswordPuzzleWidget();
                      }
                      return CrosswordGeneratorWidget();
                    },
                    loading: () => Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Center(child: Text('$error')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wordListProvider);
    return child;
  }
}

class _MusicToggleButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMuted = ref.watch(backgroundMusicProvider);
    final musicNotifier = ref.read(backgroundMusicProvider.notifier);
    
    // Iniciar música al inicio
    WidgetsBinding.instance.addPostFrameCallback((_) {
      musicNotifier.startMusic();
    });
    
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isMuted
              ? [const Color(0xFF001A3A), const Color(0xFF002A4A)]
              : [const Color(0xFF0099FF), const Color(0xFF00BFFF)],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isMuted ? const Color(0xFF00BFFF) : const Color(0xFF00D9FF),
          width: 2,
        ),
        boxShadow: isMuted
            ? []
            : [
                BoxShadow(
                  color: const Color(0xFF0099FF).withOpacity(0.6),
                  blurRadius: 8,
                ),
              ],
      ),
      child: IconButton(
        icon: Icon(
          isMuted ? Icons.volume_off : Icons.volume_up,
          color: isMuted ? const Color(0xFF00BFFF) : Colors.black,
        ),
        onPressed: () => musicNotifier.toggleMute(),
        tooltip: isMuted ? 'Activar música' : 'Silenciar música',
      ),
    );
  }
}

class _TimerDisplay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elapsed = ref.watch(gameTimerProvider);
    
    final minutes = elapsed.inMinutes;
    final seconds = elapsed.inSeconds % 60;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00BFFF), Color(0xFF00D9FF)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF0099FF),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00BFFF).withOpacity(0.6),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.black, Colors.black],
        ).createShader(bounds),
        child: Text(
          '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
            fontFamily: 'Courier',
          ),
        ),
      ),
    );
  }
}

class _CrosswordPuzzleAppMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => MenuAnchor(
    menuChildren: [
      for (final entry in CrosswordSize.values)
        MenuItemButton(
          onPressed: () => ref.read(sizeProvider.notifier).setSize(entry),
          leadingIcon: entry == ref.watch(sizeProvider)
              ? Icon(Icons.radio_button_checked_outlined)
              : Icon(Icons.radio_button_unchecked_outlined),
          child: Text(entry.label),
        ),
    ],
    builder: (context, controller, child) => IconButton(
      onPressed: () => controller.open(),
      icon: Icon(Icons.settings),
    ),
  );
}
