import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:salah_construction/datarepos/client_data_repository.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/services/services.dart';

class ShipmentCardViewmodel extends ChangeNotifier {
  final _clientDataRepo = serviceLocator<ClientDataRepository>();
  final _mixerDataRepo = serviceLocator<MixerDataRepository>();
  Mixer _mixer = Mixer(name: "");
  String _clientName = '';

  String get clientName => _clientName;

  Mixer get mixer => _mixer;

  loadMixer(String? mixerId) async {
    _mixer = await _mixerDataRepo.getOne(mixerId);
    notifyListeners();
  }

  loadClientName(String? clientId) async {
    _clientName = await _clientDataRepo.getClientName(clientId);
    notifyListeners();
  }

  String shipmentDate(Timestamp timestamp) {
    return DateFormat.yMMMMd().format(timestamp.toDate());
  }

  String vehicleNumber(int vehiclenumber) {
    return vehiclenumber.toString();
  }
}
