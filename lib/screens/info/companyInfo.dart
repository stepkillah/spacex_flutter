import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:flutter_spacex/screens/info/widgets/infoRow.dart';
import 'package:flutter_spacex/services/spacex_api.dart';
import 'package:shimmer/shimmer.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            snap: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Company info"),
              background: Image.network(
                "https://cdn.dribbble.com/users/610788/screenshots/5157282/spacex.png",
                height: 145.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Card(
                child: ListTile(
                  title: Text("Summary"),
                  subtitle: FutureBuilder(
                    future: futureCompanyInfo,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data.summary,
                          style: TextStyle(color: Colors.white),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner.
                      return Shimmer.fromColors(
                        baseColor: Colors.white10,
                        highlightColor: Colors.white60,
                        child: Container(
                          height: 15.0,
                          width: 75.0,
                          color: Colors.white70,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "General info",
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      InfoRow(
                        rowName: "Name",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.name;
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "Founder",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.founder;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                        rowName: "Founded",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.foundedYear.toString();
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                        rowName: "Employees",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.employees.toString();
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                        rowName: "Vehicles count",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.vehicles.toString();
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                        rowName: "Launch sites",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.launchSites.toString();
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                        rowName: "Test sites",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.testSites.toString();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Personal info"),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      InfoRow(
                        rowName: "CEO",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.ceo;
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "CTO",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.cto;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "COO",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.coo;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "CTO Propulsion",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.ctoPropulsion;
                          }),
                      SizedBox(height: 2.5),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
