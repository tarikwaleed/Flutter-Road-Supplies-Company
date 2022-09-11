//todo:2 implement class ShipmentItemViewModel

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

class ShipmentItemScreenViewmodel extends ChangeNotifier {
  final _clientDataRepo = serviceLocator<ClientDataRepository>();

  ///Gonna be set from when shipment card or FloatingActionButton in MixerDetailsScreen are clicked
  Shipment _shipment = Shipment.empty();

  ///Gonna be set when manually when creating a new Shipment objcet on ShipmentItemScreen
  String _mixerId = '';

  /// Gonna be set from CarriagePriceTextFormField onChange callback
  num _carriagePrice = 0;

  /// Gonna be set from CartNumberTextFormField onChange callback
  String _cartNumber = '';

  /// Gonna be set from VehicleNumberTextFormField onChange callback
  String _vehicleNumber = '';

  /// Gonna be set from ShpmentDateTextFormField
  Timestamp _date = Timestamp.fromDate(DateTime.now());

  ///Gonna be set from MaterialDropdownButtonFormField
  String _materialId = '';

  /// Gonna be set from MaterialPriceTextFormField
  num _materialPrice = 0;

  /// Gonna be set form SourceDropdownButtonFormField
  String _sourceId = '';

  ///Gonna be set when manually when creating a new Shipment objcet on ShipmentItemScreen
  num _totalPrice = 0;

  /// Gonna be set from VolumeTextFormField
  num _volume = 0;

  /// Gonna be set from ClientDropdownButtonFormField
  String? _clientId = '';

  /// Gonna be loaded from ShipmentItemScreen initState
  List<Client> _clients = <Client>[];

  /// Gonna be set form ShipmentCard and FloatingActionButton in MixerDetailsScreen
  bool _isUpdating = false;

  bool get isUpdating => _isUpdating;

  setIsUpdating(bool value) {
    _isUpdating = value;
    notifyListeners();
  }

  List<Client> get clients => _clients;

  void loadData() async {
    await _loadClients();
  }

  Shipment get shipment => _shipment;

  setShipment(Shipment value) {
    _shipment = value;
    notifyListeners();
  }

  String get mixerId => _mixerId;

  setMixerId(String value) {
    _mixerId = value;
    notifyListeners();
  }

  num get carriagePrice => _carriagePrice;

  setCarriagePrice(num value) {
    _carriagePrice = value;
    notifyListeners();
  }

  String get cartNumber => _cartNumber;

  setCartNumber(String value) {
    _cartNumber = value;
    notifyListeners();
  }

  String get vehicleNumber => _vehicleNumber;

  setVehicleNumber(String value) {
    _vehicleNumber = value;
    notifyListeners();
  }

  Timestamp get date => _date;

  setDate(Timestamp value) {
    _date = value;
    notifyListeners();
  }

  String get materialId => _materialId;

  setMaterialId(String value) {
    _materialId = value;
    notifyListeners();
  }

  num get materialPrice => _materialPrice;

  setMaterialPrice(num value) {
    _materialPrice = value;
    notifyListeners();
  }

  String get sourceId => _sourceId;

  setSourceId(String value) {
    _sourceId = value;
    notifyListeners();
  }

  num get totalPrice => _totalPrice;

  setTotalPrice(num value) {
    _totalPrice = value;
    notifyListeners();
  }

  num get volume => _volume;

  setVolume(num value) {
    _volume = value;
    notifyListeners();
  }

  String? get clientId => _clientId;

  setClientId(String? value) {
    _clientId = value;
    notifyListeners();
  }

  Future<void> _loadClients() async {
    _clients = await _clientDataRepo.retrieveClients();
    notifyListeners();
  }
}
