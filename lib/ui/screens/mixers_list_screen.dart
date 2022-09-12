import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/ui/components/lists/mixers_list.dart';
import 'package:salah_construction/viewmodels/viewmodels.dart';

class MixersListScreen extends StatefulWidget {
  const MixersListScreen({Key? key}) : super(key: key);

  @override
  State<MixersListScreen> createState() => _MixersListScreenState();
}

class _MixersListScreenState extends State<MixersListScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SalahConstructionAppBar(title: "الخلاطات"),
      drawer: SalahConstructionDrawer(),
      body: MixersList(),
    );
  }
}
