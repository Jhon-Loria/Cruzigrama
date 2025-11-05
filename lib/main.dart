import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/supabase_provider.dart';
import 'providers/category_provider.dart';
import 'providers/connectivity_provider.dart';
import 'widgets/category_selection_widget.dart';
import 'widgets/crossword_puzzle_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar Supabase (si está configurado)
  await initializeSupabase();
  
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Crossword Puzzle',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Estilo retro azul neón
          primaryColor: const Color(0xFF0099FF), // Azul neón principal
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF00BFFF), // Azul cielo brillante
            primary: const Color(0xFF0099FF), // Azul neón
            secondary: const Color(0xFF00D9FF), // Azul cyan brillante
            tertiary: const Color(0xFF0066FF), // Azul eléctrico
            brightness: Brightness.dark,
            surface: const Color(0xFF001133), // Azul muy oscuro
            background: const Color(0xFF000A1A), // Azul negro profundo
          ),
          scaffoldBackgroundColor: const Color(0xFF000A1A),
          cardColor: const Color(0xFF001A3A),
          brightness: Brightness.dark,
          fontFamily: 'Courier', // Fuente tipo máquina de escribir
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00BFFF),
              letterSpacing: 2,
            ),
            headlineLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0099FF),
              letterSpacing: 1.5,
            ),
            titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00D9FF),
              letterSpacing: 1,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Color(0xFF00CED1),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0099FF),
              foregroundColor: Colors.black,
              elevation: 8,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Color(0xFF00D9FF), width: 2),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          cardTheme: CardThemeData(
            color: const Color(0xFF001A3A),
            elevation: 12,
            shadowColor: const Color(0xFF0099FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFF00BFFF), width: 2),
            ),
          ),
        ),
        home: const MainScreen(),
      ),
    ),
  );
}

/// Pantalla principal que decide si mostrar selección de categorías o el juego
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final shouldUseOnline = ref.watch(shouldUseOnlineModeProvider);
    
    return shouldUseOnline.when(
      data: (online) {
        // Si hay categoría seleccionada, mostrar el juego
        if (selectedCategory != null) {
          return const CrosswordPuzzleApp();
        }
        
        // Si NO hay internet o NO está configurado Supabase, mostrar crucigrama por defecto (sin categorías)
        if (!online) {
          return const CrosswordPuzzleApp();
        }
        
        // Si hay internet y Supabase configurado, mostrar selección de categorías
        return const CategorySelectionWidget();
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) {
        // Si hay error, mostrar crucigrama por defecto
        return const CrosswordPuzzleApp();
      },
    );
  }
}