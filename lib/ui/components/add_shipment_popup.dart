import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'components.dart';
import 'package:salah_construction/providers/providers.dart';

class AddShipmentPopup extends StatelessWidget {
  final String mixerId;

  AddShipmentPopup({
    required this.mixerId,
  });

  show(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    CarriagePriceProvider carriagePriceProvider =
        Provider.of<CarriagePriceProvider>(context);
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
    throw UnimplementedError();
  }
}
