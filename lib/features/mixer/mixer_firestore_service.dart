import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/dtos/dtos.dart';

class MixerFirestoreService implements MixerDataRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<MixerDTO>> retrieveMixers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("mixers").get();
    return snapshot.docs
        .map((docSnapshot) => MixerDTO.fromFirestore(docSnapshot))
        .toList();
  }

  Future<MixerDTO> getOne(String? mixerId) async {
    final docSnapshot = await _db.collection("mixers").doc(mixerId).get();
    DocumentSnapshot<Map<String, dynamic>>? data = docSnapshot;
    MixerDTO mixer = MixerDTO.fromFirestore(data);
    return mixer;
  }

  Future<void> deleteMixer(String documentId) async {
    await _db.collection("mixers").doc(documentId).delete();
  }

  void addMixer(MixerDTO mixer) async {
    await _db.collection("mixers").add(mixer.toFirestore());
  }
}
