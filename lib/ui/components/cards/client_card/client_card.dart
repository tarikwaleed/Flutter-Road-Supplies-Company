import 'package:flutter/material.dart';
import 'package:salah_construction/ui/components/lists/clients_list.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({Key? key, required this.client}) : super(key: key);
  final FakeClient client;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            height: 200,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${client.clientName}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${client.numberOfShipments.toString()}",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              "نقلة",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${client.depositAmount.toString()}",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              "العهدة",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${client.gasAmount.toString()}",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              "الجاز",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
