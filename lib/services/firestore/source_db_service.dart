import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salah_construction/dtos/source.dart' as sourcedto;

class SourceDBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<sourcedto.Source>> retrieveSources() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("sources").get();
    return snapshot.docs
        .map((docSnapshot) => sourcedto.Source.fromFirestore(docSnapshot))
        .toList();
  }
}
