import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../providers/providers.dart';

class CarriagePriceTextFormField extends StatefulWidget {
  const CarriagePriceTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<CarriagePriceTextFormField> createState() =>
      _CarriagePriceTextFormFieldState();
}

class _CarriagePriceTextFormFieldState
    extends State<CarriagePriceTextFormField> {
  @override
  Widget build(BuildContext context) {
    final carriagePriceProvider =
        Provider.of<CarriagePriceProvider>(context, listen: false);

    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال سعر المشال ';
            }
            if (num.parse(value) <= 0) {
              return "برجاء ادخال عدد موجب";
            }
            return null;
          },
          onChanged: (value) {
            carriagePriceProvider.setCarriagePrice(num.parse(value));
          },
          decoration: InputDecoration(
            label: Text("سعر المشال"),
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
