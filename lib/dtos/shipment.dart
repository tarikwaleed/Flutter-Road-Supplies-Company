import 'package:cloud_firestore/cloud_firestore.dart';

class Shipment {
  final String? id;
  final String? mixerId;
  final num carriagePrice;
  final String? cartNumber;
  final String? vehicleNumber;
  final Timestamp date;
  final String? materialId;
  final num materialPrice;
  final String? sourceId;
  final num totalPrice;
  final num volume;
  final String? clientId;

  Shipment({
    this.id,
    required this.materialPrice,
    required this.mixerId,
    required this.carriagePrice,
    required this.cartNumber,
    required this.vehicleNumber,
    required this.date,
    required this.materialId,
    required this.sourceId,
    required this.totalPrice,
    required this.volume,
    required this.clientId,
  });

  // todo:1 implement factory named method Shipment.default
  factory Shipment.empty() => Shipment(
        materialPrice: 0,
        mixerId: "",
        carriagePrice: 0,
        cartNumber: "",
        vehicleNumber: "",
        date: Timestamp.fromDate(DateTime.now()),
        materialId: "",
        sourceId: "",
        totalPrice: 0,
        volume: 0,
        clientId: "",
      );

  Shipment.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  )   : id = snapshot.id,
        materialPrice = snapshot.data()?["material_price"],
        mixerId = snapshot.data()?["mixer_id"],
        carriagePrice = snapshot.data()?["carriage_price"],
        cartNumber = snapshot.data()?["cart_number"],
        vehicleNumber = snapshot.data()?["vehicle_number"],
        date = snapshot.data()?["date"],
        materialId = snapshot.data()?["material_id"],
        sourceId = snapshot.data()?["source_id"],
        totalPrice = snapshot.data()?["total_price"],
        volume = snapshot.data()?['volume'],
        clientId = snapshot.data()?['client_id'];

  Map<String, dynamic> toFirestore() {
    return {
      "material_price": materialPrice,
      "mixer_id": mixerId,
      "carriage_price": carriagePrice,
      "cart_number": cartNumber,
      "vehicle_number": vehicleNumber,
      "date": date,
      "material_id": materialId,
      "source_id": sourceId,
      "total_price": totalPrice,
      "volume": volume,
      "client_id": clientId,
    };
  }
}
