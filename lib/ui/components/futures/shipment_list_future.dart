import 'package:flutter/material.dart';
import 'package:salah_construction/models/models.dart';
import 'package:salah_construction/services/services.dart';

class ShipmentListFuture extends StatefulWidget {
  final dynamic mixer;

  const ShipmentListFuture({Key? key, required this.mixer}) : super(key: key);

  @override
  State<ShipmentListFuture> createState() => _ShipmentListFutureState();
}

class _ShipmentListFutureState extends State<ShipmentListFuture> {
  ShipmentDBService shipmentDBService = ShipmentDBService();
  Future<List<Shipment>>? shipmentsListFuture;
  List<Shipment>? retrievedShipmentsList;

  Future<void> _refresh() async {
    shipmentsListFuture = shipmentDBService
        .retrieveShipmentsByMixerId(widget.mixer.id.toString());
    retrievedShipmentsList = await shipmentDBService
        .retrieveShipmentsByMixerId(widget.mixer.id.toString());
    setState(() {});
  }

  // void _dismiss() {
  //   shipmentsListFuture =
  //       shipmentDBService.retrieveShipmentsByMixerId(widget.mixer.id);
  // }

  Future<void> _initRetrieval() async {
    shipmentsListFuture = shipmentDBService
        .retrieveShipmentsByMixerId(widget.mixer.id.toString());
    retrievedShipmentsList = await shipmentDBService
        .retrieveShipmentsByMixerId(widget.mixer.id.toString());

    setState(() {});
    debugPrint(
        "retrieved shipment list is" + retrievedShipmentsList.toString());
  }

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: shipmentsListFuture,
          builder:
              (BuildContext context, AsyncSnapshot<List<Shipment>> snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                  itemCount: retrievedShipmentsList!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ListTile(
                        // onTap: () {
                        //   Navigator.pushNamed(context, '/mixer_details',
                        //       arguments: retrievedShipmentsList![index]);
                        // },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.blue),
                        ),
                        title: Text(
                          "رقم العربية: " +
                              retrievedShipmentsList![index]
                                  .vehicleNumber
                                  .toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          "رقم المقطورة: " +
                              retrievedShipmentsList![index]
                                  .cartNumber
                                  .toString(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        trailing: const Icon(Icons.arrow_right_sharp),
                      ),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.done &&
                retrievedShipmentsList!.isEmpty) {
              return Center(
                child: ListView(
                  children: const <Widget>[
                    Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'لا يوجد نقل',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
