//todo:2 implement class ShipmentItemViewModel

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salah_construction/dtos/dtos.dart';

class ShipmentItemViewmodel extends ChangeNotifier {
  Shipment _shipment = Shipment.empty();
  String mixerId = '';
  num carriagePrice = 0;
  String cartNumber = '';
  String vehicleNumber = '';
  Timestamp date = Timestamp.fromDate(DateTime.now());
  String materialId = '';
  num materialPrice = 0;
  String sourceId = '';
  num totalPrice = 0;
  num volume = 0;
  String clientId = '';
}
