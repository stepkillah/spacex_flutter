import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:flutter_spacex/services/spacex_api.dart';
import 'package:flutter_spacex/widgets/navDrawer.dart';

class CompanyInfo extends StatefulWidget {
  static const String routeName = '/company_info';

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  Future<CompanyInfoDto> futureCompanyInfo;

  @override
  void initState() {
    super.initState();
    futureCompanyInfo = getCompanyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SpaceX Info")),
      drawer: NavDrawer(),
      body: new Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
              future: futureCompanyInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.name);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              })
        ],
      ))),
    );
  }
}
