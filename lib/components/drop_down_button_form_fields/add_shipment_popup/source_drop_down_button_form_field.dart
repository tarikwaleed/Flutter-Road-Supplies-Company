import 'package:flutter/material.dart';

class SourceDropDownButtonFormField extends StatefulWidget {
  const SourceDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<SourceDropDownButtonFormField> createState() =>
      _SourceDropDownButtonFormFieldState();
}

class _SourceDropDownButtonFormFieldState
    extends State<SourceDropDownButtonFormField> {
  String dropdownValue = 'الهدى';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'الهدى',
            'الهيبة',
            'الدالي',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
