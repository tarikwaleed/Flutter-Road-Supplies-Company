import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/cart_number_provider.dart';

class CartNumberTextFormField extends StatefulWidget {
  const CartNumberTextFormField({Key? key}) : super(key: key);

  @override
  State<CartNumberTextFormField> createState() =>
      _CartNumberTextFormFieldState();
}

class _CartNumberTextFormFieldState extends State<CartNumberTextFormField> {
  late final cartNumberProvider;

  @override
  void initState() {
    super.initState();
    cartNumberProvider = Provider.of<CartNumberProvider>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            decoration: InputDecoration(
              label: Text("رقم المقطورة"),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'برجاء ادخال رقم المقطورة';
              }
              return null;
            },
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
