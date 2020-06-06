import 'package:flutter/material.dart';
import 'package:flutter_spacex/data/companyInfoDto.dart';
import 'package:shimmer/shimmer.dart';

class InfoRow extends StatefulWidget {
  final String rowName;
  final Future future;
  final String Function(AsyncSnapshot<dynamic> snapshot) futureSnapshot;

  const InfoRow({Key key, this.rowName, this.future, this.futureSnapshot})
      : super(key: key);

  @override
  _InfoRowState createState() => _InfoRowState();
}

class _InfoRowState extends State<InfoRow> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Text(widget.rowName + ": "),
        FutureBuilder(
          future: widget.future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                widget.futureSnapshot.call(snapshot),
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
        )
      ],
    );
  }
}
