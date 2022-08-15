import 'package:flutter/material.dart';
import 'package:salah_construction/models/models.dart';

class MixerCard extends StatelessWidget {
  const MixerCard({
    Key? key,
    required this.mixer,
    required this.numberOfShipments,
  }) : super(key: key);
  final Mixer mixer;
  final int? numberOfShipments;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                        "خلاطة ${mixer.name}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${numberOfShipments}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            "نقلة",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                      Center(
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.lightBlueAccent,
                          backgroundImage: AssetImage("assets/images/53aLRGxRuKWMzrDWYPjL.png"),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
