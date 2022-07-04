import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'components.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../services/services.dart';

class AddShipmentPopup extends StatelessWidget {
  final String mixerId;

  AddShipmentPopup({
    required this.mixerId,
  });

  show(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    CarriagePriceProvider carriagePriceProvider =
        Provider.of<CarriagePriceProvider>(context);
    // todo: don't use the external package
    Alert(
        context: context,
        title: "اضافة نقلة",
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              CarriagePriceTextFormField(),
              Text("Carriage Price is: ${carriagePriceProvider.carriagePrice}"),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Shipment shipment = Shipment(
                // materialPrice: 1,
                // mixerId: mixerId,
                // carriagePrice: 1,
                // cartNumber: '1',
                // vehicleNumber: 'a',
                // // date: ,
                // materialId: '1',
                // sourceId: '1',
                // totalPrice: 1,
                // volume: 1,
                // );
                // ShipmentDBService db = ShipmentDBService();
                // db.addShipment(shipment);
              }
            },
            child: Text("اضافة", style: Theme.of(context).textTheme.button),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
