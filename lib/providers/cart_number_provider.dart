import 'package:flutter/material.dart';

class CartNumberProvider extends ChangeNotifier {
  String _cartNumber = '';

  String get cartNumber => _cartNumber;

  setCartNumber(String cartNumber) {
    _cartNumber = cartNumber;
    notifyListeners();
  }
}
