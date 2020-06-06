import 'package:flutter/material.dart';
import 'package:flutter_spacex/pageRoutes.dart';
import 'package:flutter_spacex/screens/companyInfo.dart';

class SideMenu extends StatelessWidget {
  static const String routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Image.network(
          "https://cdn.dribbble.com/users/610788/screenshots/5157282/spacex.png",
          height: 145.0,
          fit: BoxFit.cover,
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
              leading: Icon(Icons.domain),
              trailing: Icon(Icons.chevron_right),
              title: Text("Company info"),
              subtitle: Text("General Space X company information"),
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
