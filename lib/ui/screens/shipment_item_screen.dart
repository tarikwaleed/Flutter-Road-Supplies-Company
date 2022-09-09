import 'package:flutter/material.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

class ShipmentItemScreen extends StatefulWidget {
  final dynamic mixer;

  const ShipmentItemScreen({
    Key? key,
    required this.mixer,
  }) : super(key: key);

  @override
  State<ShipmentItemScreen> createState() => _ShipmentItemScreenState();
}

class _ShipmentItemScreenState extends State<ShipmentItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final shipmentDataRepo = serviceLocator<ShipmentDataRepository>();
  final model = serviceLocator<ShipmentItemScreenViewmodel>();

  @override
  Widget build(BuildContext context) {
    final shipment = Shipment(
      mixerId: widget.mixer.id,
      carriagePrice: model.carriagePrice,
      cartNumber: model.cartNumber,
      clientId: model.clientId,
      date: model.date,
      materialId: model.materialId,
      materialPrice: model.materialPrice,
      sourceId: model.sourceId,
      vehicleNumber: model.vehicleNumber,
      volume: model.volume,
      totalPrice: model.materialPrice + model.carriagePrice,
    );
    return Scaffold(
      // todo:8 pass onUpdate if isUpdating is true
      appBar: EntityAdderAppBar(
        entityArabicName: "نقلة",
        title: widget.isUpdating ? "تعديل بيانات النقلة" : "اضافة نقلة",
        // adder: widget.isUpdating
        //     ? shipmentDataRepo.updateShipment()
        //     : shipmentDataRepo.addShipment(shipment),
        onAdd: shipmentDataRepo.addShipment,
        onUpdate: shipmentDataRepo.updateShipment,
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
              const ClientDropdownButtonFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
