import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

class MixersList extends StatelessWidget {
  const MixersList({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MixersListScreenViewmodel model;

  @override
  Widget build(BuildContext context) {
    print("MixerrsList Build Called");
    print(model.mixers);
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: model.mixers.length,
            itemBuilder: (_, index) {
              return MixerCard(index: index);
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: 10,
            ),
          ),
        ),
      ],
    );
  }
}
