import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/dtos/dtos.dart';

class ShipmentsList extends StatelessWidget {
  const ShipmentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfShipments = context
        .select<List<Shipment>, List<Shipment>>((shipments) => shipments);
    if (listOfShipments.isNotEmpty) {
      return ListView.separated(
        itemCount: listOfShipments.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (_, index) {
          return ShipmentCard(shipment: listOfShipments[index]);
        },
      );
    } else if(listOfShipments.isEmpty){
      return Center(child: CircularProgressIndicator());
    }
  }
}
