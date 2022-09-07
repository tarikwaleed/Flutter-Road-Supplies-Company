import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/dtos/dtos.dart';

class ShipmentItemScreen extends StatefulWidget {
  final dynamic mixer;
  final bool isUpdating;

  const ShipmentItemScreen({
    Key? key,
    required this.mixer,
    required this.isUpdating,
  }) : super(key: key);

  @override
  State<ShipmentItemScreen> createState() => _ShipmentItemScreenState();
}

class _ShipmentItemScreenState extends State<ShipmentItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final shipmentDataRepo = serviceLocator<ShipmentDataRepository>();

  @override
  Widget build(BuildContext context) {
    final shipmentDateProvider = Provider.of<ShipmentDateProvider>(context);
    final vehicleNumberProvider = Provider.of<VehicleNumberProvider>(context);
    final cartNumberProvider = Provider.of<CartNumberProvider>(context);
    final materialProvider = Provider.of<MaterialProvier>(context);
    final materialPriceProvider = Provider.of<MaterialPriceProvider>(context);
    final carriagePriceProvider = Provider.of<CarriagePriceProvider>(context);
    final sourceIDProvider = Provider.of<SourceIDProvider>(context);
    final clientIDProvider = Provider.of<ClientIDProvider>(context);
    final volumeProvider = Provider.of<VolumeProvider>(context);
    final shipment = Shipment(
      mixerId: widget.mixer.id,
      carriagePrice: carriagePriceProvider.carriagePrice,
      cartNumber: cartNumberProvider.cartNumber,
      clientId: clientIDProvider.clientId,
      date: Timestamp.fromDate(shipmentDateProvider.shipmentDate),
      materialId: materialProvider.materialId,
      materialPrice: materialPriceProvider.materialPrice,
      sourceId: sourceIDProvider.sourceId,
      vehicleNumber: vehicleNumberProvider.vehicleNumber,
      volume: volumeProvider.volume,
      totalPrice: materialPriceProvider.materialPrice +
          carriagePriceProvider.carriagePrice,
    );
    return Scaffold(
      // todo:8 pass onUpdate if isUpdating in true
      appBar: EntityAdderAppBar(
        entityArabicName: "نقلة",
        title: widget.isUpdating ? "تعديل بيانات النقلة" : "اضافة نقلة",
        // adder: widget.isUpdating
        //     ? shipmentDataRepo.updateShipment()
        //     : shipmentDataRepo.addShipment(shipment),
        adder: shipmentDataRepo.addShipment,
        entity: shipment,
        alertDialogConfirmationText: widget.isUpdating
            ? "تأكيد تعديل بيانات النقلة${widget.mixer.name}"
            : "تأكيد اضافة نقلة الى الخلاطة ${widget.mixer.name}",
        formkey: _formKey,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Adding this sized box is a stupid, lazy fix but it works!
              const SizedBox(
                height: 10,
              ),
              ShipmentDateTextFormField(),
              VehicleNumberTextFormField(),
              const CartNumberTextFormField(),
              const MaterialDropDownButtonFormField(),
              const MaterialPriceTextFormField(),
              const CarriagePriceTextFormField(),
              const SourceDropDownButtonFormField(),
              const VolumeTextFormField(),
              const ClientDropDownButtonFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
