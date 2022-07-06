import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/shipment_date_provider.dart';

class ShipmentDateTextFormField extends StatefulWidget {
  ShipmentDateTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<ShipmentDateTextFormField> createState() =>
      _ShipmentDateTextFormFieldState();
}

class _ShipmentDateTextFormFieldState extends State<ShipmentDateTextFormField> {
  var shipmentDateController = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var shipmentDateProvider = Provider.of<ShipmentDateProvider>(context);
    shipmentDateController.text =
        DateFormat('yyyy/MM/dd').format(shipmentDateProvider.shipmentDate);
    DateTime selectedDate = shipmentDateProvider.shipmentDate;
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء اختيار تاريخ النقلة';
            }
            return null;
          },
          controller: shipmentDateController,
          decoration: InputDecoration(
            label: Text("تاريخ النقلة"),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2100),
                );
                if (picked != null && picked != selectedDate) {
                  shipmentDateProvider.setShipmentDate(picked);
                  shipmentDateController.text = DateFormat('yyyy/MM/dd')
                      .format(shipmentDateProvider.shipmentDate);
                }
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
