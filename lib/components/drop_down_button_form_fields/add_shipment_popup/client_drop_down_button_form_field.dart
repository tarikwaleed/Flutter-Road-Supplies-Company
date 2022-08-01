import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/providers/providers.dart';


import '../../../models/client_model.dart';

class ClientDropDownButtonFormField extends StatefulWidget {
  const ClientDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<ClientDropDownButtonFormField> createState() =>
      _ClientDropDownButtonFormFieldState();
}

class _ClientDropDownButtonFormFieldState
    extends State<ClientDropDownButtonFormField> {
  Client? _selectedClient;
  final _clientDBService = ClientDBService();
  Future<List<Client>>? _futureListOfClients;

  _getAllClients() {
    _futureListOfClients = _clientDBService.retrieveClients();
  }

  @override
  initState() {
    super.initState();
    _getAllClients();
  }

  @override
  Widget build(BuildContext context) {
    final clientIDProvider =
        Provider.of<ClientIDProvider>(context, listen: false);
    return Column(
      children: [
        FutureBuilder(
            future: _futureListOfClients,
            builder: (BuildContext context,
                AsyncSnapshot<List<Client>> listOfClients) {
              if (listOfClients.connectionState == ConnectionState.waiting) {
                return const Text("جار تحميل بيانات العملاء");
              } else {
                List<DropdownMenuItem<Client>> clientsDropDownMenuItems = [];
                for (int i = 0; i < listOfClients.data!.length; i++) {
                  Client client = listOfClients.data![i];
                  clientsDropDownMenuItems.add(DropdownMenuItem<Client>(
                    value: client,
                    child: Text(client.name),
                  ));
                  debugPrint(
                      "Added Client with name: ${client.name} and id: ${client.id}");
                }
                return DropdownButtonFormField(
                  items: clientsDropDownMenuItems,
                  onChanged: (Client? selectedClient) {
                    setState(() {
                      _selectedClient = selectedClient;
                    });
                    clientIDProvider.setClientId(_selectedClient!.id);
                    debugPrint(
                        "The Selected DropdownButtonFormField value is of type "
                        "${selectedClient.runtimeType.toString()} , "
                        "with name:${selectedClient!.name} , "
                        "and id:${selectedClient.id}");
                  },
                  hint: const Text("اسم العميل"),
                  validator: (value) =>
                      value == null ? "قم باختيار اسم العميل" : null,
                );
              }
            }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
