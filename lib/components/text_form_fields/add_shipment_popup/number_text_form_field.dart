import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextFormField extends StatefulWidget {
  final String fieldName;

  const NumberTextFormField({
    Key? key,
    required this.fieldName,
  }) : super(key: key);

  @override
  State<NumberTextFormField> createState() => _NumberTextFormFieldState();
}

class _NumberTextFormFieldState extends State<NumberTextFormField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال ${widget.fieldName}';
            }
            if (int.parse(value) <= 0) {
              return "برجاء ادخال عدد صحيح موجب";
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
            label: Text(widget.fieldName),
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
