import 'package:flutter/material.dart';
import 'package:salah_construction/models/models.dart';
import 'package:salah_construction/ui/components/components.dart';

class ShipmentCard extends StatelessWidget {
  const ShipmentCard({
    Key? key,
    required this.shipment,
  }) : super(key: key);
  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(context, '/shipment_item_screen');
      // },
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          child: Container(
            height: 200,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Column(
                children: [
                  // Date Row 📅
                  ShipmentCardRow(
                      icon: Icon(Icons.calendar_month), text: "17/08/2020"),
                  SizedBox(
                    height: 10,
                  ),
                  // VehicleNumber Row 🚛🔢
                  ShipmentCardRow(icon: Icon(Icons.fire_truck), text: "6070"),
                  SizedBox(
                    height: 10,
                  ),
                  // ClientName Row 🧔
                  ShipmentCardRow(
                      icon: Icon(Icons.person), text: "الحاج العربي"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
