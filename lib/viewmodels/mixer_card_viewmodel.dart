import 'package:flutter/material.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

class MixerCardViewmodel extends ChangeNotifier {
  static final _mixersListViewmodel =
      serviceLocator<MixersListScreenViewmodel>();
  static final _mixers = _mixersListViewmodel.mixers;
  final _shipmentDataRepository = serviceLocator<ShipmentDataRepository>();

  List<int> _shipmentsCoutns = <int>[];

  List<int> get shipmentsCoutns => _shipmentsCoutns;

  loadShipmentsCounts() async {
    final List<int> ints = [];

    for (var mixer in _mixers) {
      final value = await _shipmentDataRepository
          .retrieveNumberOfShipmentsByMixerId(mixer.id);
      ints.add(value);
    }
    _shipmentsCoutns = ints;

    notifyListeners();
  }
}
