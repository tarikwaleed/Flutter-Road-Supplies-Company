import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/dtos/dtos.dart';

class MixersList extends StatelessWidget {
  const MixersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Mixer> listOfMixers =
        context.select<List<Mixer>, List<Mixer>>((mixers) => mixers);
    debugPrint("list of Mixers is${listOfMixers.toString()}");
    return Scaffold(
      appBar: SalahConstructionAppBar(title: "الخلاطات"),
      drawer: SalahConstructionDrawer(),
      body: FutureBuilder<List<int>>(
        future: context.read<Future<List<int>>>(),
        builder: (_, snapshot) {
          if (snapshot.hasData &&
              snapshot.data!.isNotEmpty &&
              listOfMixers.isNotEmpty) {
            return ListView.builder(
                itemCount: listOfMixers.length,
                itemBuilder: (_, index) {
                  return MixerCard(
                      mixer: listOfMixers[index],
                      numberOfShipments: snapshot.data![index]);
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
