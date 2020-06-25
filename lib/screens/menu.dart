import 'package:flutter/material.dart';
import 'package:flutter_spacex/pageRoutes.dart';

class SideMenu extends StatelessWidget {
  static const String routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
              Navigator.of(context).pushNamed(PageRoutes.companyInfo);
            },
            child: ListTile(
              leading: Icon(Icons.domain),
              trailing: Icon(Icons.chevron_right),
              title: Text("SpaceX"),
              subtitle: Text(
                  "General information about SpaceX"),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
              Navigator.of(context).pushNamed(PageRoutes.companyInfo);
            },
            child: ListTile(
              leading: Icon(Icons.info),
              trailing: Icon(Icons.chevron_right),
              title: Text("About app"),
              subtitle: Text("Application details"),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
              Navigator.of(context).pushNamed(PageRoutes.companyInfo);
            },
            child: ListTile(
              leading: Icon(Icons.verified_user),
              trailing: Icon(Icons.chevron_right),
              title: Text("Author"),
              subtitle: Text("Application author information"),
            ),
          ),
        ),
      ],
    );
  }
}
