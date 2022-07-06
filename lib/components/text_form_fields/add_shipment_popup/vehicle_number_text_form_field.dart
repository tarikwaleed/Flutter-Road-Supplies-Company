import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/vehicle_number_provider.dart';

class VehicleNumberTextFormField extends StatefulWidget {
  VehicleNumberTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<VehicleNumberTextFormField> createState() =>
      _VehicleNumberTextFormFieldState();
}

class _VehicleNumberTextFormFieldState
    extends State<VehicleNumberTextFormField> {
  var vehicleNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vehicleNumberProvider = Provider.of<VehicleNumberProvider>(context);
    vehicleNumberController.text = vehicleNumberProvider.vehicleNumber;

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
