import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

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
  void initState() {
    //todo:5 shipmentItemViewmodel.shipment(this.shipment)
    shipmentCardViewmodel.loadClientName(widget.shipment.clientId);
    shipmentCardViewmodel.loadMixer(widget.shipment.mixerId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ShipmentItemScreenViewmodel, ShipmentCardViewmodel>(
      builder: (_, shipmentItemScreenViewmodel, shipmentCardViewmodel, __) =>
          GestureDetector(
        onTap: () {
          shipmentItemScreenViewmodel.setShipment(widget.shipment);

          Navigator.pushNamed(context, '/shipment_item_screen',
              arguments: shipmentCardViewmodel.mixer);
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
                    ShipmentCardRow(
                        icon: Icon(Icons.calendar_month),
                        text: shipmentCardViewmodel
                            .shipmentDate(widget.shipment.date)),
                    SizedBox(
                      height: 10,
                    ),
                    // VehicleNumber 🚛🔢
                    ShipmentCardRow(
                        icon: Icon(Icons.fire_truck),
                        text: widget.shipment.vehicleNumber.toString()),
                    SizedBox(
                      height: 10,
                    ),
                    // ClientName  🧔
                    ShipmentCardRow(
                        icon: Icon(Icons.person),
                        text: shipmentCardViewmodel.clientName),
                    // FutureBuilder(
                    //   future: shipmentCardViewmodel
                    //       .clientName(widget.shipment.clientId),
                    //   builder: (_, snapshot) {
                    //     if (snapshot.hasData &&
                    //         snapshot.connectionState ==
                    //             ConnectionState.done) {
                    //       return ShipmentCardRow(
                    //           icon: Icon(Icons.person),
                    //           text: snapshot.data.toString());
                    //     }
                    //     return CircularProgressIndicator();
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
