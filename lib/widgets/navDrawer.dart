import 'package:flutter/material.dart';
import 'package:flutter_spacex/pageRoutes.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Header"),
            decoration: BoxDecoration(color: Colors.lightBlue),
          ),
          ListTile(
            title: Text("Home"),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushReplacementNamed(context, PageRoutes.home);
            },
          ),
          ListTile(
            title: Text("SpaceX company info"),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushReplacementNamed(context, PageRoutes.companyInfo);
            },
          ),
                ListTile(
            title: Text("Side menu"),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushReplacementNamed(context, PageRoutes.menu);
            },
          )
        ],
      ),
    );
  }
}
