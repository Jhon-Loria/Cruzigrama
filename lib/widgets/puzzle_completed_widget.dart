import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/category_provider.dart';
import '../providers/timer_provider.dart';
import '../providers/records_provider.dart';
import '../main.dart';
import 'leaderboard_widget.dart';

class PuzzleCompletedWidget extends ConsumerStatefulWidget {
  const PuzzleCompletedWidget({super.key});

  @override
  ConsumerState<PuzzleCompletedWidget> createState() => _PuzzleCompletedWidgetState();
}

class _PuzzleCompletedWidgetState extends ConsumerState<PuzzleCompletedWidget> {
  final _nameController = TextEditingController();
  bool _isSaving = false;
  bool _isSaved = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveRecord() async {
    final category = ref.read(selectedCategoryProvider);
    if (category == null) return;

    final timer = ref.read(gameTimerProvider.notifier);
    final timeSeconds = timer.elapsedSeconds;

    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa tu nombre')),
      );
      return;
    }

    setState(() => _isSaving = true);

    final saveRecord = ref.read(saveRecordProvider.notifier);
    final success = await saveRecord.save(
      categoryId: category.id,
      playerName: _nameController.text.trim(),
      timeSeconds: timeSeconds,
    );

    setState(() {
      _isSaving = false;
      _isSaved = success;
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Record guardado exitosamente!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al guardar el record')),
      );
    }
  }

  void _showLeaderboard() {
    final category = ref.read(selectedCategoryProvider);
    if (category != null) {
      showDialog(
        context: context,
        builder: (_) => LeaderboardWidget(categoryId: category.id),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(gameTimerProvider);
    final category = ref.read(selectedCategoryProvider);
    final minutes = timer.inMinutes;
    final seconds = timer.inSeconds % 60;
    final timeString = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF000A1A),
            const Color(0xFF001133),
            const Color(0xFF000A1A),
          ],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00D9FF), Color(0xFF0099FF)],
                    ),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: const Color(0xFF00BFFF),
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00D9FF).withOpacity(0.8),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.celebration,
                    size: 80,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF00BFFF), Color(0xFF0099FF), Color(0xFF00D9FF), Color(0xFF0066FF)],
                  ).createShader(bounds),
                  child: const Text(
                    '¡PUZZLE COMPLETADO!',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                      fontFamily: 'Courier',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF001A3A), Color(0xFF002A4A)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF00BFFF),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00BFFF).withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'TIEMPO TOTAL',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF00CED1),
                          letterSpacing: 2,
                          fontFamily: 'Courier',
                        ),
                      ),
                      const SizedBox(height: 8),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFF00BFFF), Color(0xFF00D9FF)],
                        ).createShader(bounds),
                        child: Text(
                          timeString,
                          style: const TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 3,
                            fontFamily: 'Courier',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                if (category != null && !_isSaved) ...[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF0099FF),
                        width: 2,
                      ),
                    ),
                    child: TextField(
                      controller: _nameController,
                      style: const TextStyle(
                        color: Color(0xFF00CED1),
                        fontFamily: 'Courier',
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: 'TU NOMBRE',
                        labelStyle: const TextStyle(
                          color: Color(0xFF00BFFF),
                          letterSpacing: 1,
                          fontFamily: 'Courier',
                        ),
                        hintText: 'Ingresa tu nombre para el leaderboard',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Courier',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF0099FF)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF0099FF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF00BFFF), width: 2),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF00BFFF),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF001A3A),
                      ),
                      enabled: !_isSaving,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isSaving ? null : _saveRecord,
                      icon: _isSaving
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.save),
                      label: Text(_isSaving ? 'Guardando...' : 'Guardar Record'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
                if (_isSaved) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00CED1), Color(0xFF00BFFF)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF0099FF),
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      '✓ RECORD GUARDADO',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontFamily: 'Courier',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _showLeaderboard,
                    icon: const Icon(Icons.leaderboard),
                    label: const Text('Ver Leaderboard'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Reiniciar juego
                    final currentCategory = ref.read(selectedCategoryProvider);
                    ref.read(gameTimerProvider.notifier).reset();
                    
                    // Si hay categoría seleccionada, limpiarla para volver a la selección
                    if (currentCategory != null) {
                      ref.read(selectedCategoryProvider.notifier).clear();
                    }
                    
                    // Navegar al inicio, reemplazando toda la pila de navegación
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text('Volver al inicio'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
