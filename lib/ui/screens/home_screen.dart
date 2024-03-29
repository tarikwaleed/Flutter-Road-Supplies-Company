import 'package:flutter/material.dart';
import 'package:salah_construction/ui/screens/employees_screen.dart';
import 'package:salah_construction/ui/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MixersListScreen(),
    ClientsScreen(),
    EmployeesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/logo.png')),
              label: ' الخلاطات'),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_sharp),
            label: 'العملاء',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الموظفين',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
