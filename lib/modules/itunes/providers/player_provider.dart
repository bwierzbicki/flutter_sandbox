import 'package:flutter/foundation.dart';

class PlayerProvider extends ChangeNotifier {
  bool _isPlaying;
  String _imageUrl;
  String _songUrl;

  bool get isPlaying => _isPlaying;

  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
    notifyListeners();
  }

  String get songUrl => _songUrl;

  set songUrl(String value) {
    _songUrl = value;
    notifyListeners();
  }
}
