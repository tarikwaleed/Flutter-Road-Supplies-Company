import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/cart_number_provider.dart';

class CartNumberTextFormField extends StatefulWidget {
  const CartNumberTextFormField({Key? key}) : super(key: key);

  @override
  State<CartNumberTextFormField> createState() =>
      _CartNumberTextFormFieldState();
}

class _CartNumberTextFormFieldState extends State<CartNumberTextFormField> {
  @override
  Widget build(BuildContext context) {
    final cartNumberProvider =
        Provider.of<CartNumberProvider>(context);
    return Column(
      children: [
        TextFormField(
            initialValue: cartNumberProvider.cartNumber,
            decoration: InputDecoration(
              label: Text("رقم المقطورة"),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'برجاء ادخال رقم المقطورة';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (text) {
              cartNumberProvider.setCartNumber(text);
            }),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}