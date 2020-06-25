import 'package:flutter/material.dart';

class LaunchDetailsPage extends StatefulWidget {
  static const String routeName = '/launches/details';

  @override
  State<StatefulWidget> createState() => _LaunchDetailsState();
}

class _LaunchDetailsState extends State<LaunchDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch details"),
      ),
      body: Container(
        child: Text("Launch details page"),
      ),
    );
  }
}
