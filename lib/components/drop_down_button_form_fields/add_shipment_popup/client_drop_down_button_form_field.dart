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
  Future<List<Client>>? _clientsListFuture;

  getAllClients() {
    _clientsListFuture = _clientDBService.retrieveClients();
    setState(() {});
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
        FutureBuilder(future: _clientsListFuture,
          builder: (BuildContext context,
              AsyncSnapshot<List<Client>> clientsList) {
            List<DropdownMenuItem> clientsDropDownMenueItems = [];
            for (int i = 0; i < clientsList.data!.length; i++) {
              Client client = clientsList.data![i];
              clientsDropDownMenueItems.add(
                  DropdownMenuItem(value: client
                    , child: Text(client.name),));
            }
          },)
        // DropdownButtonFormField<String>(
        //     decoration: InputDecoration(label: Text("العميل")),
        //     value: _selectedValue,
        //     items: _clientsNames!
        //         .map<DropdownMenuItem<String>>((clientName) => DropdownMenuItem(
        //               value: clientName,
        //               child: Text(clientName),
        //             ))
        //         .toList(),
        //     onChanged: (String? newValue) {
        //       setState(() {
        //         _selectedValue = newValue;
        //       });
        //     }),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
