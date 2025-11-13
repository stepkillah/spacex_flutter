import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:flutter_spacex/screens/info/widgets/infoRow.dart';
import 'package:flutter_spacex/services/spacex_api.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

// Import the base URL constant
import 'package:flutter_spacex/services/spacex_api.dart' show baseApiUrlRoot;

class CompanyInfo extends StatefulWidget {
  static const String routeName = '/company_info';

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  late Future<CompanyInfoDto> futureCompanyInfo;
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
  }

  void openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
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
                    style: _cardTitleStyle,
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
                    style: _cardTitleStyle,
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
                    style: _cardTitleStyle,
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
                    style: _cardTitleStyle,
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
                              onTap: () => openUrl("https://github.com/r-spacex/SpaceX-API"),
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
