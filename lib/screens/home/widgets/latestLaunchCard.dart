import 'package:flutter/material.dart';
import 'package:flutter_spacex/screens/home/widgets/launchContent.dart';

class LatestLaunchCard extends StatelessWidget {
  final Future latestFuture;

  const LatestLaunchCard({required Key key, required this.latestFuture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 5),
          child: Text(
            "Latest launch",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Card(
          child: FutureBuilder(
            future: latestFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return buildLoadedData(context, snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Text("NO DATA");
            },
          ),
        ),
      ],
    );
  }
}
