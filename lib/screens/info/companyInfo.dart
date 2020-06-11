import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:flutter_spacex/data/apiInfoDto.dart';
import 'package:flutter_spacex/screens/info/widgets/infoRow.dart';
import 'package:flutter_spacex/services/spacex_api.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyInfo extends StatefulWidget {
  static const String routeName = '/company_info';

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  Future<CompanyInfoDto> futureCompanyInfo;
  Future<ApiInfoDto> futureApiInfo;
  static const TextStyle _cardTitleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle _sectionTitleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 24.0,
  );

  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    futureCompanyInfo = getCompanyInfo();
    futureApiInfo = getApiInfo();
  }

  void openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _linkedIn() => openUrl("https://www.linkedin.com/company/4twenty-solutions/");
  _onEmail() => openUrl("mailto:support@4twenty.solutions?subject=SpaceX App");
  _onGitHub() => openUrl("https://github.com/4TwentySolutions");
  _onGitHubApp() => openUrl("https://github.com/stepkillah/spacex_flutter");

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
                      style: _sectionTitleStyle,
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
                    style: _cardTitleStyle,
                  ),
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
                    style: _cardTitleStyle,
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
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  title: Text(
                    "Personal info",
                    style: _cardTitleStyle,
                  ),
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
              Card(
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  title: Text(
                    "Location",
                    style: _cardTitleStyle,
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      InfoRow(
                        rowName: "Address",
                        future: futureCompanyInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.headquarters.address;
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "City",
                          future: futureCompanyInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.headquarters.city;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
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
                    style: _cardTitleStyle,
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      InfoRow(
                        rowName: "Name",
                        future: futureApiInfo,
                        futureSnapshot: (snapshot) {
                          return snapshot.data.projectName;
                        },
                      ),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "Version",
                          future: futureApiInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.version;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "Link",
                          onClick: (snapshot) =>
                              openUrl(snapshot.data.projectLink),
                          future: futureApiInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.projectLink;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "Organization",
                          future: futureApiInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.organization;
                          }),
                      SizedBox(height: 2.5),
                      InfoRow(
                          rowName: "Organization link",
                          onClick: (snapshot) =>
                              openUrl(snapshot.data.organizationLink),
                          future: futureApiInfo,
                          futureSnapshot: (snapshot) {
                            return snapshot.data.organizationLink;
                          }),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("Descirption"),
                        subtitle: FutureBuilder(
                          future: futureApiInfo,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data.description,
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
                      )
                      // SizedBox(height: 2.5),
                      // InfoRow(
                      //     rowName: "Description",
                      //     future: futureApiInfo,
                      //     futureSnapshot: (snapshot) {
                      //       return snapshot.data.description;
                      //     }),
                    ],
                  ),
                ),
              ),
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
                                "https://avatars1.githubusercontent.com/u/57572343?s=200&v=4"),
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      "4Twenty Solutions",
                      textAlign: TextAlign.center,
                      style: _sectionTitleStyle,
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    title: Text(
                      "Summary",
                      style: _cardTitleStyle,
                    ),
                    subtitle: Text(
                      "Our main task is to make a working and quality product. We feed all your ideas with our digital mastery and non-standard thinking considering all the tasks that you set by contacting us. We build long-term relationships with our clients and partners, transparency and straightforwardness are the key to such relationships. Our team gathered in itself only experienced professionals, focused on results and reputation.",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  title: Text(
                    "Contacts",
                    style: _cardTitleStyle,
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.email),
                          SizedBox(width: 5),
                          GestureDetector(
                            child: Text("support@4twenty.solutions"),
                            onTap: _onEmail,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.web),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: _linkedIn,
                            child: Text("Linked In"),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.code),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: _onGitHubApp,
                            child: Text("SpaceX Flutter"),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.code),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: _onGitHub,
                            child: Text("GitHub"),
                          ),
                        ],
                      )
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
