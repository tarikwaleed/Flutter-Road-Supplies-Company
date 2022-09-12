import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

abstract class ShipmentDataRepository {
  Future<List<Shipment>> retrieveShipmentsByMixerId(String? mixerId);

  Future<int> retrieveNumberOfShipmentsByMixerId(String? mixerId);

  void addShipment(dynamic shipment);

  void updateShipment(String? shipmentId, dynamic shipment);

  removeShipment(Shipment shipment);
}
