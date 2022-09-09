import 'package:flutter/material.dart';
import 'package:salah_construction/typedefs.dart';

class EntityAdderAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  EntityAdderAppBar({
    Key? key,
    required this.title,
    required this.formkey,
    required this.entityArabicName,
    required this.alertDialogConfirmationText,
    this.onAdd,
    this.onUpdate,
    required this.entity,
  })
      : preferredSize = const Size.fromHeight(56),
        super(key: key);

  /// todo:8 define new field with type EntityUpdaterCallback onUpdate
  final GlobalKey<FormState> formkey;
  final String entityArabicName;
  final String alertDialogConfirmationText;
  EntityAdderCallback? onAdd;
  EntityUpdaterCallback? onUpdate;
  final dynamic entity;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "${title}",
        style: Theme
            .of(context)
            .textTheme
            .subtitle2,
      ),
      // backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(
            Icons.check,
            // color: Colors.black,
          ),
          onPressed: () async {
            if (formkey.currentState!.validate()) {
              return showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (_) {
                  return AlertDialog(
                    title: Text('تأكيد اضافة ${entityArabicName}'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                            "${alertDialogConfirmationText}\n",
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText2,
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('تأكيد'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                            Text("تم اضافة ال${entityArabicName}بنجاح"),
                            backgroundColor: Colors.green,
                          ));
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'الغاء',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
