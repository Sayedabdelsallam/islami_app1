import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioMangerProvider extends ChangeNotifier {
  String? _currentPlayingUrl;
  bool isPlaying = false;
  final AudioPlayer _player = AudioPlayer();
  double? _currentVolume = 2.0;

  String? get currentPlayingUrl => _currentPlayingUrl;

  /// play
  Future<void> play(String url) async {
    if (_currentPlayingUrl == url) {
      isPlaying ? await _player.pause() : await _player.resume();
      isPlaying = !isPlaying;
    } else {
      await _player.stop();
      _currentPlayingUrl = url;
      await _player.play(
        UrlSource(url),
        volume: _currentVolume,
      );
      isPlaying = true;
    }
    notifyListeners();
  }

  /// stop

  Future<void> stop() async {
    await _player.stop();
    _currentPlayingUrl = null;
    isPlaying = false;
    notifyListeners();
  }

  /// volume

  Future<void> setVolume(double volume) async {
    _currentVolume = volume;
    await _player.setVolume(volume);
    notifyListeners();
  }
}
