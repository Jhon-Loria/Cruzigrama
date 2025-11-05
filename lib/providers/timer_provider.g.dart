// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameTimerHash() => r'c4527e4ce52c18cdbf68babf3a93d4e8da18454b';

/// Provider para el temporizador del crucigrama
///
/// Copied from [GameTimer].
@ProviderFor(GameTimer)
final gameTimerProvider = NotifierProvider<GameTimer, Duration>.internal(
  GameTimer.new,
  name: r'gameTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GameTimer = Notifier<Duration>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
