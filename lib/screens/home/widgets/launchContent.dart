import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/launchDto.dart';
import 'package:flutter_spacex/pageRoutes.dart';
import 'package:intl/intl.dart';

Widget buildLoadedData(BuildContext context, Launch launch) {
  return Column(
    children: <Widget>[
      ListTile(
        leading: Image.network(launch.patchUrl!),
        title: Text(
          launch.name!,
        ),
        subtitle: Row(
          children: <Widget>[
            Text("Your time: "),
            Text(
              DateFormat('yyyy-MM-dd – hh:mm:ss').format(launch.launchDate!),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          launch.details!,
          style: TextStyle(fontSize: 12.5),
        ),
      ),
      OverflowBar(
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(PageRoutes.launchDetails);
            },
            child: Text("Read more"),
          )
        ],
      )
    ],
  );
}
