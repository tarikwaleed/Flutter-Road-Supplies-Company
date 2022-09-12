import 'package:flutter/material.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

class MixerDetailsScreenViewmodel extends ChangeNotifier {
  final _shipmentDataRepository = serviceLocator<ShipmentDataRepository>();

  Mixer _mixer = Mixer.empty();
  List<Shipment> _shipments = <Shipment>[];

  Mixer get mixer => _mixer;

  List<Shipment> get shipments => _shipments;

  setMixer(Mixer mixer) {
    _mixer = mixer;
    notifyListeners();
  }

  loadShipments(Mixer mixer) async {
    await _shipmentDataRepository.retrieveShipmentsByMixerId(mixer.id);
    notifyListeners();
  }
}
