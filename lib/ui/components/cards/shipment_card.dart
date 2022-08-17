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
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.calendar_month),
                      Expanded(
                          child: Text(
                        "17/08/2022",
                        style: Theme.of(context).textTheme.bodyText2,
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.fire_truck),
                      Expanded(
                          child: Text(
                            "9060",
                            style: Theme.of(context).textTheme.bodyText2,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person),
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
