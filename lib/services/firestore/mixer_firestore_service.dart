import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/dtos/dtos.dart';

class MixerFirestoreService implements MixerDataRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Mixer>> retrieveMixers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("mixers").get();
    return snapshot.docs
        .map((docSnapshot) => Mixer.fromFirestore(docSnapshot))
        .toList();
  }

  Future<Mixer> getOne(String mixerId) async {
    final docSnapshot = await _db.collection("mixers").doc(mixerId).get();
    DocumentSnapshot<Map<String, dynamic>>? data = docSnapshot;
    Mixer mixer = Mixer.fromFirestore(data);
    return mixer;
  }

  Future<void> deleteMixer(String documentId) async {
    await _db.collection("mixers").doc(documentId).delete();
  }

  void addMixer(Mixer mixer) async {
    await _db.collection("mixers").add(mixer.toFirestore());
  }
}
