import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/components/components.dart';
import 'package:salah_construction/models/models.dart';
import 'package:salah_construction/providers/providers.dart';
import '../services/services.dart';

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
  final shipmentDBService = ShipmentDBService();

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
          style: Theme.of(context).textTheme.headline6,
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
                final shipment = Shipment(
                  mixerId: widget.mixerData.id,
                  carriagePrice: carriagePriceProvider.carriagePrice,
                  cartNumber: cartNumberProvider.cartNumber,
                  clientId: clientIDProvider.clientId,
                  date: Timestamp.fromDate(shipmentDateProvider.shipmentDate),
                  materialId: materialProvider.materialId,
                  materialPrice: materialPriceProvider.materialPrice,
                  sourceId: sourceIDProvider.sourceId,
                  vehicleNumber: vehicleNumberProvider.vehicleNumber,
                  volume: volumeProvider.volume,
                  totalPrice: materialPriceProvider.materialPrice +
                      carriagePriceProvider.carriagePrice,
                );
                await shipmentDBService.addShipment(shipment);
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
