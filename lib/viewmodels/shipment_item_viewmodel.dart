//todo:2 implement class ShipmentItemViewModel

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salah_construction/dtos/dtos.dart';

class ShipmentItemViewmodel extends ChangeNotifier {
  Shipment _shipment = Shipment.empty();
  String _mixerId = '';
  num _carriagePrice = 0;
  String _cartNumber = '';
  String _vehicleNumber = '';
  Timestamp _date = Timestamp.fromDate(DateTime.now());
  String _materialId = '';
  num _materialPrice = 0;
  String _sourceId = '';
  num _totalPrice = 0;
  num _volume = 0;
  String _clientId = '';

  Shipment get shipment => _shipment;

  set shipment(Shipment value) {
    _shipment = value;
    notifyListeners();
  }

  String get mixerId => _mixerId;

  set mixerId(String value) {
    _mixerId = value;
    notifyListeners();
  }

  num get carriagePrice => _carriagePrice;

  set carriagePrice(num value) {
    _carriagePrice = value;
    notifyListeners();
  }

  String get cartNumber => _cartNumber;

  set cartNumber(String value) {
    _cartNumber = value;
    notifyListeners();
  }

  String get vehicleNumber => _vehicleNumber;

  set vehicleNumber(String value) {
    _vehicleNumber = value;
    notifyListeners();
  }

  Timestamp get date => _date;

  set date(Timestamp value) {
    _date = value;
    notifyListeners();
  }

  String get materialId => _materialId;

  set materialId(String value) {
    _materialId = value;
    notifyListeners();
  }

  num get materialPrice => _materialPrice;

  set materialPrice(num value) {
    _materialPrice = value;
    notifyListeners();
  }

  String get sourceId => _sourceId;

  set sourceId(String value) {
    _sourceId = value;
    notifyListeners();
  }

  num get totalPrice => _totalPrice;

  set totalPrice(num value) {
    _totalPrice = value;
    notifyListeners();
  }

  num get volume => _volume;

  set volume(num value) {
    _volume = value;
    notifyListeners();
  }

  String get clientId => _clientId;

  set clientId(String value) {
    _clientId = value;
    notifyListeners();
  }
}
