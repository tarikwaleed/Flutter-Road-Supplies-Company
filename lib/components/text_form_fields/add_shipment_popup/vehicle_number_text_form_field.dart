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
  // late final TextEditingController _vehicleNumberController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   final VehicleNumberProvider vehicleNumberProvider =
  //       Provider.of<VehicleNumberProvider>(context, listen: false);
  //   _vehicleNumberController =
  //       TextEditingController(text: vehicleNumberProvider.vehicleNumber);
  // }
  //
  // void updateVehicleNumber(String value) {
  //   var vehicleNumberProvider =
  //       Provider.of<VehicleNumberProvider>(context, listen: false);
  //   vehicleNumberProvider.setVehicleNumber(value);
  // }
  //
  // @override
  // void dispose() {
  //   _vehicleNumberController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final vehicleNumberProvider = Provider.of<VehicleNumberProvider>(context);
    // _vehicleNumberController.text = vehicleNumberProvider.vehicleNumber;

    return Column(
      children: [
        TextFormField(
          initialValue: vehicleNumberProvider.vehicleNumber,
          onChanged: (value) {
            vehicleNumberProvider.setVehicleNumber(value);
          },
          // controller: _vehicleNumberController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال رقم العربية';
            }
            return null;
          },
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
