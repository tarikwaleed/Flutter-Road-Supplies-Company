import 'package:flutter/material.dart';

class EmptyShipmentList extends StatelessWidget {
  const EmptyShipmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 250,),
          Container(
              width: 100,
              height: 100,
              child: Image(
                  image: AssetImage(
                "assets/images/empty.png",
              ))),
          Text(
            "لا توجد نقل",
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
