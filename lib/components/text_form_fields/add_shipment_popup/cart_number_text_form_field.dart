import 'package:flutter/material.dart';

class CartNumberTextFormField extends StatefulWidget {
  const CartNumberTextFormField({Key? key}) : super(key: key);

  @override
  State<CartNumberTextFormField> createState() =>
      _CartNumberTextFormFieldState();
}

class _CartNumberTextFormFieldState
    extends State<CartNumberTextFormField> {
  final cartNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال رقم المقطورة';
            }
            return null;
          },
          controller: cartNumberController,
          decoration: InputDecoration(
            label: Text("رقم المقطورة"),
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
