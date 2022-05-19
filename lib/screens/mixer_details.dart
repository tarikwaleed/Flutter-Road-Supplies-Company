import 'package:flutter/material.dart';
import 'package:salah_construction/models/mixer_model.dart';

import '../services/mixer_db_service.dart';

class MixerDetailsScreen extends StatefulWidget {
  final dynamic mixerData;

  const MixerDetailsScreen({Key? key, required this.mixerData})
      : super(key: key);

  @override
  State<MixerDetailsScreen> createState() => _MixerDetailsScreenState();
}

class _MixerDetailsScreenState extends State<MixerDetailsScreen> {
  ShipmentDBService shipmentDBService = ShipmentDBService();
  Future<List<Mixer>>? shipmentsListFuture;
  List<Mixer>? retrievedShipmentsList;

  Future<void> _refresh() async {
    shipmentsListFuture = shipmentDBService.retrieveMixers();
    retrievedShipmentsList = await shipmentDBService.retrieveMixers();
    setState(() {});
  }

  void _dismiss() {
    shipmentsListFuture = shipmentDBService.retrieveMixers();
  }

  Future<void> _initRetrieval() async {
    shipmentsListFuture = shipmentDBService.retrieveMixers();
    retrievedShipmentsList = await shipmentDBService.retrieveMixers();
  }

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "خلاطة ${widget.mixerData.name}",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
    );
  }
}
