import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../providers/providers.dart';

class VolumeTextFormField extends StatefulWidget {
  const VolumeTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<VolumeTextFormField> createState() => _VolumeTextFormFieldState();
}

class _VolumeTextFormFieldState extends State<VolumeTextFormField> {
  @override
  Widget build(BuildContext context) {
    final volumeProvider = Provider.of<VolumeProvider>(context, listen: false);

    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال التكعيب';
            }
            if (num.parse(value) <= 0) {
              return "برجاء ادخال عدد صحيح موجب";
            }
            return null;
          },
          onChanged: (value) {
            volumeProvider.setVolume(num.parse(value));
            debugPrint("volume ${value}");
          },
          decoration: InputDecoration(
            label: Text("التكعيب"),
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          // this won't allow any characters expect numbers to be entered
          inputFormatters: <TextInputFormatter>[
            // FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
