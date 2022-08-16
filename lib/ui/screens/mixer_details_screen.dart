import 'package:flutter/material.dart';

import '../components/components.dart';

class MixerDetailsScreen extends StatefulWidget {
  final dynamic mixerData;

  const MixerDetailsScreen({Key? key, required this.mixerData})
      : super(key: key);

  @override
  State<MixerDetailsScreen> createState() => _MixerDetailsScreenState();
}

class _MixerDetailsScreenState extends State<MixerDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "خلاطة ${widget.mixerData.name}",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
        leading: BackButton (
          color: Colors.black,
        ),
      ),
      body: ShipmentListFuture(mixerData: widget.mixerData),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/shipment_item_screen',
              arguments: widget.mixerData);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
  }

}
