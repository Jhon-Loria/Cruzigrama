import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_provider.g.dart';

/// Provider para el temporizador del crucigrama
@Riverpod(keepAlive: true)
class GameTimer extends _$GameTimer {
  Timer? _timer;
  DateTime? _startTime;
  Duration _elapsed = Duration.zero;

  @override
  Duration build() => _elapsed;

  /// Inicia el temporizador
  void start() {
    if (_timer?.isActive ?? false) return; // Ya está corriendo
    
    _startTime = DateTime.now();
    _elapsed = Duration.zero;
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_startTime != null) {
        _elapsed = DateTime.now().difference(_startTime!);
        ref.invalidateSelf();
      }
    });
  }

  /// Detiene el temporizador
  Duration stop() {
    _timer?.cancel();
    _timer = null;
    
    if (_startTime != null) {
      _elapsed = DateTime.now().difference(_startTime!);
      _startTime = null;
    }
    
    ref.invalidateSelf();
    return _elapsed;
  }

  /// Reinicia el temporizador
  void reset() {
    _timer?.cancel();
    _timer = null;
    _startTime = null;
    _elapsed = Duration.zero;
    ref.invalidateSelf();
  }

  /// Obtiene el tiempo transcurrido en segundos
  int get elapsedSeconds => _elapsed.inSeconds;

  /// Verifica si el temporizador está corriendo
  bool get isRunning => _timer?.isActive ?? false;

  void dispose() {
    _timer?.cancel();
  }
}

