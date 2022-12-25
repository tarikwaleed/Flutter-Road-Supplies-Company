import 'package:flutter/material.dart';
import 'package:salah_construction/services/service_locator.dart';
import "package:stacked/stacked.dart";
import 'mixer_barrel.dart';

class MixersDataBucket with ReactiveServiceMixin {
  final _mixersDataRepository = serviceLocator<MixerDataRepository>();
  var _listOfMixers = <MixerDTO>[];
  final _mixers = ReactiveValue<List<MixerDTO>>(_listOfMixers);

  _loadMixers() async {
    final listOfMixers = await _mixersDataRepository.retrieveMixers();
    _listOfMixers = listOfMixers;
  }
}
