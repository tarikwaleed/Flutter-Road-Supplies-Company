import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salah_construction/datarepos/source_data_repository.dart';
import 'package:salah_construction/dtos/source.dart' as sourcedto;

class SourceFirestoreService implements SourceDataRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<List<sourcedto.Source>> retrieveSources() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("sources").get();
    return snapshot.docs
        .map((docSnapshot) => sourcedto.Source.fromFirestore(docSnapshot))
        .toList();
  }

  @override
  void addSource(dynamic source) async {
    await _db.collection("sources").add(source.toFirestore());
  }
}
