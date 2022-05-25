import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShipmentDateTextFormField extends StatefulWidget {
  const ShipmentDateTextFormField({Key? key}) : super(key: key);

  @override
  State<ShipmentDateTextFormField> createState() =>
      _ShipmentDateTextFormFieldState();
}

class _ShipmentDateTextFormFieldState extends State<ShipmentDateTextFormField> {
  DateTime selectedDate = DateTime.now();
  final shipmentDateController = TextEditingController();

  @override
  void initState() {
    shipmentDateController.text = DateFormat('yyyy/MM/dd').format(selectedDate);
    super.initState();
  }

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
                _selectDate(context);
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

  Future<void> _selectDate(BuildContext context) async {
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
  }
}
