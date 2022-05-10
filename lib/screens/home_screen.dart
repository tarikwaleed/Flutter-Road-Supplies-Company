import 'package:flutter/material.dart';
import 'package:salah_construction/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'الخلاطات ',
      style: optionStyle,
    ),
    Text(
      'العملاء ',
      style: optionStyle,
    ),
    Text(
      'الموظفين',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white70,
      //   flexibleSpace: Center(
      //     child: Image(
      //       image: AssetImage('assets/images/logo.png'),
      //       fit: BoxFit.contain,
      //     ),
      //   ),
      // ),
      body: Center(
        child: Column(
          children: [
            Text("اهلا",style: Theme.of(context).textTheme.headline1)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/logo.png')),
            label: ' الخلاطات'
          ),
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
        selectedItemColor: salahConcreteColor,
        unselectedItemColor: Colors.grey[500],
        onTap: _onItemTapped,
      ),
    );
  }
}
