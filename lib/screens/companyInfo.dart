import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:flutter_spacex/services/spacex_api.dart';
import 'package:flutter_spacex/widgets/bottomMenu.dart';
import 'package:flutter_spacex/widgets/navDrawer.dart';

class CompanyInfo extends StatefulWidget {
  static const String routeName = '/company_info';

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  Future<CompanyInfoDto> futureCompanyInfo;

  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    futureCompanyInfo = getCompanyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company info"),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  "General info",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Music by Julie Gable. Lyrics by Sidney Stein"),
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
                ),
              ),
              // SizedBox(height: 15),
              // FutureBuilder(
              //     future: futureCompanyInfo,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return Text(snapshot.data.name);
              //       } else if (snapshot.hasError) {
              //         return Text("${snapshot.error}");
              //       }
              //       // By default, show a loading spinner.
              //       return CircularProgressIndicator();
              //     })
            ],
          ),
        ),
      ),
    );
  }
}
