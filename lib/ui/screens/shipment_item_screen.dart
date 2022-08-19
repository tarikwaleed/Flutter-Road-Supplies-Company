import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/dtos/dtos.dart';

class ShipmentItemScreen extends StatefulWidget {
  final dynamic mixerData;

  const ShipmentItemScreen({
    Key? key,
    required this.mixerData,
  }) : super(key: key);

  @override
  State<ShipmentItemScreen> createState() => _ShipmentItemScreenState();
}

class _ShipmentItemScreenState extends State<ShipmentItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final shipmentDBService = ShipmentDataRepository();

  @override
  Widget build(BuildContext context) {
    // Those are the providers for each component of the screen
    // they're gonna be used to complete the addShipment process
    // they're gonna be accessed in the check button in the appBar
    final shipmentDateProvider = Provider.of<ShipmentDateProvider>(context);
    final vehicleNumberProvider = Provider.of<VehicleNumberProvider>(context);
    final cartNumberProvider = Provider.of<CartNumberProvider>(context);
    final materialProvider = Provider.of<MaterialProvier>(context);
    final materialPriceProvider = Provider.of<MaterialPriceProvider>(context);
    final carriagePriceProvider = Provider.of<CarriagePriceProvider>(context);
    final sourceIDProvider = Provider.of<SourceIDProvider>(context);
    final clientIDProvider = Provider.of<ClientIDProvider>(context);
    final volumeProvider = Provider.of<VolumeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.mixerData.name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                return showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('تأكيد اضافة نقلة'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                              'تأكيد اضافة نقلة الى الخلاطة\n ${widget.mixerData.name}',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('تأكيد'),
                          onPressed: () async {
                            final shipment = Shipment(
                              mixerId: widget.mixerData.id,
                              carriagePrice:
                                  carriagePriceProvider.carriagePrice,
                              cartNumber: cartNumberProvider.cartNumber,
                              clientId: clientIDProvider.clientId,
                              date: Timestamp.fromDate(
                                  shipmentDateProvider.shipmentDate),
                              materialId: materialProvider.materialId,
                              materialPrice:
                                  materialPriceProvider.materialPrice,
                              sourceId: sourceIDProvider.sourceId,
                              vehicleNumber:
                                  vehicleNumberProvider.vehicleNumber,
                              volume: volumeProvider.volume,
                              totalPrice: materialPriceProvider.materialPrice +
                                  carriagePriceProvider.carriagePrice,
                            );
                            shipmentDBService.addShipment(shipment);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("تم اضافة النقلة بنجاح"),
                              backgroundColor: Colors.green,
                            ));
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'الغاء',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Adding this sized box is a stupid, lazy fix but it works!
              SizedBox(
                height: 10,
              ),
              ShipmentDateTextFormField(),
              VehicleNumberTextFormField(),
              CartNumberTextFormField(),
              MaterialDropDownButtonFormField(),
              MaterialPriceTextFormField(),
              CarriagePriceTextFormField(),
              SourceDropDownButtonFormField(),
              VolumeTextFormField(),
              ClientDropDownButtonFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
