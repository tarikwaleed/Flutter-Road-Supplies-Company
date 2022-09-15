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
  final mixersLisScreenViewmodel = serviceLocator<MixersListScreenViewmodel>();

  @override
  void initState() {
    _loadModel();
    print("MixersListScreen initState Called.");
  }

  _loadModel() async {
    await mixersLisScreenViewmodel.loadMixers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SalahConstructionAppBar(title: "الخلاطات"),
      drawer: SalahConstructionDrawer(),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => mixersLisScreenViewmodel,
        child: mixersLisScreenViewmodel.mixers.isNotEmpty
            ? MixersList(model: mixersLisScreenViewmodel)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
