import 'package:flutter_spacex/screens/home/home.dart';
import 'package:flutter_spacex/screens/info/appInfo.dart';
import 'package:flutter_spacex/screens/info/authorInfo.dart';
import 'package:flutter_spacex/screens/info/companyInfo.dart';
import 'package:flutter_spacex/screens/launches/launch_details.dart';
import 'package:flutter_spacex/screens/launches/main_launches.dart';
import 'package:flutter_spacex/screens/menu.dart';

class PageRoutes {
  static const String home = MyHomePage.routeName;
  static const String companyInfo = CompanyInfo.routeName;
  static const String menu = SideMenu.routeName;
  static const String launches = LaunchesList.routeName;
  static const String launchDetails = LaunchDetailsPage.routeName;
  static const String authorInfo = AuthorInfo.routeName;
  static const String appInfo = AppInfo.routeName;
}
