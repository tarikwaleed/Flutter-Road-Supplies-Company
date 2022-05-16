import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salah_construction/models/mixer_model.dart';

class MixerDBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Mixer>> retrieveMixers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("mixers").get();
    return snapshot.docs
        .map((snapshot) => Mixer.fromFirestore(snapshot))
        .toList();
  }

  Future<void> deleteMixer(String documentId) async {
    await _db.collection("mixers").doc(documentId).delete();
  }
}
