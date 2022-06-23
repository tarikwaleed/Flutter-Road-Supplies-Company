import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:salah_construction/components/add_shipment_popup.dart';
import 'package:salah_construction/models/models.dart';
import 'package:salah_construction/services/services.dart';
import '../components/components.dart';
import '../providers/providers.dart';

class MixerDetailsScreen extends StatefulWidget {
  final dynamic mixerData;

  const MixerDetailsScreen({Key? key, required this.mixerData})
      : super(key: key);

  @override
  State<MixerDetailsScreen> createState() => _MixerDetailsScreenState();
}

class _MixerDetailsScreenState extends State<MixerDetailsScreen> {
  // State of ShipmentDateTextFormField
  // todo: use provider to manage the state of shipmentDate and vehicleNumber

  // Future<void> _selectShipmentDate(BuildContext context) async {
  //   debugPrint("selectShipmentDate called");
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2015, 8),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //       shipmentDateController.text =
  //           DateFormat('yyyy/MM/dd').format(selectedDate);
  //     });
  //   }
  //   debugPrint("selected date is : $selectedDate");
  // }

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
          AddShipmentPopup(mixerId: widget.mixerData.id).show(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    debugPrint(widget.mixerData.id);
  }

// todo: Move it to a separate class , don't use helper methods this way again
}
