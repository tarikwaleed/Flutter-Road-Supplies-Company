import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/providers.dart';

class SourceNameTextFormField extends StatefulWidget {
  const SourceNameTextFormField({Key? key}) : super(key: key);

  @override
  State<SourceNameTextFormField> createState() =>
      _SourceNameTextFormFieldState();
}

class _SourceNameTextFormFieldState extends State<SourceNameTextFormField> {
  @override
  Widget build(BuildContext context) {
    final sourceNameProvider = Provider.of<SourceNameProvider>(context);
    return Column(
      children: [
        TextFormField(
          initialValue: sourceNameProvider.sourceName,
          onChanged: (value) {
            sourceNameProvider.setSourceName(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "برجاء ادخال اسم الكسارة";
            }
            return null;
          },
          // keyboardType: TextInputType.name,
          decoration: InputDecoration(label: Text("اسم الكسارة")),
        ),
      ],
    );
  }
}
