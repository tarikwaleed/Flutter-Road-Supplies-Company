import 'package:cloud_firestore/cloud_firestore.dart';

class Mixer {
  final String? id;
  final String name;

  Mixer({
    this.id,
    required this.name,
  });

  Mixer.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  )   : name = snapshot.data()?["name"],
        id = snapshot.id;

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }
}