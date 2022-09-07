import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/ui/components/components.dart';

import '../../dtos/source.dart';

class SourcesScreen extends StatelessWidget {
  const SourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SalahConstructionAppBar(title: "الكسارات"),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SourcesList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/source_item_screen');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
