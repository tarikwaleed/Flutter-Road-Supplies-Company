import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/cart_number_text_form_field.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/number_text_form_field.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/shipment_date_text_form_field.dart';
import 'package:salah_construction/components/text_form_fields/add_shipment_popup/vehicle_number_text_form_field.dart';

import 'drop_down_button_form_fields/add_shipment_popup/client_drop_down_button_form_field.dart';
import 'drop_down_button_form_fields/add_shipment_popup/material_type_drop_down_button_form_field.dart';
import 'drop_down_button_form_fields/add_shipment_popup/source_drop_down_button_form_field.dart';

class AddShipmentPopup {
  showAddShipmentPopup(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Alert(
        context: context,
        title: "اضافة نقلة",
        content: Form(
          key: _formKey,
          child: Column(
            children: const [
              ShipmentDateTextFormField(),
              VehicleNumberTextFormField(),
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
