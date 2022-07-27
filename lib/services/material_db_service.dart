import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class MaterialDBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Material>> retrieveMaterials() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("materials").get();
    return snapshot.docs
        .map((docSnapshot) => Material.fromFirestore(docSnapshot))
        .toList();
  }
}
