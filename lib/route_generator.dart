import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salah_construction/screens/home_screen.dart';
import 'package:salah_construction/screens/mixer_details.dart';
import 'package:salah_construction/screens/shipment_item_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case '/mixer_details':
        return MaterialPageRoute(
            builder: (context) => MixerDetailsScreen(
                  mixerData: args,
                ));
      case '/shipment_item_screen':
        return MaterialPageRoute(
            builder: (context) => ShipmentItemScreen(mixerData: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text(
            "Page Not Found!",
            style: TextStyle(
              fontSize: 50,
              color: Colors.red,
            ),
          ),
        ),
      );
    });
  }
}
