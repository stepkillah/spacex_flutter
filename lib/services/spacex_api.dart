import 'dart:convert';

import 'package:flutter_spacex/data/CompanyInfoDto.dart';
import 'package:flutter_spacex/data/apiInfoDto.dart';
import 'package:flutter_spacex/data/launchDto.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

const String baseApiUrl = "https://api.spacexdata.com/v3";

Future<CompanyInfoDto> getCompanyInfo() async {
  final file = await DefaultCacheManager().getSingleFile("$baseApiUrl/info");
  if (await file.exists()) {
    var res = await file.readAsString();
    return CompanyInfoDto.fromJson(json.decode(res));
  } else {
    throw Exception('Failed to load SpaceX company info');
  }
}

Future<ApiInfoDto> getApiInfo() async {
  final file = await DefaultCacheManager().getSingleFile(baseApiUrl);
  if (await file.exists()) {
    var res = await file.readAsString();
    return ApiInfoDto.fromJson(json.decode(res));
  } else {
    throw Exception('Failed to load SpaceX company info');
  }
}

Future<Launch> getLatestLaunch() async {
  final file =
      await DefaultCacheManager().getSingleFile("$baseApiUrl/launches/latest");
  if (await file.exists()) {
    var res = await file.readAsString();
    return Launch.fromJson(json.decode(res));
  } else {
    throw Exception('Failed to load latest launch');
  }
}

Future<Launch> getNextLaunch() async {
  final file =
      await DefaultCacheManager().getSingleFile("$baseApiUrl/launches/next");
  if (await file.exists()) {
    var res = await file.readAsString();
    return Launch.fromJson(json.decode(res));
  } else {
    throw Exception('Failed to load latest launch');
  }
}
