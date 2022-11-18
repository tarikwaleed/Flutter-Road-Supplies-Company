import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/dtos/source.dart' as sourcedto;
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/providers/providers.dart';

//todo: Refacor each component to use the new Architecture
class SourceDropDownButtonFormField extends StatefulWidget {
  const SourceDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<SourceDropDownButtonFormField> createState() =>
      _SourceDropDownButtonFormFieldState();
}

class _SourceDropDownButtonFormFieldState
    extends State<SourceDropDownButtonFormField> {
  sourcedto.Source? _selectedSource;
  final _sourceDBService = SourceFirestoreService();
  Future<List<sourcedto.Source>>? _futureListOfSources;

  _getAllSources() {
    _futureListOfSources = _sourceDBService.retrieveSources();
  }

  @override
  initState() {
    super.initState();
    _getAllSources();
  }

  @override
  Widget build(BuildContext context) {
    final sourceProvider =
        Provider.of<SourceIDProvider>(context, listen: false);
    return Column(
      children: [
        FutureBuilder(
            future: _futureListOfSources,
            builder: (BuildContext context,
                AsyncSnapshot<List<sourcedto.Source>> listOfSources) {
              if (listOfSources.connectionState == ConnectionState.waiting) {
                return const Text("جار تحميل بيانات المواد");
              } else {
                List<DropdownMenuItem<sourcedto.Source>>
                    sourcesDropDownMenuItems = [];
                for (int i = 0; i < listOfSources.data!.length; i++) {
                  sourcedto.Source source = listOfSources.data![i];
                  sourcesDropDownMenuItems
                      .add(DropdownMenuItem<sourcedto.Source>(
                    value: source,
                    child: Text(source.name),
                  ));
                  debugPrint(
                      "Added Source with name: ${source.name} and id: ${source.id}");
                }
                return DropdownButtonFormField(
                  items: sourcesDropDownMenuItems,
                  onChanged: (sourcedto.Source? selectedSource) {
                    setState(() {
                      _selectedSource = selectedSource;
                    });
                    sourceProvider.setSourceId(_selectedSource!.id);
                    debugPrint(
                        "The Selected DropdownButtonFormField value is of type"
                        " ${selectedSource.runtimeType.toString()}"
                        " , with name:${_selectedSource?.name} ,"
                        " and id:${_selectedSource!.id}");
                  },
                  hint: const Text("الكسارة"),
                  validator: (value) =>
                      value == null ? "قم باختيار الكسارة" : null,
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
