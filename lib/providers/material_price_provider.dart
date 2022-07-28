import 'package:flutter/material.dart';

class MaterialPriceProvider extends ChangeNotifier {
  int _materialPrice = 0;

  int get materialPrice => _materialPrice;

  setMaterialPrice(int value) {
    _materialPrice = value;
    notifyListeners();
  }
}
