import 'package:flutter/material.dart';

class VolumeProvider extends ChangeNotifier {
  int _volume = 0;

  int get volume => _volume;

  setVolume(int value) {
    _volume = value;
    notifyListeners();
  }
}
