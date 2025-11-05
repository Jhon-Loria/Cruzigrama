import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'supabase_provider.dart';

part 'connectivity_provider.g.dart';

/// Provider para el estado de conectividad
@riverpod
Stream<bool> connectivityStream(ConnectivityStreamRef ref) async* {
  final connectivity = Connectivity();
  
  // Estado inicial
  final results = await connectivity.checkConnectivity();
  yield results.isNotEmpty && !results.contains(ConnectivityResult.none);

  // Escuchar cambios
  await for (final results in connectivity.onConnectivityChanged) {
    yield results.isNotEmpty && !results.contains(ConnectivityResult.none);
  }
}

/// Provider para verificar si hay conexión (síncrono)
@riverpod
Future<bool> hasConnection(HasConnectionRef ref) async {
  final connectivity = Connectivity();
  final results = await connectivity.checkConnectivity();
  return results.isNotEmpty && !results.contains(ConnectivityResult.none);
}

/// Provider para el modo manual (null = automático, true = forzar online, false = forzar offline)
@Riverpod(keepAlive: true)
class ManualMode extends _$ManualMode {
  @override
  bool? build() => null; // null = automático

  /// Forzar modo online
  void forceOnline() {
    state = true;
  }

  /// Forzar modo offline
  void forceOffline() {
    state = false;
  }

  /// Usar modo automático (basado en conectividad)
  void useAutomatic() {
    state = null;
  }
}

/// Provider para determinar si debe usar modo online
@riverpod
Future<bool> shouldUseOnlineMode(ShouldUseOnlineModeRef ref) async {
  // Verificar si hay modo manual configurado
  final manualMode = ref.watch(manualModeProvider);
  
  // Si hay modo manual, usarlo directamente
  if (manualMode != null) {
    return manualMode;
  }
  
  // Si no, usar modo automático basado en conectividad
  final hasConnection = await ref.watch(hasConnectionProvider.future);
  final supabase = ref.read(supabaseProvider);
  
  // Solo modo online si hay conexión Y Supabase está configurado
  return hasConnection && supabase != null;
}

