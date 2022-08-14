import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/source_model.dart' as sourcemodel;
import '../../../../services/services.dart';
import '../../../../providers/providers.dart';

class SourceDropDownButtonFormField extends StatefulWidget {
  const SourceDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<SourceDropDownButtonFormField> createState() =>
      _SourceDropDownButtonFormFieldState();
}

class _SourceDropDownButtonFormFieldState
    extends State<SourceDropDownButtonFormField> {
  sourcemodel.Source? _selectedSource;
  final _sourceDBService = SourceDBService();
  Future<List<sourcemodel.Source>>? _futureListOfSources;

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
                AsyncSnapshot<List<sourcemodel.Source>> listOfSources) {
              if (listOfSources.connectionState == ConnectionState.waiting) {
                return const Text("جار تحميل بيانات المواد");
              } else {
                List<DropdownMenuItem<sourcemodel.Source>>
                    sourcesDropDownMenuItems = [];
                for (int i = 0; i < listOfSources.data!.length; i++) {
                  sourcemodel.Source source = listOfSources.data![i];
                  sourcesDropDownMenuItems
                      .add(DropdownMenuItem<sourcemodel.Source>(
                    value: source,
                    child: Text(source.name),
                  ));
                  debugPrint(
                      "Added Source with name: ${source.name} and id: ${source.id}");
                }
                return DropdownButtonFormField(
                  items: sourcesDropDownMenuItems,
                  onChanged: (sourcemodel.Source? selectedSource) {
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
