import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  final String? id;
  final String name;

  Client({
    this.id,
    required this.name,
  });

  Client.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      )   : name = snapshot.data()?["name"],
        id = snapshot.id;

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }
}
