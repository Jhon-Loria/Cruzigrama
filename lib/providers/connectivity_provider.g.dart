// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityStreamHash() =>
    r'd18f4c6f181dc6be6ed10cc14d988aae35eb55ae';

/// Provider para el estado de conectividad
///
/// Copied from [connectivityStream].
@ProviderFor(connectivityStream)
final connectivityStreamProvider = AutoDisposeStreamProvider<bool>.internal(
  connectivityStream,
  name: r'connectivityStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityStreamRef = AutoDisposeStreamProviderRef<bool>;
String _$hasConnectionHash() => r'49587d367ae518597f3ca0d9b9d2ed49628b3068';

/// Provider para verificar si hay conexión (síncrono)
///
/// Copied from [hasConnection].
@ProviderFor(hasConnection)
final hasConnectionProvider = AutoDisposeFutureProvider<bool>.internal(
  hasConnection,
  name: r'hasConnectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasConnectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasConnectionRef = AutoDisposeFutureProviderRef<bool>;
String _$shouldUseOnlineModeHash() =>
    r'0f4bdf679d61d9803d78f584baa9ccb53c9fcb34';

/// Provider para determinar si debe usar modo online
///
/// Copied from [shouldUseOnlineMode].
@ProviderFor(shouldUseOnlineMode)
final shouldUseOnlineModeProvider = AutoDisposeFutureProvider<bool>.internal(
  shouldUseOnlineMode,
  name: r'shouldUseOnlineModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shouldUseOnlineModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShouldUseOnlineModeRef = AutoDisposeFutureProviderRef<bool>;
String _$manualModeHash() => r'272d773efc3467cba89088e8b8371d4e7175bb29';

/// Provider para el modo manual (null = automático, true = forzar online, false = forzar offline)
///
/// Copied from [ManualMode].
@ProviderFor(ManualMode)
final manualModeProvider = NotifierProvider<ManualMode, bool?>.internal(
  ManualMode.new,
  name: r'manualModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$manualModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ManualMode = Notifier<bool?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
