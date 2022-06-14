import 'package:flutter/material.dart';

class VehicleNumberTextFormField extends StatelessWidget {
  VehicleNumberTextFormField({Key? key, required this.vehicleNumberController})
      : super(key: key);
  final vehicleNumberController;

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
