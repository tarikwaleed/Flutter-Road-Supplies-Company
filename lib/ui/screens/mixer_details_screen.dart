import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

class MixerDetailsScreen extends StatefulWidget {
  final dynamic mixer;

  const MixerDetailsScreen({Key? key, required this.mixer}) : super(key: key);

  @override
  State<MixerDetailsScreen> createState() => _MixerDetailsScreenState();
}

class _MixerDetailsScreenState extends State<MixerDetailsScreen> {
  final shipmentCardViewmodel = serviceLocator<ShipmentCardViewmodel>();
  final shipmentItemScreenViewmodel =
      serviceLocator<ShipmentItemScreenViewmodel>();


  @override
  void initState() {


  }

  @override
  Widget build(BuildContext context) {
    final shipmentDBService = ShipmentFirestoreService();
    final mixerId = context.read<MixerIDProvider>().mixerId;
    return FutureProvider<List<Shipment>>(
      create: (_) => shipmentDBService.retrieveShipmentsByMixerId(mixerId),
      initialData: <Shipment>[],
      child: Scaffold(
        appBar: SalahConstructionAppBar(
          title: "خلاطة ${widget.mixer.name}",
        ),
        body: ShipmentsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/shipment_item_screen',
                arguments: widget.mixer);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
