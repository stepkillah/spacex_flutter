import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/launchDto.dart';
import 'package:flutter_spacex/screens/home/widgets/latestLaunchCard.dart';
import 'package:flutter_spacex/screens/home/widgets/nextLaunchCard.dart';
import 'package:flutter_spacex/services/spacex_api.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home';
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Launch> futureLatestLaunch;
  late Future<Launch> futureNextLaunch;

  @override
  void initState() {
    super.initState();
    futureLatestLaunch = getLatestLaunch();
    futureNextLaunch = getNextLaunch();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            NextLaunchCard(
                key: Key("next_launch_card"),
                nextLaunchFuture: futureNextLaunch),
            LatestLaunchCard(
                key: Key("latest_launch_card"),
                latestFuture: futureLatestLaunch),
          ],
        ),
      ),
    );
  }
}
