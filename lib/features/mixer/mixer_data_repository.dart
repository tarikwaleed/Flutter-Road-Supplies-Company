import 'package:salah_construction/dtos/dtos.dart';

abstract class MixerDataRepository {
  Future<List<MixerDTO>> retrieveMixers();

  Future<MixerDTO> getOne(String? mixerId);

  Future<void> deleteMixer(String documentId);

  void addMixer(MixerDTO mixer);
}
