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

class StatefulDialog extends StatefulWidget {
  @override
  _StatefulDialogState createState() => _StatefulDialogState();
}

class _StatefulDialogState extends State<StatefulDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool? isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Enter any text";
                        },
                        decoration:
                            InputDecoration(hintText: "Please Enter Text"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Choice Box"),
                          Checkbox(
                              value: isChecked,
                              onChanged: (checked) {
                                setState(() {
                                  isChecked = checked;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              title: Text('Stateful Dialog'),
              actions: <Widget>[
                InkWell(
                  child: Text('OK   '),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       child: Center(
  //         child: FlatButton(
  //             color: Colors.deepOrange,
  //             onPressed: () async {
  //               await showInformationDialog(context);
  //             },
  //             child: Text(
  //               "Stateful Dialog",
  //               style: TextStyle(color: Colors.white, fontSize: 16),
  //             )),
  //       ),
  //     ),
  //   );
  }
}
