import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:salah_construction/components/drop_down_button_form_fields/client_drop_down_button_form_field.dart';
import 'package:salah_construction/components/drop_down_button_form_fields/material_type_drop_down_button_form_field.dart';
import 'package:salah_construction/components/drop_down_button_form_fields/source_drop_down_button_form_field.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/carriage_price_text_form_field.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/cart_number_text_form_field.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/material_price_text_form_field.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/shipment_date_text_form_field.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/vehicle_number_text_form_field.dart';
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
          _showAddShipmentPopup();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _showAddShipmentPopup() {
    final _formKey = GlobalKey<FormState>();
    Alert(
        context: context,
        title: "اضافة نقلة",
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              ShipmentDateTextFormField(),
              VehicleNumberTextFormField(),
              CartNumberTextFormField(),
              MaterialTypeDropDownButtonFormField(),
              SourceDropDownButtonFormField(),
              MaterialPriceTextFormField(),
              CarriagePriceTextFormField(),
              ClientDropDownButtonFormField(),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Put your code here
              }
            },
            child: Text("اضافة", style: Theme.of(context).textTheme.button),
          )
        ]).show();
  }
}
