// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'5932c5dd65b6350254ddf0bcc6d4d9265d52e6d2';

/// Provider para obtener categorías (online u offline)
///
/// Copied from [categories].
@ProviderFor(categories)
final categoriesProvider =
    AutoDisposeFutureProvider<BuiltList<Category>>.internal(
      categories,
      name: r'categoriesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$categoriesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesRef = AutoDisposeFutureProviderRef<BuiltList<Category>>;
String _$categoryWordsHash() => r'528d3686766d4aef2900942b8fa3ffefa73af883';

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

/// Provider para obtener palabras de una categoría
///
/// Copied from [categoryWords].
@ProviderFor(categoryWords)
const categoryWordsProvider = CategoryWordsFamily();

/// Provider para obtener palabras de una categoría
///
/// Copied from [categoryWords].
class CategoryWordsFamily extends Family<AsyncValue<BuiltSet<String>>> {
  /// Provider para obtener palabras de una categoría
  ///
  /// Copied from [categoryWords].
  const CategoryWordsFamily();

  /// Provider para obtener palabras de una categoría
  ///
  /// Copied from [categoryWords].
  CategoryWordsProvider call(String categoryId) {
    return CategoryWordsProvider(categoryId);
  }

  @override
  CategoryWordsProvider getProviderOverride(
    covariant CategoryWordsProvider provider,
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
  String? get name => r'categoryWordsProvider';
}

/// Provider para obtener palabras de una categoría
///
/// Copied from [categoryWords].
class CategoryWordsProvider
    extends AutoDisposeFutureProvider<BuiltSet<String>> {
  /// Provider para obtener palabras de una categoría
  ///
  /// Copied from [categoryWords].
  CategoryWordsProvider(String categoryId)
    : this._internal(
        (ref) => categoryWords(ref as CategoryWordsRef, categoryId),
        from: categoryWordsProvider,
        name: r'categoryWordsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$categoryWordsHash,
        dependencies: CategoryWordsFamily._dependencies,
        allTransitiveDependencies:
            CategoryWordsFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  CategoryWordsProvider._internal(
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
    FutureOr<BuiltSet<String>> Function(CategoryWordsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryWordsProvider._internal(
        (ref) => create(ref as CategoryWordsRef),
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
  AutoDisposeFutureProviderElement<BuiltSet<String>> createElement() {
    return _CategoryWordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryWordsProvider && other.categoryId == categoryId;
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
mixin CategoryWordsRef on AutoDisposeFutureProviderRef<BuiltSet<String>> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _CategoryWordsProviderElement
    extends AutoDisposeFutureProviderElement<BuiltSet<String>>
    with CategoryWordsRef {
  _CategoryWordsProviderElement(super.provider);

  @override
  String get categoryId => (origin as CategoryWordsProvider).categoryId;
}

String _$selectedCategoryHash() => r'07f75150deb065d9134d05ff2aefc4c9a4e101df';

/// Provider para la categoría seleccionada
///
/// Copied from [SelectedCategory].
@ProviderFor(SelectedCategory)
final selectedCategoryProvider =
    NotifierProvider<SelectedCategory, Category?>.internal(
      SelectedCategory.new,
      name: r'selectedCategoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedCategoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedCategory = Notifier<Category?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
