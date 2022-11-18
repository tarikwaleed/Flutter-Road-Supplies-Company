import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

abstract class ClientDataRepository {
  // here we used factory constructor to return the concrete implementation
  // of the interface, service locators and dependency injection are another options

  Future<List<Client>> retrieveClients();

  Future<void> deleteClient(String documentId);

  Future<String> getClientName(String? clientId);

  addClient(Client client);
}
