import 'package:flutter/material.dart';

class VehicleNumberProvider extends ChangeNotifier {
  String _vehicleNumber = '';

  String get vehicleNumber => _vehicleNumber;

  setVehicleNumber(String value) {
    _vehicleNumber = value;
    notifyListeners();
  }
}
