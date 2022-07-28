import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../providers/providers.dart';

class MaterialPriceTextFormField extends StatefulWidget {
  const MaterialPriceTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<MaterialPriceTextFormField> createState() =>
      _MaterialPriceTextFormFieldState();
}

class _MaterialPriceTextFormFieldState
    extends State<MaterialPriceTextFormField> {
  @override
  Widget build(BuildContext context) {
    MaterialPriceProvider materialPriceProvider =
        Provider.of<MaterialPriceProvider>(context, listen: false);

    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء ادخال سعر الحجر ';
            }
            if (int.parse(value) <= 0) {
              return "برجاء ادخال عدد صحيح موجب";
            }
            return null;
          },
          onChanged: (value) {
            materialPriceProvider.setMaterialPrice(int.parse(value));
          },
          decoration: InputDecoration(
            label: Text("سعر الحجر"),
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
