import 'package:flutter/material.dart';

class CarriagePriceProvider extends ChangeNotifier {
  int _carriagePrice = 0;

  get carriagePrice => _carriagePrice;

  setCarriagePrice(int value) {
    _carriagePrice = value;
    notifyListeners();
  }
}
