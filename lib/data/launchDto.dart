import 'package:flutter_spacex/data/rocketDto.dart';

/// Details about a specific launch, performed by a Falcon rocket,
/// including launch & landing pads, rocket & payload information...
class Launch {
  final int? number, launchWindow;
  final String? name,
      launchpadId,
      launchpadName,
      patchUrl,
      details,
      tentativePrecision;
  final List<String>? links, photos;
  final DateTime? launchDate, staticFireDate;
  final bool? launchSuccess, tentativeTime, upcoming;
  final Rocket? rocket;
  final FailureDetails? failureDetails;

  const Launch({
    this.number,
    this.launchWindow,
    this.name,
    this.launchpadId,
    this.launchpadName,
    this.patchUrl,
    this.details,
    this.tentativePrecision,
    this.links,
    this.photos,
    this.launchDate,
    this.staticFireDate,
    this.launchSuccess,
    this.tentativeTime,
    this.upcoming,
    this.rocket,
    this.failureDetails,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      number: json['flight_number'],
      launchWindow: json['launch_window'],
      name: json['mission_name'],
      launchpadId: json['launch_site']['site_id'],
      launchpadName: json['launch_site']['site_name'],
      patchUrl: json['links']['mission_patch_small'],
      details: json['details'],
      tentativePrecision: json['tentative_max_precision'],
      links: [
        json['links']['video_link'],
        json['links']['reddit_campaign'],
        json['links']['presskit'],
        json['links']['article_link'],
      ].cast<String>(),
      photos: json['links']['flickr_images'].cast<String>(),
      launchDate: DateTime.parse(json['launch_date_utc']).toLocal(),
      staticFireDate: setStaticFireDate(json['static_fire_date_utc']),
      launchSuccess: json['launch_success'],
      tentativeTime: json['is_tentative'],
      upcoming: json['upcoming'],
      rocket: Rocket.fromJson(json['rocket']),
      failureDetails: setFailureDetails(json['launch_failure_details']),
    );
  }

  static DateTime? setStaticFireDate(String date) {
    try {
      return DateTime.parse(date).toLocal();
    } catch (e) {
      return null;
    }
  }

  static FailureDetails? setFailureDetails(Map<String, dynamic> failureDetails) {
    try {
      return FailureDetails.fromJson(failureDetails);
    } catch (e) {
      return null;
    }
  }
}

/// Auxiliar model to storage details about a launch failure.
class FailureDetails {
  final num? time, altitude;
  final String? reason;

  const FailureDetails({this.time, this.altitude, this.reason});

  factory FailureDetails.fromJson(Map<String, dynamic> json) {
    return FailureDetails(
      time: json['time'],
      altitude: json['altitude'],
      reason: json['reason'],
    );
  }
}
