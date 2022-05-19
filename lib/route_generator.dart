import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salah_construction/screens/home_screen.dart';
import 'package:salah_construction/screens/mixer_details.dart';

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
