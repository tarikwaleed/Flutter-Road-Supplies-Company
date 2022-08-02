import 'package:flutter/material.dart';

class VolumeProvider extends ChangeNotifier {
  num _volume = 0;

  num get volume => _volume;

  setVolume(num value) {
    _volume = value;
    notifyListeners();
  }
}
