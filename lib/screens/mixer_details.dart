import 'package:flutter/material.dart';
import 'package:salah_construction/components/add_shipment_popup.dart';
import 'package:salah_construction/components/shipment_list_future.dart';
import 'package:salah_construction/models/shipment_model.dart';
import '../services/shipment_db_service.dart';

class MixerDetailsScreen extends StatefulWidget {
  final dynamic mixerData;

  const MixerDetailsScreen({Key? key, required this.mixerData})
      : super(key: key);

  @override
  State<MixerDetailsScreen> createState() => _MixerDetailsScreenState();
}

class _MixerDetailsScreenState extends State<MixerDetailsScreen> {
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
      body: ShipmentListFuture(mixerData: widget.mixerData),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddShipmentPopup().showAddShipmentPopup(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

// TODO: Move it to a separate class , don't use helper methods this way again
}
