import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          Container(
            width: 200,
            height: 200,
            child: Image(
              image: AssetImage("assets/images/block.png"),
            ),
          ),
          Text(
            "هذه الصفحة تحت التطوير",
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}
