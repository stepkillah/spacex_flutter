import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:flutter_spacex/screens/info/widgets/infoRow.dart';
import 'package:flutter_spacex/services/spacex_api.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

// Import the base URL constant

class CompanyInfo extends StatefulWidget {
  static const String routeName = '/company_info';

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  late Future<CompanyInfoDto> futureCompanyInfo;

  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    futureCompanyInfo = getCompanyInfo();
  }

  void openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
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
                "https://c4.wallpaperflare.com/wallpaper/768/180/8/falcon-9-spacex-rocket-space-hd-wallpaper-preview.jpg",
                height: 145.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 35.0,
                      width: 35.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/originals/9a/21/4b/9a214b68fc4146d02a5b41882e79987c.jpg"),
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      "Space X",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  title: Text(
                    "Summary",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: FutureBuilder(
                    future: futureCompanyInfo,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data?.summary ?? '',
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
                          color: Colors.white70,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  title: Text(
                    "General info",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      InfoRow(
                        key: Key("name"),
                        rowName: "Name",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.name;
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                          key: Key("founder"),
                          rowName: "Founder",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.founder;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                        key: Key("founded"),
                        rowName: "Founded",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.foundedYear.toString();
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                        key: Key("employees"),
                        rowName: "Employees",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.employees.toString();
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                        key: Key("vehicles"),
                        rowName: "Vehicles count",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.vehicles.toString();
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                        key: Key("launch_sites"),
                        rowName: "Launch sites",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.launchSites.toString();
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                        key: Key("test_sites"),
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
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  title: Text(
                    "Personal info",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      InfoRow(
                        key: Key("ceo"),
                        rowName: "CEO",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.ceo;
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                          key: Key("cto"),
                          rowName: "CTO",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.cto;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                          key: Key("coo"),
                          rowName: "COO",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.coo;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                          key: Key("cto_propulsion"),
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
              Card(
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  title: Text(
                    "Location",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      InfoRow(
                        key: Key("address"),
                        rowName: "Address",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.headquarters.address;
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                          key: Key("city"),
                          rowName: "City",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.headquarters.city;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                          key: Key("state"),
                          rowName: "State",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.headquarters.state;
                          }),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  title: Text(
                    "API Info",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("API URL: "),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => openUrl(baseApiUrlRoot),
                              child: Text(
                                baseApiUrlRoot,
                                style: TextStyle(color: Colors.blue),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Documentation: "),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => openUrl(
                                  "https://github.com/r-spacex/SpaceX-API"),
                              child: Text(
                                "GitHub",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
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
