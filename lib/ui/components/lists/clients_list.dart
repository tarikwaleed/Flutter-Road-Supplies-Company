import 'package:flutter/material.dart';
import 'package:salah_construction/ui/components/cards/client_card/client_card.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfFakeClients = [
      FakeClient(
          clientName: "الحاج العربي",
          numberOfShipments: 15,
          depositAmount: 5000,
          gasAmount: 580),
      FakeClient(
          clientName: "عنتر",
          numberOfShipments: 6,
          depositAmount: 17500,
          gasAmount: 800),
      FakeClient(
          clientName: "الحاج ضاحي",
          numberOfShipments: 4,
          depositAmount: 7000,
          gasAmount: 400),
      FakeClient(
          clientName: "الحاج سيد",
          numberOfShipments: 18,
          depositAmount: 7800,
          gasAmount: 250)
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,30,10,0),
      child: ListView.separated(
        itemCount: listOfFakeClients.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (_, index) {
          return ClientCard(
            client: listOfFakeClients[index],
          );
        },
      ),
    );
  }
}

class FakeClient {
  final String clientName;
  final int numberOfShipments;
  final int depositAmount;
  final int gasAmount;

  FakeClient({
    required this.clientName,
    required this.numberOfShipments,
    required this.depositAmount,
    required this.gasAmount,
  });
}
