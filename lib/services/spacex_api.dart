import 'dart:convert';

import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:flutter_spacex/data/apiInfoDto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

const String baseApiUrl = "https://api.spacexdata.com/v3";

Future<CompanyInfoDto> getCompanyInfo() async {
  final file = await DefaultCacheManager()
      .getSingleFile("$baseApiUrl/info");
  if (file != null && await file.exists()) {
    var res = await file.readAsString();
    return CompanyInfoDto.fromJson(json.decode(res));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load SpaceX company info');
  }
}

Future<ApiInfoDto> getApiInfo() async {
  final file = await DefaultCacheManager()
      .getSingleFile(baseApiUrl);
  if (file != null && await file.exists()) {
    var res = await file.readAsString();
    return ApiInfoDto.fromJson(json.decode(res));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load SpaceX company info');
  }
}