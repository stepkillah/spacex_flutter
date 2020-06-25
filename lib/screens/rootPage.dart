import 'package:flutter/material.dart';
import 'package:flutter_spacex/screens/launches/main_launches.dart';
import 'package:flutter_spacex/widgets/bottomMenu.dart';

import 'home/home.dart';
import 'menu.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  PageController controller = PageController();
  List<Widget> homePages = new List();
  @override
  void initState() {
    super.initState();
    homePages.add(MyHomePage());
    homePages.add(LaunchesList());
    homePages.add(Text("Third tab"));
    homePages.add(SideMenu());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
          });
        },
        controller: controller,
        itemBuilder: (context, position) {
          return homePages[position];
        },
        itemCount: 4, // Can be null
      ),
      bottomNavigationBar: BottomMenu(controller, selectedIndex),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
