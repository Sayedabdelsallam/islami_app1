import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioMangerProvider extends ChangeNotifier {
  String? _currentPlayingUrl;
  bool _isPlaying = false;
  final AudioPlayer _player = AudioPlayer();
  double? _currentVolume = 2.0;

  String? get currentPlayingUrl => _currentPlayingUrl;
  bool? get isPlaying => _isPlaying;
  double? get currentVolume => _currentVolume;

  /// play
  Future<void> play(String url) async {
    if (_currentPlayingUrl == url) {
      _isPlaying ? await _player.pause() : await _player.resume();
      _isPlaying = !_isPlaying;
    } else {
      await _player.stop();
      _currentPlayingUrl = url;

      await _player.play(
        UrlSource(url),
        volume: _currentVolume,
      );
      _isPlaying = true;
    }
    notifyListeners();
  }

  /// stop

  Future<void> stop() async {
    await _player.stop();
    _currentPlayingUrl = null;
    _isPlaying = false;
    notifyListeners();
  }

  /// volume

  Future<void> setVolume(double volume) async {
    _currentVolume = volume;
    await _player.setVolume(volume);
    notifyListeners();
  }
}
