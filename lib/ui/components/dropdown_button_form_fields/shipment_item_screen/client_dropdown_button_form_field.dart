import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/dtos/dtos.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

//todo: Refacor each component to use the new Architecture
class ClientDropdownButtonFormField extends StatefulWidget {
  const ClientDropdownButtonFormField({Key? key}) : super(key: key);

  @override
  State<ClientDropdownButtonFormField> createState() =>
      _ClientDropdownButtonFormFieldState();
}

class _ClientDropdownButtonFormFieldState
    extends State<ClientDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShipmentItemScreenViewmodel>(
      builder: (_, model, __) => DropdownButtonFormField(
        items: ClientsDropdownButtonMenuItems.list(model.clients),
        onChanged: (Client? selectedClient) {
          model.setClientId(selectedClient!.id);
        },
        hint: const Text("اسم العميل"),
        validator: (value) => value == null ? "قم باختيار اسم العميل" : null,
      ),
    );
  }
}
