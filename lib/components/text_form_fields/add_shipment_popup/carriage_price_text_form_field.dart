import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/carriage_price_provider.dart';

class CarriagePriceTextFormField extends StatefulWidget {
  const CarriagePriceTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<CarriagePriceTextFormField> createState() => _CarriagePriceTextFormFieldState();
}

class _CarriagePriceTextFormFieldState extends State<CarriagePriceTextFormField> {
  @override
  Widget build(BuildContext context) {
    final  carriagePriceProvider =
        Provider.of<CarriagePriceProvider>(context, listen: false);

    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال سعر المشال ';
            }
            if (int.parse(value) <= 0) {
              return "برجاء ادخال عدد صحيح موجب";
            }
            return null;
          },
          onChanged: (value) {
            carriagePriceProvider.setCarriagePrice(int.parse(value));
          },
          decoration: InputDecoration(
            label: Text("سعر المشال"),
          ),
          keyboardType: TextInputType.number,
          // this won't allow any characters expect numbers to be entered
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
