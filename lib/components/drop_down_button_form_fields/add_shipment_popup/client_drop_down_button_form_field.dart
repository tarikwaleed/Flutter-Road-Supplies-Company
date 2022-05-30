import 'package:flutter/material.dart';
import 'package:salah_construction/services/client_db_service.dart';

import '../../../models/client_model.dart';

class ClientDropDownButtonFormField extends StatefulWidget {
  const ClientDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<ClientDropDownButtonFormField> createState() =>
      _ClientDropDownButtonFormFieldState();
}

class _ClientDropDownButtonFormFieldState
    extends State<ClientDropDownButtonFormField> {
  ClientDBService clientDBService = ClientDBService();
  List<Client>? retreivedClientsList;
  List<String>? _clientsNamesList;
  String? _clientValue;

  Future<void> _initRetrieval() async {
    retreivedClientsList = await clientDBService.retrieveClients();
    _clientsNamesList =
        retreivedClientsList!.map((client) => client.name).toList();
    _clientValue = _clientsNamesList!.first;
    setState(() {});
    debugPrint("retrieved clients list is" + retreivedClientsList.toString());
    debugPrint(_clientsNamesList!.first);
    debugPrint(_clientsNamesList!.last);
  }

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: _clientValue,
          onChanged: (String? newValue) {
            setState(() {
              _clientValue = newValue!;
            });
          },
          items:
              _clientsNamesList!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
