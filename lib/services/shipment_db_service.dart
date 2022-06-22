import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salah_construction/models/shipment_model.dart';

class ShipmentDBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Shipment>> retrieveShipmentsByMixerId(String mixerId) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection("shipments")
        .where("mixer_id", isEqualTo: mixerId)
        .get();
    return snapshot.docs
        .map((docSnapshot) => Shipment.fromFirestore(docSnapshot))
        .toList();
  }

  addShipment(Shipment shipment) async {
    await _db.collection("shipments").add(shipment.toFirestore());
  }
}
