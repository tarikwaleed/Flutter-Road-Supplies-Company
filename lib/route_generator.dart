import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salah_construction/ui/screens/clients_screen.dart';
import 'package:salah_construction/ui/screens/employees_screen.dart';
import 'package:salah_construction/ui/screens/login_screen.dart';
import 'package:salah_construction/ui/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case '/mixer_details':
        return MaterialPageRoute(
            builder: (context) => MixerDetailsScreen(
                  mixer: args,
                ));
      case '/shipment_item_screen':
        return MaterialPageRoute(
            builder: (context) => ShipmentItemScreen(mixerData: args));
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/clients':
        return MaterialPageRoute(builder: (_) => ClientsScreen());
      case '/employees':
        return MaterialPageRoute(builder: (_) => EmployeesScreen());

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
