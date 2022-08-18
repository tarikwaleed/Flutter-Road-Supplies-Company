import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:salah_construction/datarepos/client_data_repository.dart';

class ShipmentCardViewmodel {
  final _clientDataRepo = ClientDataRepository();

  Future<String> clientName(String? clientId) async {
    return await _clientDataRepo.getClientName(clientId);
  }

  String shipmentDate(Timestamp timestamp) {
    return DateFormat.yMMMMd().format(timestamp.toDate());
  }

  String vehicleNumber(int vehiclenumber) {
    return vehiclenumber.toString();
  }
}
