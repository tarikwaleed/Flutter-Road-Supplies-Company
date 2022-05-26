import 'package:flutter/material.dart';

class MaterialPriceTextFormField extends StatefulWidget {
  const MaterialPriceTextFormField({Key? key}) : super(key: key);

  @override
  State<MaterialPriceTextFormField> createState() =>
      _MaterialPriceTextFormFieldState();
}

class _MaterialPriceTextFormFieldState
    extends State<MaterialPriceTextFormField> {
  final materialPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال سعر الحجر';
            }
            return null;
          },
          controller: materialPriceController,
          decoration: InputDecoration(
            label: Text("الحجر"),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
