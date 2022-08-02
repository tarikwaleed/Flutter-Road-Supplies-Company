import 'package:flutter/material.dart';

class MaterialPriceProvider extends ChangeNotifier {
  num _materialPrice = 0;

  num get materialPrice => _materialPrice;

  setMaterialPrice(num value) {
    _materialPrice = value;
    notifyListeners();
  }
}
