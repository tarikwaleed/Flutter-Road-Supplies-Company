import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/client_model.dart';

class ClientDBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Client>> retrieveClients() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("clients").get();
    return snapshot.docs
        .map((docSnapshot) => Client.fromFirestore(docSnapshot))
        .toList();
  }

  Future<void> deleteClient(String documentId) async {
    await _db.collection("clients").doc(documentId).delete();
  }

  addClient(Client client) async {
    await _db.collection("clients").add(client.toFirestore());
  }
}
