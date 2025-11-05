import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'audio_provider.g.dart';

/// Provider para el control de música de fondo
@Riverpod(keepAlive: true)
class BackgroundMusic extends _$BackgroundMusic {
  AudioPlayer? _audioPlayer;
  bool _isPlaying = false;
  bool _isMuted = false;

  @override
  bool build() {
    // Cargar preferencia de mute
    _loadMutePreference();
    return _isMuted;
  }

  Future<void> _loadMutePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isMuted = prefs.getBool('music_muted') ?? false;
  }

  Future<void> _saveMutePreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('music_muted', _isMuted);
  }

  /// Inicia la música de fondo
  Future<void> startMusic() async {
    if (_isMuted) return;
    
    try {
      _audioPlayer ??= AudioPlayer();
      
      // Reproducir en loop
      // Nota: Necesitas agregar un archivo de música en assets/audio/soundtrack.mp3
      await _audioPlayer!.setReleaseMode(ReleaseMode.loop);
      await _audioPlayer!.play(AssetSource('audio/soundtrack.mp3'));
      
      _isPlaying = true;
    } catch (e) {
      print('Error iniciando música: $e');
      // Si no hay archivo de música, simplemente no reproduce
      _isPlaying = false;
    }
  }

  /// Detiene la música
  Future<void> stopMusic() async {
    await _audioPlayer?.stop();
    _isPlaying = false;
  }

  /// Alterna el estado de mute
  Future<void> toggleMute() async {
    _isMuted = !_isMuted;
    await _saveMutePreference();
    
    if (_isMuted) {
      await _audioPlayer?.pause();
    } else {
      if (_isPlaying) {
        await _audioPlayer?.resume();
      } else {
        await startMusic();
      }
    }
    
    ref.invalidateSelf();
  }

  bool get isMuted => _isMuted;
  bool get isPlaying => _isPlaying;

  void dispose() {
    _audioPlayer?.dispose();
  }
}

