import 'package:flutter/material.dart';

class SalahConstructionAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  const SalahConstructionAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(56),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
