import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/components/components.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/material_price_text_form_field.dart';
import 'package:salah_construction/providers/cart_number_provider.dart';
import 'package:salah_construction/providers/material_type_provider.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/providers/shipment_date_provider.dart';
import 'package:salah_construction/providers/vehicle_number_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    // Those are the providers for each component of the screen
    // they're gonna be used to complete the addShipment process
    // they're gonna be accessed in the check button in the appBar
    var shipmentDateProvider = Provider.of<ShipmentDateProvider>(context);
    var vehicleNumberProvider = Provider.of<VehicleNumberProvider>(context);
    final cartNumberProvider = Provider.of<CartNumberProvider>(context);
    final materialProvider = Provider.of<MaterialProvier>(context);
    final materialPriceProvider = Provider.of<MaterialPriceProvider>(context);
    final carriagePriceProvider = Provider.of<CarriagePriceProvider>(context);
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
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ShipmentDateTextFormField(),
            VehicleNumberTextFormField(),
            CartNumberTextFormField(),
            MaterialDropDownButtonFormField(),
            MaterialPriceTextFormField(),
            CarriagePriceTextFormField(),
          ],
        ),
      ),
    );
  }
}
