import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salah_construction/datarepos/shipment_data_repo.dart';
import 'package:salah_construction/dtos/dtos.dart';

class ShipmentFirestoreService implements ShipmentDataRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<List<Shipment>> retrieveShipmentsByMixerId(String mixerId) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection("shipments")
        .where("mixer_id", isEqualTo: mixerId)
        .get();
    return snapshot.docs
        .map((docSnapshot) => Shipment.fromFirestore(docSnapshot))
        .toList();
  }

  @override
  Future<int> retrieveNumberOfShipmentsByMixerId(String? mixerId) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection("shipments")
        .where("mixer_id", isEqualTo: mixerId)
        .get();
    return snapshot.docs.length;
  }

  @override
  void addShipment(dynamic shipment) async {
    await _db.collection("shipments").add(shipment.toFirestore());
  }

  @override
  void updateShipment(String? shipmentId, dynamic shipment) async {
    await _db
        .collection("shipments")
        .doc(shipmentId)
        .update(shipment.toFirestore());
  }

  @override
  removeShipment(Shipment shipment) {
    throw UnimplementedError();
  }
}
