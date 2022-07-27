import 'package:flutter/material.dart';

class MaterialProvier extends ChangeNotifier {
  String? _materialId = "";

  String? get materialId => _materialId;

  setMaterialId(String? value) {
    _materialId = value;
    notifyListeners();
  }
}
