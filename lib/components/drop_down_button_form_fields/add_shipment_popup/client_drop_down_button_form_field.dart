
import 'package:flutter/material.dart';
class ClientDropDownButtonFormField extends StatefulWidget {
  const ClientDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<ClientDropDownButtonFormField> createState() => _ClientDropDownButtonFormFieldState();
}

class _ClientDropDownButtonFormFieldState extends State<ClientDropDownButtonFormField> {
  String _clientValue="العربي";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: _clientValue,
          onChanged: (String? newValue) {
            setState(() {
              _clientValue = newValue!;
            });
          },
          items: <String>['العربي', 'عنتر','ابراهيم السيد' ]
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
