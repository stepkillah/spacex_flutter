import 'dart:convert';

import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:http/http.dart' as http;


Future<CompanyInfoDto> getCompanyInfo() async {
  final response = await http.get('https://api.spacexdata.com/v3/info');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CompanyInfoDto.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load SpaceX company info');
  }
}