import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/providers/material_id_provider.dart';
import 'package:salah_construction/services/services.dart';
import 'package:salah_construction/dtos/material.dart'as materialdto;

//todo: Refacor each component to use the new Architecture
class MaterialDropDownButtonFormField extends StatefulWidget {
  const MaterialDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  State<MaterialDropDownButtonFormField> createState() =>
      _MaterialDropDownButtonFormFieldState();
}

class _MaterialDropDownButtonFormFieldState
    extends State<MaterialDropDownButtonFormField> {
  materialdto.Material? _selectedMaterial;
  final _materialDBService = MaterialDBService();
  Future<List<materialdto.Material>>? _futureListOfMaterials;

  _getAllMaterials() {
    _futureListOfMaterials = _materialDBService.retrieveMaterials();
  }

  @override
  initState() {
    super.initState();
    _getAllMaterials();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("${this.runtimeType} Build Method Called");
    final materialProvider =
        Provider.of<MaterialProvier>(context, listen: false);

    return Column(
      children: [
        FutureBuilder(
            future: _futureListOfMaterials,
            builder: (BuildContext context,
                AsyncSnapshot<List<materialdto.Material>> listOfMaterials) {
              if (listOfMaterials.connectionState == ConnectionState.waiting) {
                return const Text("جار تحميل بيانات المواد");
              } else {
                List<DropdownMenuItem<materialdto.Material>>
                    materialsDropDownMenuItems = [];
                for (int i = 0; i < listOfMaterials.data!.length; i++) {
                  materialdto.Material material = listOfMaterials.data![i];
                  materialsDropDownMenuItems
                      .add(DropdownMenuItem<materialdto.Material>(
                    value: material,
                    child: Text(material.name),
                  ));
                  debugPrint(
                      "Added Material with name: ${material.name} and id: ${material.id}");
                }
                return DropdownButtonFormField(
                  items: materialsDropDownMenuItems,
                  onChanged: (materialdto.Material? selectedMaterial) {
                    setState(() {
                      _selectedMaterial = selectedMaterial;
                    });
                    materialProvider.setMaterialId(selectedMaterial!.id);
                    debugPrint(
                        "The Selected DropdownButtonFormField value is of type ${selectedMaterial.runtimeType.toString()} , with name:${selectedMaterial.name} , and id:${selectedMaterial.id}");
                  },
                  hint: const Text("نوع المادة"),
                  validator: (value) =>
                      value == null ? "قم باختيار نوع المادة" : null,
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
