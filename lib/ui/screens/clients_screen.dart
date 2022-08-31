import 'package:flutter/material.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/ui/components/lists/clients_list.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SalahConstructionDrawer(),
      appBar: SalahConstructionAppBar(
        title: "العملاء",
      ),
      body: ClientsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
