import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorInfo extends StatelessWidget {
  static const String routeName = '/author_info';

  void openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _linkedIn() =>
      openUrl("https://www.linkedin.com/company/4twenty-solutions/");
  void _onEmail() =>
      openUrl("mailto:support@4twenty.solutions?subject=SpaceX App");
  void _onGitHub() => openUrl("https://github.com/4TwentySolutions");
  void _onGitHubApp() =>
      openUrl("https://github.com/stepkillah/spacex_flutter");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Author Information"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                          "https://avatars1.githubusercontent.com/u/57572343?s=200&v=4",
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "4Twenty Solutions",
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
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                title: Text(
                  "Summary",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  "Our main task is to make a working and quality product. We feed all your ideas with our digital mastery and non-standard thinking considering all the tasks that you set by contacting us. We build long-term relationships with our clients and partners, transparency and straightforwardness are the key to such relationships. Our team gathered in itself only experienced professionals, focused on results and reputation.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                title: Text(
                  "Contacts",
                  style: Theme.of(context).textTheme.titleMedium,
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
                          child: Text("LinkedIn"),
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
        ),
      ),
    );
  }
}
