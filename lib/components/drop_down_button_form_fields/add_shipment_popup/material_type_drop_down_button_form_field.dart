import 'package:flutter/material.dart';

class MaterialTypeDropDownButtonFormField extends StatefulWidget {
  const MaterialTypeDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<MaterialTypeDropDownButtonFormField> createState() =>
      _MaterialTypeDropDownButtonFormFieldState();
}

class _MaterialTypeDropDownButtonFormFieldState
    extends State<MaterialTypeDropDownButtonFormField> {
  String dropdownValue = 'سن1';

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
          items: <String>['سن1', 'سن2', 'رمل', 'بودرة', 'مخلفات']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
