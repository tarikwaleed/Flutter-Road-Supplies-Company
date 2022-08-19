import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/ui/screens/screens.dart';

class ShipmentsList extends StatelessWidget {
  const ShipmentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final listOfShipments = context
    //     .select<List<Shipment>, List<Shipment>>((shipments) => shipments);
    final listOfShipments = context
        .watch<List<Shipment>>();

    if (listOfShipments.isNotEmpty) {
      return ListView.separated(
        itemCount: listOfShipments.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ShipmentCard(shipment: listOfShipments[index]),
          );
        },
      );
    }
    if (listOfShipments.isEmpty) {
      return EmptyShipmentList();
    }
    return Center(child: CircularProgressIndicator());
  }
}
