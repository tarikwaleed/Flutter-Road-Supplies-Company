import 'package:flutter/material.dart';

class VehicleNumberTextFormField extends StatefulWidget {
  const VehicleNumberTextFormField({Key? key}) : super(key: key);

  @override
  State<VehicleNumberTextFormField> createState() =>
      _VehicleNumberTextFormFieldState();
}

class _VehicleNumberTextFormFieldState
    extends State<VehicleNumberTextFormField> {
  final vehicleNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال رقم العربية';
            }
            return null;
          },
          controller: vehicleNumberController,
          decoration: InputDecoration(
            label: Text("رقم العربية"),
          ),
          // keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
