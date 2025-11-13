import 'package:flutter/material.dart';
import 'package:flutter_spacex/pageRoutes.dart';
import 'package:flutter_spacex/screens/home/home.dart';
import 'package:flutter_spacex/screens/info/appInfo.dart';
import 'package:flutter_spacex/screens/info/authorInfo.dart';
import 'package:flutter_spacex/screens/launches/launch_details.dart';
import 'package:flutter_spacex/screens/launches/main_launches.dart';
import 'package:flutter_spacex/screens/menu.dart';
import 'package:flutter_spacex/screens/rootPage.dart';
import 'package:flutter_spacex/screens/info/companyInfo.dart';
import 'package:intl/intl.dart';

final routes = <String, WidgetBuilder>{
  PageRoutes.companyInfo: (BuildContext context) => CompanyInfo(),
  PageRoutes.home: (BuildContext context) => MyHomePage(),
  PageRoutes.menu: (BuildContext context) => SideMenu(),
  PageRoutes.launchDetails: (BuildContext context) => LaunchDetailsPage(),
  PageRoutes.launches: (BuildContext context) => LaunchesList(),
  PageRoutes.authorInfo: (BuildContext context) => AuthorInfo(),
  PageRoutes.appInfo: (BuildContext context) => AppInfo(),
};

void main() {
  Intl.defaultLocale = 'en_US';
  runApp(SpaceXApp());
}

class SpaceXApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,

        textTheme: TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
            titleMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )),
      ),
      routes: routes,
      home: RootPage(),
    );
  }
}
