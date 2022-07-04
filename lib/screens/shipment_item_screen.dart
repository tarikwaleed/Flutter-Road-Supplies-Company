import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/shipment_date_provider.dart';

class ShipmentItemScreen extends StatefulWidget {
  final dynamic mixerId;

  const ShipmentItemScreen({
    Key? key,
    required this.mixerId,
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
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {},
          ),
          Text(shipmentDateProvider.shipmentDate.toString())
        ],
      ),
    );
  }
}
