import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/launchDto.dart';
import 'package:flutter_spacex/services/spacex_api.dart';

class LaunchesList extends StatefulWidget {
  static const String routeName = '/launches';

  @override
  State<StatefulWidget> createState() => _LaunchesListState();
}

class _LaunchesListState extends State<LaunchesList> {
  late Future<Launch> futureLatestLaunch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureLatestLaunch = getLatestLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 45.0),
        child: FutureBuilder(
          future: futureLatestLaunch,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data?.name != null) {
              return Text(
                snapshot.data!.name!,
                style: TextStyle(color: Colors.white),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return Text("NO DATA");
          },
        ),
      ),
    );
  }
}
