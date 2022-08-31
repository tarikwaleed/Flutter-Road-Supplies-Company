import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/ui/components/lists/shipment_list.dart';
import 'package:salah_construction/dtos/dtos.dart';

class MixerDetailsScreen extends StatelessWidget {
  final dynamic mixer;

  const MixerDetailsScreen({Key? key, required this.mixer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shipmentDBService = ShipmentFirestoreService();
    final mixerId = context.read<MixerIDProvider>().mixerId;
    return FutureProvider<List<Shipment>>(
      create: (_) => shipmentDBService.retrieveShipmentsByMixerId(mixerId),
      initialData: <Shipment>[],
      child: Scaffold(
        appBar: SalahConstructionAppBar(
          title: "خلاطة ${mixer.name}",
        ),
        body: ShipmentsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/shipment_item_screen',
                arguments: mixer);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
