import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VolumeTextFormField extends StatefulWidget {
  const VolumeTextFormField({Key? key}) : super(key: key);

  @override
  State<VolumeTextFormField> createState() => _VolumeTextFormFieldState();
}

class _VolumeTextFormFieldState extends State<VolumeTextFormField> {
  final volumeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال التكعيب';
            }
            if (int.parse(value) <= 0) {
              return "برجاء ادخال عدد صحيح موجب";
            }
            return null;
          },
          controller: volumeController,
          decoration: InputDecoration(
            label: Text("التكعيب"),
          ),
          keyboardType: TextInputType.number,
          // this won't allow any characters expect numbers to be entered
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
