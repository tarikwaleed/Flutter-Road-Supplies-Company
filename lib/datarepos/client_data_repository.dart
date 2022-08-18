import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

abstract class ClientDataRepository {
  factory ClientDataRepository() => ClientFirestoreService();

  Future<List<Client>> retrieveClients();

  Future<void> deleteClient(String documentId);

  Future<String> getClientName(String? clientId);

  addClient(Client client);
}
