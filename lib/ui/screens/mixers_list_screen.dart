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
    debugPrint("list of Mixers is${listOfMixers.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الخلاطات",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
      ),
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
