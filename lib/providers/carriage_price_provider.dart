import 'package:flutter/material.dart';

class CarriagePriceProvider extends ChangeNotifier {
  num _carriagePrice = 0;

  get carriagePrice => _carriagePrice;

  setCarriagePrice(num value) {
    _carriagePrice = value;
    notifyListeners();
  }
}
