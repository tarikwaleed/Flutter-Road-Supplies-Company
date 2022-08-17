import 'package:flutter/material.dart';

class ShipmentCardRow extends StatelessWidget {
  const ShipmentCardRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          text.toString(),
          // shipment.date.toString(),
          style: Theme.of(context).textTheme.bodyText2,
        ))
      ],
    );
  }
}
