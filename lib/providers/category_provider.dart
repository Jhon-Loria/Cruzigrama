import 'package:built_collection/built_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../offline_data.dart';
import 'connectivity_provider.dart';
import 'supabase_provider.dart';

part 'category_provider.g.dart';

class Category {
  final String id;
  final String name;
  final String description;
  final bool isOnline;

  Category({
    required this.id,
    required this.name,
    required this.description,
    this.isOnline = false,
  });
}

/// Provider para obtener categorías (online u offline)
@riverpod
Future<BuiltList<Category>> categories(CategoriesRef ref) async {
  final shouldUseOnline = await ref.watch(shouldUseOnlineModeProvider.future);
  
  if (shouldUseOnline) {
    return await _getOnlineCategories(ref);
  } else {
    return _getOfflineCategories();
  }
}

/// Obtiene categorías desde Supabase
Future<BuiltList<Category>> _getOnlineCategories(CategoriesRef ref) async {
  final supabase = ref.read(supabaseProvider);
  if (supabase == null) {
    return _getOfflineCategories();
  }

  try {
    final response = await supabase
        .from('categorias')
        .select()
        .eq('activa', true)
        .order('nombre');

    final categories = response.map<Category>((data) {
      return Category(
        id: data['id'].toString(),
        name: data['nombre'],
        description: data['descripcion'] ?? '',
        isOnline: true,
      );
    }).toList();

    return categories.toBuiltList();
  } catch (e) {
    // Si falla, usar categorías offline
    print('Error obteniendo categorías online: $e');
    return _getOfflineCategories();
  }
}

/// Obtiene categorías offline
BuiltList<Category> _getOfflineCategories() {
  final offlineCats = getOfflineCategories();
  return offlineCats.map((cat) {
    return Category(
      id: cat.id,
      name: cat.name,
      description: cat.description,
      isOnline: false,
    );
  }).toBuiltList();
}

/// Provider para la categoría seleccionada
@Riverpod(keepAlive: true)
class SelectedCategory extends _$SelectedCategory {
  @override
  Category? build() => null;

  void selectCategory(Category category) {
    state = category;
  }

  void clear() {
    state = null;
  }
}

/// Provider para obtener palabras de una categoría
@riverpod
Future<BuiltSet<String>> categoryWords(
  CategoryWordsRef ref,
  String categoryId,
) async {
  final shouldUseOnline = await ref.watch(shouldUseOnlineModeProvider.future);
  
  if (shouldUseOnline) {
    final words = await _getOnlineWords(ref, categoryId);
    // Si no hay palabras en Supabase, usar offline
    if (words.isEmpty) {
      // Intentar obtener el nombre de la categoría seleccionada
      final selectedCategory = ref.read(selectedCategoryProvider);
      if (selectedCategory != null) {
        return _getOfflineWordsByName(selectedCategory.name);
      }
      return _getOfflineWords(categoryId);
    }
    return words;
  } else {
    return _getOfflineWords(categoryId);
  }
}

/// Obtiene palabras desde Supabase
Future<BuiltSet<String>> _getOnlineWords(
  CategoryWordsRef ref,
  String categoryId,
) async {
  final supabase = ref.read(supabaseProvider);
  if (supabase == null) {
    return _getOfflineWords(categoryId);
  }

  try {
    final response = await supabase
        .from('palabras')
        .select('palabra')
        .eq('categoria_id', categoryId);

    final words = response.map<String>((data) => data['palabra'] as String).toList();
    
    // Si no hay palabras en Supabase, intentar obtenerlas offline por nombre
    if (words.isEmpty) {
      // Obtener el nombre de la categoría desde Supabase
      try {
        final catResponse = await supabase
            .from('categorias')
            .select('nombre')
            .eq('id', categoryId)
            .single();
        
        final categoryName = catResponse['nombre'] as String;
        print('No hay palabras en Supabase para $categoryName, usando offline');
        return _getOfflineWordsByName(categoryName);
      } catch (e) {
        print('Error obteniendo nombre de categoría: $e');
        return BuiltSet<String>();
      }
    }
    
    return words.toBuiltSet();
  } catch (e) {
    print('Error obteniendo palabras online: $e');
    // Intentar obtener por nombre como fallback
    try {
      final catResponse = await supabase!
          .from('categorias')
          .select('nombre')
          .eq('id', categoryId)
          .single();
      final categoryName = catResponse['nombre'] as String;
      return _getOfflineWordsByName(categoryName);
    } catch (e2) {
      return _getOfflineWords(categoryId);
    }
  }
}

/// Obtiene palabras offline
BuiltSet<String> _getOfflineWords(String categoryId) {
  final words = getOfflineWordsForCategory(categoryId);
  return words.toBuiltSet();
}

/// Obtiene palabras offline por nombre de categoría (fallback)
BuiltSet<String> _getOfflineWordsByName(String categoryName) {
  final category = offlineCategories.firstWhere(
    (cat) => cat.name.toLowerCase() == categoryName.toLowerCase(),
    orElse: () => offlineCategories.first,
  );
  return category.words.map((w) => w.word).toBuiltSet();
}

