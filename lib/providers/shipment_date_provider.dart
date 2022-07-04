import 'package:flutter/material.dart';

class ShipmentDateProvider extends ChangeNotifier {
  DateTime _shipmentDate = DateTime.now();

  DateTime get shipmentDate => _shipmentDate;

  setShipmentDate(DateTime value) {
    _shipmentDate = value;
    notifyListeners();
  }
}
