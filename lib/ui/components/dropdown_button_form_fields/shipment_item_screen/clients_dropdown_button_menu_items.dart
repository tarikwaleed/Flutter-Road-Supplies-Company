import 'package:flutter/material.dart';
import 'package:salah_construction/dtos/dtos.dart';

class ClientsDropdownButtonMenuItems {
  static List<DropdownMenuItem<Client>> list(List<Client> listOfClients) {
    List<DropdownMenuItem<Client>> clientsDropDownMenuItems = [];
    for (int i = 0; i < listOfClients.length; i++) {
      Client client = listOfClients[i];
      clientsDropDownMenuItems.add(DropdownMenuItem<Client>(
        value: client,
        child: Text(client.name),
      ));
    }
    return clientsDropDownMenuItems;
  }
}
