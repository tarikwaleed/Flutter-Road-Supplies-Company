import 'package:flutter/material.dart';
import 'package:salah_construction/models/models.dart';

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
                  Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "17/08/2022",
                        // shipment.date.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.fire_truck),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        // "9060",
                        shipment.vehicleNumber.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "الحاج العربي",
                        style: Theme.of(context).textTheme.bodyText2,
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
