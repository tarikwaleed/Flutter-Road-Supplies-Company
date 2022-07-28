import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/source_model.dart' as sourcemodel;

class SourceDBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<sourcemodel.Source>> retrieveSources() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("sources").get();
    return snapshot.docs
        .map((docSnapshot) => sourcemodel.Source.fromFirestore(docSnapshot))
        .toList();
  }
}
