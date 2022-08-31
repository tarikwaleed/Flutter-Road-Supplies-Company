import 'package:flutter/material.dart';

class SalahConstructionDrawer extends StatelessWidget {
  const SalahConstructionDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "الخيارات",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/source.png'),
              backgroundColor: Colors.white,
            ),
            title: Text(
              "الكسارات",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/sources');
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/material.png'),
              backgroundColor: Colors.white,
            ),
            title: Text(
              "المواد",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/sources');
            },
          ),
        ],
      ),
    );
  }
}
