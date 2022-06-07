import 'package:flutter/material.dart';

class ShipmentDateTextFormField extends StatelessWidget {
  final TextEditingController shipmentDateController;
  final DateTime selectedDate;
  final Function selectShipmentDate;

  ShipmentDateTextFormField({
    Key? key,
    required this.shipmentDateController,
    required this.selectedDate,
    required this.selectShipmentDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                selectShipmentDate(context);
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
