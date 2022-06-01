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
  ClientDBService _clientDBService = ClientDBService();
  String? _selectedValue;
  List<String>? _clientsNames;
  List<String?>? _clientsIds;

  getAllClients() async {
    List<Client>? _clientsList = await _clientDBService.retrieveClients();
    _clientsNames = _clientsList.map((client) => client.name).toList();
    _clientsIds = _clientsList.map((client) => client.id).toList();
    _selectedValue=_clientsNames!.first;
    setState(() {});
    debugPrint(_clientsNames!.join("|"));
    debugPrint(_clientsIds!.join("|"));
  }

  @override
  void initState() {
    super.initState();
    getAllClients();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
            decoration: InputDecoration(label: Text("العميل")),
            value: _selectedValue,
            items: _clientsNames!
                .map<DropdownMenuItem<String>>((clientName) => DropdownMenuItem(
                      value: clientName,
                      child: Text(clientName),
                    ))
                .toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            }),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
