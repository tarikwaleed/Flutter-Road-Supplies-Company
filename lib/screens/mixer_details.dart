import 'package:flutter/material.dart';
import 'package:salah_construction/components/add_shipment_popup.dart';
import 'package:salah_construction/models/shipment_model.dart';
import '../services/shipment_db_service.dart';

class MixerDetailsScreen extends StatefulWidget {
  final dynamic mixerData;

  const MixerDetailsScreen({Key? key, required this.mixerData})
      : super(key: key);

  @override
  State<MixerDetailsScreen> createState() => _MixerDetailsScreenState();
}

class _MixerDetailsScreenState extends State<MixerDetailsScreen> {
  ShipmentDBService shipmentDBService = ShipmentDBService();
  Future<List<Shipment>>? shipmentsListFuture;
  List<Shipment>? retrievedShipmentsList;

  Future<void> _refresh() async {
    shipmentsListFuture =
        shipmentDBService.retrieveShipmentsByMixerId(widget.mixerData.id);
    retrievedShipmentsList =
        await shipmentDBService.retrieveShipmentsByMixerId(widget.mixerData.id);
    setState(() {});
  }

  // void _dismiss() {
  //   shipmentsListFuture =
  //       shipmentDBService.retrieveShipmentsByMixerId(widget.mixerData.id);
  // }

  Future<void> _initRetrieval() async {
    shipmentsListFuture =
        shipmentDBService.retrieveShipmentsByMixerId(widget.mixerData.id);
    retrievedShipmentsList =
        await shipmentDBService.retrieveShipmentsByMixerId(widget.mixerData.id);

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "خلاطة ${widget.mixerData.name}",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddShipmentPopup().showAddShipmentPopup(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

// TODO: Move it to a separate class , don't use helper methods this way again
}
