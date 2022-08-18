import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salah_construction/datarepos/client_data_repository.dart';

import 'package:salah_construction/dtos/dtos.dart';

class ClientFirestoreService implements ClientDataRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<List<Client>> retrieveClients() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("clients").get();
    return snapshot.docs
        .map((docSnapshot) => Client.fromFirestore(docSnapshot))
        .toList();
  }

  @override
  Future<void> deleteClient(String documentId) async {
    await _db.collection("clients").doc(documentId).delete();
  }

  @override
  addClient(Client client) async {
    await _db.collection("clients").add(client.toFirestore());
  }

  @override
  Future<String> getClientName(String? clientId) async {
    final doc = await _db.collection('clients').doc(clientId).get();
    return doc['name'];
  }
}
