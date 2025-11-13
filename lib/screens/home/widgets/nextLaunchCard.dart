import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/launchDto.dart';

import 'launchContent.dart';

class NextLaunchCard extends StatefulWidget {
  final Future<Launch> nextLaunchFuture;

  const NextLaunchCard({required Key key, required this.nextLaunchFuture})
      : super(key: key);

  @override
  _NextLaunchCardState createState() => _NextLaunchCardState();
}

class _NextLaunchCardState extends State<NextLaunchCard> {
  Timer? _timer;
  String _timeRemaining = "Unknown time";

  @override
  void initState() {
    super.initState();
    widget.nextLaunchFuture.then((launch) {
      if (launch.dateUtc != null) {
        _startTimer(launch.dateUtc!);
      }
    });
  }

  void _startTimer(DateTime launchDate) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        final now = DateTime.now();
        final difference = launchDate.difference(now);
        if (difference.isNegative) {
          _timeRemaining = "Launch has passed";
          _timer?.cancel();
        } else {
          final days = difference.inDays;
          final hours = difference.inHours % 24;
          final minutes = difference.inMinutes % 60;
          final seconds = difference.inSeconds % 60;
          _timeRemaining =
              "$days days $hours hours $minutes minutes $seconds seconds";
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                _timeRemaining,
                style: TextStyle(
                  fontSize: 18.5,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: FutureBuilder(
            future: widget.nextLaunchFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return buildLoadedData(context, snapshot.data!);
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
