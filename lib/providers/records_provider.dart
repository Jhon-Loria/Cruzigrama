import 'package:built_collection/built_collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'supabase_provider.dart';

part 'records_provider.g.dart';

class GameRecord {
  final String id;
  final String categoryId;
  final String categoryName;
  final String playerName;
  final int timeSeconds;
  final DateTime completedAt;
  final int? ranking;

  GameRecord({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.playerName,
    required this.timeSeconds,
    required this.completedAt,
    this.ranking,
  });

  String get formattedTime {
    final minutes = timeSeconds ~/ 60;
    final seconds = timeSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// Provider para obtener el leaderboard de una categoría
@riverpod
Future<BuiltList<GameRecord>> leaderboard(
  LeaderboardRef ref,
  String categoryId,
) async {
  final supabase = ref.read(supabaseProvider);
  if (supabase == null) {
    // En modo offline, retornar lista vacía
    return BuiltList<GameRecord>();
  }

  try {
    final response = await supabase
        .from('scores')
        .select('''
          id,
          nombre_jugador,
          tiempo_segundos,
          fecha_completado,
          categoria_id,
          categorias: categorias(id, nombre)
        ''')
        .eq('categoria_id', categoryId)
        .order('tiempo_segundos', ascending: true)
        .limit(100);

    final records = <GameRecord>[];
    for (var i = 0; i < response.length; i++) {
      final data = response[i];
      final categoryData = data['categorias'] as Map<String, dynamic>?;
      
      records.add(GameRecord(
        id: data['id'].toString(),
        categoryId: data['categoria_id'].toString(),
        categoryName: categoryData?['nombre'] ?? 'Desconocida',
        playerName: data['nombre_jugador'],
        timeSeconds: data['tiempo_segundos'],
        completedAt: DateTime.parse(data['fecha_completado']),
        ranking: i + 1,
      ));
    }

    return records.toBuiltList();
  } catch (e) {
    print('Error obteniendo leaderboard: $e');
    return BuiltList<GameRecord>();
  }
}

/// Provider para guardar un record
@riverpod
class SaveRecord extends _$SaveRecord {
  @override
  FutureOr<bool> build() => false;

  Future<bool> save({
    required String categoryId,
    required String playerName,
    required int timeSeconds,
  }) async {
    final supabase = ref.read(supabaseProvider);
    if (supabase == null) {
      // En modo offline, guardar localmente (opcional)
      return false;
    }

    try {
      await supabase.from('scores').insert({
        'categoria_id': categoryId,
        'nombre_jugador': playerName,
        'tiempo_segundos': timeSeconds,
        'fecha_completado': DateTime.now().toIso8601String(),
      });

      // Invalidar el leaderboard para refrescar
      ref.invalidate(leaderboardProvider(categoryId));
      
      state = AsyncValue.data(true);
      return true;
    } catch (e) {
      print('Error guardando record: $e');
      state = AsyncValue.data(false);
      return false;
    }
  }
}

