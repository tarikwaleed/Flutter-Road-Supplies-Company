import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/dtos/source.dart' as sourcedto;
import 'package:salah_construction/ui/components/components.dart';

class SourcesList extends StatelessWidget {
  const SourcesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfSources = context.watch<List<sourcedto.Source>>();
    if (listOfSources.isNotEmpty) {
      return ListView.separated(
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SourceCard(source: listOfSources[index]),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                height: 10,
              ),
          itemCount: listOfSources.length);
    }
    return Center(child: CircularProgressIndicator());
  }
}
