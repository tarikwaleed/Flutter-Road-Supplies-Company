import 'package:flutter/material.dart';
import 'package:salah_construction/navigation/shipment_item_screen_arguments.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/viewmodels/shipment_card_viewmodel.dart';

class ShipmentCard extends StatefulWidget {
  const ShipmentCard({
    Key? key,
    required this.shipment,
  }) : super(key: key);
  final Shipment shipment;

  @override
  State<ShipmentCard> createState() => _ShipmentCardState();
}

class _ShipmentCardState extends State<ShipmentCard> {
  final shipmentCardViewmodel = serviceLocator<ShipmentCardViewmodel>();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/shipment_item_screen',arguments: ShipmentItemScreenArguments(mixer: mixer, isUpdating: isUpdating));
      },
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
                      text: shipmentCardViewmodel
                          .shipmentDate(widget.shipment.date)),
                  SizedBox(
                    height: 10,
                  ),
                  // VehicleNumber 🚛🔢
                  //todo: VehicleNumber
                  ShipmentCardRow(
                      icon: Icon(Icons.fire_truck),
                      text: widget.shipment.vehicleNumber.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  // ClientName  🧔
                  //todo:ClientName
                  FutureBuilder(
                    future: shipmentCardViewmodel
                        .clientName(widget.shipment.clientId),
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
