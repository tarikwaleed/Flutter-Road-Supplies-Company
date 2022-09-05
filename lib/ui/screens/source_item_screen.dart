import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/ui/components/components.dart';
import 'package:salah_construction/ui/components/text_form_fields/source_item_screen/source_name_text_form_field.dart';

import '../../dtos/source.dart' as sourcedto;

class SourceItemScreen extends StatefulWidget {
  const SourceItemScreen({Key? key}) : super(key: key);

  @override
  State<SourceItemScreen> createState() => _SourceItemScreenState();
}

class _SourceItemScreenState extends State<SourceItemScreen> {
  final formKey = GlobalKey<FormState>();
  final sourceDataRepo = SourceDataRepository();
  @override
  Widget build(BuildContext context) {
    final sourceNameProvider = Provider.of<SourceNameProvider>(context);
    final source = sourcedto.Source(name: sourceNameProvider.sourceName);
    return Scaffold(
      appBar: EntityAdderAppBar(
        title: "اضافة كسارة",
        formkey: formKey,
        entityArabicName: "كسارة",
        alertDialogConfirmationText: "تأكيد اضافة كسارة",
        entity: source,
        adder: sourceDataRepo.addSource,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              SourceNameTextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
