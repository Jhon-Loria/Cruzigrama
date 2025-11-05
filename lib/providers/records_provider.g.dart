// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaderboardHash() => r'a0964c0aff135a2453842ce92adc39afb155b154';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider para obtener el leaderboard de una categoría
///
/// Copied from [leaderboard].
@ProviderFor(leaderboard)
const leaderboardProvider = LeaderboardFamily();

/// Provider para obtener el leaderboard de una categoría
///
/// Copied from [leaderboard].
class LeaderboardFamily extends Family<AsyncValue<BuiltList<GameRecord>>> {
  /// Provider para obtener el leaderboard de una categoría
  ///
  /// Copied from [leaderboard].
  const LeaderboardFamily();

  /// Provider para obtener el leaderboard de una categoría
  ///
  /// Copied from [leaderboard].
  LeaderboardProvider call(String categoryId) {
    return LeaderboardProvider(categoryId);
  }

  @override
  LeaderboardProvider getProviderOverride(
    covariant LeaderboardProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'leaderboardProvider';
}

/// Provider para obtener el leaderboard de una categoría
///
/// Copied from [leaderboard].
class LeaderboardProvider
    extends AutoDisposeFutureProvider<BuiltList<GameRecord>> {
  /// Provider para obtener el leaderboard de una categoría
  ///
  /// Copied from [leaderboard].
  LeaderboardProvider(String categoryId)
    : this._internal(
        (ref) => leaderboard(ref as LeaderboardRef, categoryId),
        from: leaderboardProvider,
        name: r'leaderboardProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$leaderboardHash,
        dependencies: LeaderboardFamily._dependencies,
        allTransitiveDependencies: LeaderboardFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  LeaderboardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  Override overrideWith(
    FutureOr<BuiltList<GameRecord>> Function(LeaderboardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LeaderboardProvider._internal(
        (ref) => create(ref as LeaderboardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BuiltList<GameRecord>> createElement() {
    return _LeaderboardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeaderboardProvider && other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LeaderboardRef on AutoDisposeFutureProviderRef<BuiltList<GameRecord>> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _LeaderboardProviderElement
    extends AutoDisposeFutureProviderElement<BuiltList<GameRecord>>
    with LeaderboardRef {
  _LeaderboardProviderElement(super.provider);

  @override
  String get categoryId => (origin as LeaderboardProvider).categoryId;
}

String _$saveRecordHash() => r'14608349491fecfefbf517103cfc020dc5a4c21d';

/// Provider para guardar un record
///
/// Copied from [SaveRecord].
@ProviderFor(SaveRecord)
final saveRecordProvider =
    AutoDisposeAsyncNotifierProvider<SaveRecord, bool>.internal(
      SaveRecord.new,
      name: r'saveRecordProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$saveRecordHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SaveRecord = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
