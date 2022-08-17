import 'package:flutter/material.dart';

class MixerIDProvider extends ChangeNotifier {
  String _mixerId = '';

  String get mixerId => _mixerId;

  setMixerId(String value) {
    _mixerId = value;
    notifyListeners();
  }
}
