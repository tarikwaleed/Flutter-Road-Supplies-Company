import 'package:flutter/material.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/viewmodels/shipment_card_viewmodel.dart';

class ShipmentCard extends StatelessWidget {
  const ShipmentCard({
    Key? key,
    required this.shipment,
  }) : super(key: key);
  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    final shipmentCardViewmodel = ShipmentCardViewmodel();
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
                  // Date  📅
                  //todo: ShipmentDate
                  ShipmentCardRow(
                      icon: Icon(Icons.calendar_month),
                      text: shipmentCardViewmodel.shipmentDate(shipment.date)),
                  SizedBox(
                    height: 10,
                  ),
                  // VehicleNumber 🚛🔢
                  //todo: VehicleNumber
                  ShipmentCardRow(
                      icon: Icon(Icons.fire_truck),
                      text: shipment.vehicleNumber.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  // ClientName  🧔
                  //todo:ClientName
                  FutureBuilder(
                    future: shipmentCardViewmodel.clientName(shipment.clientId),
                    builder: (_, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        return ShipmentCardRow(
                            icon: Icon(Icons.person),
                            text: snapshot.data.toString());
                      }
                      return CircularProgressIndicator();
                    },
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
