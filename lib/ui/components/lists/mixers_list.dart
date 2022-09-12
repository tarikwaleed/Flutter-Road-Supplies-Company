import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

class MixersList extends StatelessWidget {
  const MixersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MixersListScreenViewmodel>(
      builder: (_, mixersListScreenViewModel, __) => ListView.separated(
        itemCount: mixersListScreenViewModel.mixers.length,
        itemBuilder: (_, index) {
          return MixerCard(index: index);
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
