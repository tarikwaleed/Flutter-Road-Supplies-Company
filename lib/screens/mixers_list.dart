import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:salah_construction/models/mixer_model.dart';
import 'package:salah_construction/services/mixer_db_service.dart';

class MixersList extends StatefulWidget {
  const MixersList({Key? key}) : super(key: key);

  @override
  State<MixersList> createState() => _MixersListState();
}

class _MixersListState extends State<MixersList> {
  ShipmentDBService mixerDBService = ShipmentDBService();
  Future<List<Mixer>>? mixersListFuture;
  List<Mixer>? retrievedMixersList;

  Future<void> _refresh() async {
    mixersListFuture = mixerDBService.retrieveMixers();
    retrievedMixersList = await mixerDBService.retrieveMixers();
    setState(() {});
  }

  void _dismiss() {
    mixersListFuture = mixerDBService.retrieveMixers();
  }

  Future<void> _initRetrieval() async {
    mixersListFuture = mixerDBService.retrieveMixers();
    retrievedMixersList = await mixerDBService.retrieveMixers();
  }

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الخلاطات",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: mixersListFuture,
            builder:
                (BuildContext context, AsyncSnapshot<List<Mixer>> snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.separated(
                    itemCount: retrievedMixersList!.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (_, index) {
                      return Dismissible(
                        onDismissed: ((direction) async {
                          await mixerDBService.deleteMixer(
                              retrievedMixersList![index].id.toString());
                          _dismiss();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("تم مسح الخلاطة"),
                            backgroundColor: Colors.green,
                          ));
                        }),
                        background: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: const EdgeInsets.only(right: 28.0),
                          alignment: AlignmentDirectional.centerEnd,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        resizeDuration: const Duration(milliseconds: 200),
                        key: UniqueKey(),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, '/mixer_details',
                                  arguments: retrievedMixersList![index]);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.blue),
                            ),
                            title: Text(
                              retrievedMixersList![index].name.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: const Icon(Icons.arrow_right_sharp),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.done &&
                  retrievedMixersList!.isEmpty) {
                return Center(
                  child: ListView(
                    children: const <Widget>[
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            ' لا يوجد خلاطات',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMixerPopup(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _showAddMixerPopup(context) {
    final _formKey = GlobalKey<FormState>();
    final mixerNameController = TextEditingController();
    bool mixerAddedSuccessfully = false;
    final bool isLoading = false;
    Alert(
        context: context,
        title: "اضافة خلاطة",
        content: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: mixerNameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'رجاء ادخال اسم الخلاطة';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'اسم الخلاطة',
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {}
              String mixerName = mixerNameController.text;
              Mixer mixer = Mixer(
                name: mixerName,
              );
              await mixerDBService.addMixer(mixer);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text("تمت اضافة الخلاطة بنجاح، قم باعادة تحميل الصفحة"),
                backgroundColor: Colors.green,
              ));
            },
            child: Text(
              "اضافة",
              style: Theme.of(context).textTheme.button,
            ),
          )
        ]).show();
  }
}
