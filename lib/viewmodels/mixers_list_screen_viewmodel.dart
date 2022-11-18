import 'package:flutter/material.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

class MixersListScreenViewmodel extends ChangeNotifier {
  final _mixersDataRepo = serviceLocator<MixerDataRepository>();

  static List<Mixer> _mixers = <Mixer>[];

  List<Mixer> get mixers => _mixers;

  Future<void> loadMixers() async {
    _mixers = await _mixersDataRepo.retrieveMixers();
    notifyListeners();
  }
}
