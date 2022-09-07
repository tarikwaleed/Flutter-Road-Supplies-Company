import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/vehicle_number_provider.dart';

//todo: Refacor each component to use the new Architecture
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
  @override
  Widget build(BuildContext context) {
    final vehicleNumberProvider = Provider.of<VehicleNumberProvider>(context);
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
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],

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
