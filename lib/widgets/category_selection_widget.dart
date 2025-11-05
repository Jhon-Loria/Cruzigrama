import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/category_provider.dart';
import '../providers/connectivity_provider.dart';
import 'crossword_puzzle_app.dart';

/// Pantalla de selección de categorías
class CategorySelectionWidget extends ConsumerWidget {
  const CategorySelectionWidget({super.key});

  void _showModeSelector(BuildContext context, WidgetRef ref) {
    final manualMode = ref.watch(manualModeProvider);
    final shouldUseOnline = ref.watch(shouldUseOnlineModeProvider);

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF001A3A),
                const Color(0xFF002A4A),
                const Color(0xFF001A3A),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFF00BFFF),
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00BFFF).withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Título con estilo retro
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF00BFFF), Color(0xFF0099FF), Color(0xFF00D9FF)],
                  ).createShader(bounds),
                  child: const Text(
                    'SELECCIONAR MODO',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.white,
                      fontFamily: 'Courier',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Opciones de modo
                _ModeOption(
                  title: 'AUTOMÁTICO',
                  description: 'Detecta automáticamente según conexión',
                  icon: Icons.settings,
                  isSelected: manualMode == null,
                  onTap: () {
                    ref.read(manualModeProvider.notifier).useAutomatic();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                _ModeOption(
                  title: 'MODO ONLINE',
                  description: 'Forzar uso de Supabase (requiere internet)',
                  icon: Icons.cloud,
                  isSelected: manualMode == true,
                  onTap: () {
                    ref.read(manualModeProvider.notifier).forceOnline();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                _ModeOption(
                  title: 'MODO OFFLINE',
                  description: 'Usar solo datos locales',
                  icon: Icons.cloud_off,
                  isSelected: manualMode == false,
                  onTap: () {
                    ref.read(manualModeProvider.notifier).forceOffline();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 24),
                // Indicador de estado actual
                shouldUseOnline.when(
                  data: (online) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: online
                            ? [const Color(0xFF00D9FF), const Color(0xFF00BFFF)]
                            : [const Color(0xFF0099FF), const Color(0xFF0066FF)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF00BFFF),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: (online ? const Color(0xFF00D9FF) : const Color(0xFF0099FF))
                              .withOpacity(0.6),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            online ? Icons.cloud : Icons.cloud_off,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.black, Colors.black],
                          ).createShader(bounds),
                          child: Text(
                            online ? 'MODO ONLINE ACTIVO' : 'MODO OFFLINE ACTIVO',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontFamily: 'Courier',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  loading: () => Container(
                    padding: const EdgeInsets.all(16),
                    child: const CircularProgressIndicator(
                      color: Color(0xFF00BFFF),
                    ),
                  ),
                  error: (_, __) => const SizedBox(),
                ),
                const SizedBox(height: 16),
                // Botón de cerrar
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF00BFFF),
                  ),
                  child: const Text(
                    'CERRAR',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontFamily: 'Courier',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final shouldUseOnline = ref.watch(shouldUseOnlineModeProvider);
    final manualMode = ref.watch(manualModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00BFFF), Color(0xFF0099FF), Color(0xFF00D9FF), Color(0xFF0066FF)],
          ).createShader(bounds),
          child: const Text(
            'SELECCIONAR CATEGORÍA',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF001133),
        elevation: 0,
        actions: [
          // Botón para seleccionar modo
          IconButton(
            icon: Icon(
              manualMode == null
                  ? Icons.settings
                  : manualMode == true
                      ? Icons.cloud
                      : Icons.cloud_off,
            ),
            tooltip: 'Cambiar modo (Online/Offline/Automático)',
            onPressed: () => _showModeSelector(context, ref),
          ),
          // Indicador de modo online/offline
          Consumer(
            builder: (context, ref, _) {
              return shouldUseOnline.when(
                data: (online) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    online ? Icons.cloud : Icons.cloud_off,
                    color: online ? Colors.green : Colors.orange,
                  ),
                ),
                loading: () => const SizedBox(),
                error: (_, __) => const SizedBox(),
              );
            },
          ),
        ],
      ),
      body: categoriesAsync.when(
        data: (categories) {
          if (categories.isEmpty) {
            return const Center(
              child: Text('No hay categorías disponibles'),
            );
          }

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
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF001A3A),
                        const Color(0xFF002A4A),
                        const Color(0xFF001A3A),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: index % 2 == 0 
                          ? const Color(0xFF00BFFF) 
                          : const Color(0xFF0099FF),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: index % 2 == 0 
                            ? const Color(0xFF00BFFF).withOpacity(0.5)
                            : const Color(0xFF0099FF).withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        ref.read(selectedCategoryProvider.notifier).selectCategory(category);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const CrosswordPuzzleApp(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF00D9FF),
                                    const Color(0xFF0099FF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFF00BFFF),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF00D9FF).withOpacity(0.6),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  category.name[0].toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShaderMask(
                                    shaderCallback: (bounds) => LinearGradient(
                                      colors: index % 2 == 0
                                          ? [const Color(0xFF00BFFF), const Color(0xFF00D9FF)]
                                          : [const Color(0xFF0099FF), const Color(0xFF0066FF)],
                                    ).createShader(bounds),
                                    child: Text(
                                      category.name.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    category.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF00CED1),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              category.isOnline ? Icons.cloud : Icons.storage,
                              color: category.isOnline 
                                  ? const Color(0xFF00BFFF)
                                  : const Color(0xFF00D9FF),
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(categoriesProvider),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget para opción de modo con estilo retro azul neón
class _ModeOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF0099FF),
                      const Color(0xFF00BFFF),
                      const Color(0xFF0099FF),
                    ],
                  )
                : LinearGradient(
                    colors: [
                      const Color(0xFF001A3A).withOpacity(0.5),
                      const Color(0xFF002A4A).withOpacity(0.5),
                    ],
                  ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? const Color(0xFF00D9FF) : const Color(0xFF00BFFF),
              width: isSelected ? 3 : 2,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF00BFFF).withOpacity(0.6),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [Color(0xFF00D9FF), Color(0xFF00BFFF)],
                        )
                      : LinearGradient(
                          colors: [
                            const Color(0xFF00BFFF).withOpacity(0.3),
                            const Color(0xFF0099FF).withOpacity(0.3),
                          ],
                        ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF00D9FF) : const Color(0xFF00BFFF),
                    width: 2,
                  ),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.black : const Color(0xFF00BFFF),
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: isSelected
                            ? [Colors.black, Colors.black]
                            : [const Color(0xFF00BFFF), const Color(0xFF00D9FF)],
                      ).createShader(bounds),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: isSelected ? Colors.white : Colors.white,
                          fontFamily: 'Courier',
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected
                            ? Colors.black.withOpacity(0.8)
                            : const Color(0xFF00CED1),
                        letterSpacing: 0.5,
                        fontFamily: 'Courier',
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00D9FF), Color(0xFF00BFFF)],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

