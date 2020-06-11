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
              title: Text("Company info"),
              subtitle: Text("General information about SpaceX and 4Twenty Solutions"),
            ),
          ),
        ),
        ListTile(
          title: Text("First menu"),
          subtitle: Text("Subttitle"),
        ),
        ListTile(
          title: Text("First menu"),
          subtitle: Text("Subttitle"),
        ),
        ListTile(
          title: Text("First menu"),
          subtitle: Text("Subttitle"),
        ),
        ListTile(
          title: Text("First menu"),
          subtitle: Text("Subttitle"),
        ),
        ListTile(
          title: Text("First menu"),
          subtitle: Text("Subttitle"),
        ),
        ListTile(
          title: Text("First menu"),
          subtitle: Text("Subttitle"),
        ),
      ],
    );
  }
}
