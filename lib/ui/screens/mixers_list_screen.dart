import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/models/models.dart';
import 'package:salah_construction/ui/components/components.dart';

class MixersList extends StatelessWidget {
  const MixersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Mixer> listOfMixers =
        context.select<List<Mixer>, List<Mixer>>((mixers) => mixers);
    final List<int> listOfInts =
        context.select<List<int>?, List<int>>((ints) => ints);
    debugPrint("list of Integers is${listOfInts.toString()}");
    debugPrint("list of Mixers is${listOfMixers.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الخلاطات",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
      ),
      body: listOfMixers.isNotEmpty
          ? ListView.builder(
              itemCount: listOfMixers.length,
              itemBuilder: (context, index) {
                return MixerCard(
                  mixer: listOfMixers[index],
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
