import 'package:cloud_firestore/cloud_firestore.dart';

class Shipment {
  final String? id; //Done
  final String? mixerId; //Done
  final int carriagePrice; // Done
  final String? cartNumber; //Done
  final String? vehicleNumber; //Dene
  final Timestamp date; //Done
  final String? materialId; // Done
  final int materialPrice; // Done
  final String? sourceId; // Done
  final num totalPrice;
  final int volume; // Done
  final String? clientId; // In Progress

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
