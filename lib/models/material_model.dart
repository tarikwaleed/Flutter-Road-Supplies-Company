import 'package:cloud_firestore/cloud_firestore.dart';

class Material {
  final String? id;
  final String name;

  Material({
    this.id,
    required this.name,
  });

  Material.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : name = snapshot.data()?["name"],
        id = snapshot.id;

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }
}
