import 'package:cloud_firestore/cloud_firestore.dart';

class MixerDTO {
  final String? id;
  final String name;

  MixerDTO({
    this.id,
    required this.name,
  });

  //Named Generative
  MixerDTO.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  )   : name = snapshot.data()?["name"],
        id = snapshot.id;

  //Named Factory
  factory MixerDTO.empty() => MixerDTO(name: "");

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }
}
