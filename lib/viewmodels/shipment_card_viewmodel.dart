import 'package:salah_construction/datarepos/client_data_repository.dart';

class ShipmentCardViewmodel {
  final _clientDataRepo = ClientDataRepository();

  Future<String> clientName(String? clientId) async {
    return await _clientDataRepo.getClientName(clientId);
  }
}
