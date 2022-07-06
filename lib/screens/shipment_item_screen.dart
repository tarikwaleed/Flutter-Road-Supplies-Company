import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/components/components.dart';
import 'package:salah_construction/providers/shipment_date_provider.dart';

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
    var shipmentDateProvider = Provider.of<ShipmentDateProvider>(context);
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
          ],
        ),
      ),
    );
  }
}
