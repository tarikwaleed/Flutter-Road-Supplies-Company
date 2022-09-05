import 'package:salah_construction/dtos/dtos.dart';

abstract class MixerDataRepository {
  Future<List<Mixer>> retrieveMixers();

  Future<Mixer> getOne(String? mixerId);

  Future<void> deleteMixer(String documentId);

  void addMixer(Mixer mixer);
}
