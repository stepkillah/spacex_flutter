import 'package:flutter/material.dart';

import 'launchContent.dart';

class NextLaunchCard extends StatelessWidget {
  final Future nextLaunchFuture;

  const NextLaunchCard({Key key, this.nextLaunchFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 5),
          child: Column(
            children: <Widget>[
              Text(
                "Next launch",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                "0 days 0 hours 53 minutes 19 seconds",
                style: TextStyle(
                  fontSize: 18.5,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: FutureBuilder(
            future: nextLaunchFuture,
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
