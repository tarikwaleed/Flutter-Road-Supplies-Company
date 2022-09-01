import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salah_construction/datarepos/datarepos.dart';
import 'package:salah_construction/providers/providers.dart';
import 'package:salah_construction/ui/components/components.dart';

import '../../dtos/source.dart' as sourcedto;

class SourceItemScreen extends StatelessWidget {
  const SourceItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sourceDataRepo = SourceDataRepository();
    final sourceNameProvider = Provider.of<SourceNameProvider>(context);
    final formKey = GlobalKey<FormState>();
    final source = sourcedto.Source(name: sourceNameProvider.sourceName);
    return Scaffold(
      appBar: EntityAdderAppBar(
        title: "اضافة كسارة",
        formkey: formKey,
        entityArabicName: "كسارة",
        alertDialogConfirmationText: "تأكيد اضافة كسارة",
        onAdd: () {
          sourceDataRepo.addSource(source);
        },
      ),
    );
  }
}
