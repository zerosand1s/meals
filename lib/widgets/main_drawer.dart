import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // Container(
          //   width: double.infinity,
          //   height: 100,
          //   padding: EdgeInsets.all(20),
          //   alignment: Alignment.centerLeft,
          //   color: Theme.of(context).accentColor,
          //   child: Text(
          //     'Select',
          //     style: TextStyle(
          //       fontSize: 30,
          //       fontWeight: FontWeight.w900,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 50,
          ),
          buildListTitle(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTitle(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}
