import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo extends StatefulWidget {
  static const String routeName = '/app_info';

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  late Future<PackageInfo> _packageInfoFuture;

  @override
  void initState() {
    super.initState();
    _packageInfoFuture = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Information"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: FutureBuilder<PackageInfo>(
              future: _packageInfoFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final packageInfo = snapshot.data!;
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      title: Text(
                        "Detailed App Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Icon(Icons.mobile_friendly),
                              SizedBox(width: 5),
                              Text("App Version: ${packageInfo.version}"),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Icon(Icons.code),
                              SizedBox(width: 5),
                              GestureDetector(
                                child: Text(
                                    "Build Number: ${packageInfo.buildNumber}"),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Icon(Icons.abc),
                              SizedBox(width: 5),
                              Text("Package Name: ${packageInfo.packageName}"),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Icon(Icons.abc),
                              SizedBox(width: 5),
                              Text("App Name: ${packageInfo.appName}"),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Text('No data available');
                }
              },
            ),
          ),
        ));
  }
}
