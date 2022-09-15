import 'package:flutter/material.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

class MixerCardViewmodel extends ChangeNotifier {
  final _mixersListScreenViewmodel = serviceLocator<MixersListScreenViewmodel>();
  final _shipmentDataRepository = serviceLocator<ShipmentDataRepository>();

  List<int> _shipmentsCoutns = <int>[];
  List<Mixer> _mixers = <Mixer>[];

  List<Mixer> get mixers => _mixers;

  List<int> get shipmentsCoutns => _shipmentsCoutns;

  loadShipmentsCounts() async {
    await _loadCounts();
  }

  loadMixers() {
    _mixers = _mixersListScreenViewmodel.mixers;
    notifyListeners();
  }

  Future<void> _loadCounts() async {
    final List<int> ints = [];

    // for (var mixer in _mixers) {
    //   final value = await _shipmentDataRepository
    //       .retrieveNumberOfShipmentsByMixerId(mixer.id);
    //   ints.add(value);
    // }
    _shipmentsCoutns = ints;
    notifyListeners();
  }
}
