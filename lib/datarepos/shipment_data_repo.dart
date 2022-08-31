import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

abstract class ShipmentDataRepository {
  factory ShipmentDataRepository() => ShipmentFirestoreService();

  Future<List<Shipment>> retrieveShipmentsByMixerId(String mixerId);

  Future<int> retrieveNumberOfShipmentsByMixerId(String? mixerId);

  addShipment(Shipment shipment);

  removeShipment(Shipment shipment);
}