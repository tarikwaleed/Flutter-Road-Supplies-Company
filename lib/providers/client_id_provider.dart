import 'package:flutter/material.dart';

class ClientIDProvider extends ChangeNotifier {
  String? _clientId = '';

  String? get clientId => _clientId;

  setClientId(String? value) {
    _clientId = value;
    notifyListeners();
  }
}
