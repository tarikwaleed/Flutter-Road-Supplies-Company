import 'package:flutter/material.dart';
import 'package:salah_construction/models/mixer_model.dart';

class MixerDetailsScreen extends StatefulWidget {
  const MixerDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MixerDetailsScreen> createState() => _MixerDetailsScreenState();
}

class _MixerDetailsScreenState extends State<MixerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final mixerFields = ModalRoute.of(context)!.settings.arguments as Mixer;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "خلاطة ${mixerFields.name}",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
    );
  }
}
