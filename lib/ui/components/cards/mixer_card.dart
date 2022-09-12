import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

class MixerCard extends StatefulWidget {
  const MixerCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<MixerCard> createState() => _MixerCardState();
}

class _MixerCardState extends State<MixerCard> {
  final mixerCardViewmodel = serviceLocator<MixerCardViewmodel>();

  @override
  void initState() {
    mixerCardViewmodel.loadShipmentsCounts();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MixerCardViewmodel>(
      create: (BuildContext context) => mixerCardViewmodel,
      child: Consumer2<MixersListScreenViewmodel, MixerCardViewmodel>(
          builder: (_, mixersListScreenViewmodel, mixerCardViewModel, __) =>
              GestureDetector(
                onTap: () {},
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      child: Container(
                        height: 200,
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "خلاطة ${mixersListScreenViewmodel.mixers[widget.index].name}",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${mixerCardViewmodel.shipmentsCoutns[widget.index]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        "نقلة",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.lightBlueAccent,
                                      backgroundImage: AssetImage(
                                          "assets/images/mixer1.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
