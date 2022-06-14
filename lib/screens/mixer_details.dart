import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:salah_construction/components/shipment_list_future.dart';
import '../components/drop_down_button_form_fields/add_shipment_popup/client_drop_down_button_form_field.dart';
import '../components/drop_down_button_form_fields/add_shipment_popup/material_type_drop_down_button_form_field.dart';
import '../components/drop_down_button_form_fields/add_shipment_popup/source_drop_down_button_form_field.dart';
import '../components/text_form_fields/add_shipment_popup/cart_number_text_form_field.dart';
import '../components/text_form_fields/add_shipment_popup/number_text_form_field.dart';
import '../components/text_form_fields/add_shipment_popup/shipment_date_text_form_field.dart';
import '../components/text_form_fields/add_shipment_popup/vehicle_number_text_form_field.dart';

class MixerDetailsScreen extends StatefulWidget {
  final dynamic mixerData;

  const MixerDetailsScreen({Key? key, required this.mixerData})
      : super(key: key);

  @override
  State<MixerDetailsScreen> createState() => _MixerDetailsScreenState();
}

class _MixerDetailsScreenState extends State<MixerDetailsScreen> {
  // State of ShipmentDateTextFormField
  DateTime selectedDate = DateTime.now();
  TextEditingController shipmentDateController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    shipmentDateController.text = DateFormat('yyyy/MM/dd').format(selectedDate);
    vehicleNumberController.addListener(() {
      debugPrint('vehicle number is: ${vehicleNumberController.text}');
    });
  }

  @override
  void dispose() {
    shipmentDateController.dispose();
    vehicleNumberController.dispose();
    super.dispose();
  }

  Future<void> _selectShipmentDate(BuildContext context) async {
    debugPrint("selectShipmentDate called");
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        shipmentDateController.text =
            DateFormat('yyyy/MM/dd').format(selectedDate);
      });
    }
    debugPrint("selected date is : $selectedDate");
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
      body: ShipmentListFuture(mixerData: widget.mixerData),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddShipmentPopup(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

// TODO: Move it to a separate class , don't use helper methods this way again
  _showAddShipmentPopup(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Alert(
        context: context,
        title: "اضافة نقلة",
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              // Lifted up successfully
              ShipmentDateTextFormField(
                shipmentDateController: shipmentDateController,
                selectedDate: selectedDate,
                selectShipmentDate: () {
                  _selectShipmentDate(context);
                },
              ),
              VehicleNumberTextFormField(
                vehicleNumberController: vehicleNumberController,
              ),
              CartNumberTextFormField(),
              NumberTextFormField(fieldName: "التكعيب"),
              MaterialTypeDropDownButtonFormField(),
              SourceDropDownButtonFormField(),
              NumberTextFormField(fieldName: "الحجر"),
              NumberTextFormField(fieldName: "المشال"),
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
