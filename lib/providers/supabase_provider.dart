import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Provider para la instancia de Supabase
/// Configura esto con tus credenciales de Supabase
final supabaseProvider = Provider<SupabaseClient?>((ref) {
  try {
    return Supabase.instance.client;
  } catch (e) {
    // Si hay error al inicializar, retorna null (modo offline)
    return null;
  }
});

/// Inicializa Supabase (llamar en main.dart)
Future<void> initializeSupabase() async {
  const supabaseUrl = 'https://fhqkawzltegysrfcnbrt.supabase.co';
  const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZocWthd3psdGVneXNyZmNuYnJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE3MDQ0MzQsImV4cCI6MjA3NzI4MDQzNH0.lO84El-97OrKojA38G0Fldp-lSzxShVzXZTQGZ5ldZs';

  try {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
    print('✅ Supabase inicializado correctamente');
  } catch (e) {
    // Error al inicializar, la app funcionará en modo offline
    print('❌ Error inicializando Supabase: $e');
    print('La app funcionará en modo offline');
  }
}

