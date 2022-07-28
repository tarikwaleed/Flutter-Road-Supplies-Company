import 'package:cloud_firestore/cloud_firestore.dart';

class Source {
  final String? id;
  final String name;

  Source({
    this.id,
    required this.name,
  });

  Source.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : name = snapshot.data()?["name"],
        id = snapshot.id;

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }
}
