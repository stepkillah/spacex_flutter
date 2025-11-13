/// Details about a specific launch, performed by a Falcon rocket,
/// including launch & landing pads, rocket & payload information...
class Launch {
  final String? id;
  final int? flightNumber;
  final String? name;
  final DateTime? dateUtc;
  final int? dateUnix;
  final String? dateLocal;
  final String? datePrecision;
  final bool? upcoming;
  final bool? success;
  final String? details;
  final String? rocketId;
  final String? launchpadId;
  final List<String>? crew;
  final List<String>? ships;
  final List<String>? capsules;
  final List<String>? payloads;
  final LaunchLinks? links;
  final DateTime? staticFireDateUtc;
  final int? staticFireDateUnix;
  final bool? net;
  final int? window;
  final List<CoreDetail>? cores;
  final bool? autoUpdate;
  final bool? tbd;
  final String? launchLibraryId;
  final List<Failure>? failures;

  const Launch({
    this.id,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.success,
    this.details,
    this.rocketId,
    this.launchpadId,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.net,
    this.window,
    this.cores,
    this.autoUpdate,
    this.tbd,
    this.launchLibraryId,
    this.failures,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'],
      flightNumber: json['flight_number'],
      name: json['name'],
      dateUtc: json['date_utc'] != null ? DateTime.parse(json['date_utc']).toLocal() : null,
      dateUnix: json['date_unix'],
      dateLocal: json['date_local'],
      datePrecision: json['date_precision'],
      upcoming: json['upcoming'],
      success: json['success'],
      details: json['details'],
      rocketId: json['rocket'],
      launchpadId: json['launchpad'],
      crew: json['crew'] != null ? List<String>.from(json['crew']) : null,
      ships: json['ships'] != null ? List<String>.from(json['ships']) : null,
      capsules: json['capsules'] != null ? List<String>.from(json['capsules']) : null,
      payloads: json['payloads'] != null ? List<String>.from(json['payloads']) : null,
      links: json['links'] != null ? LaunchLinks.fromJson(json['links']) : null,
      staticFireDateUtc: json['static_fire_date_utc'] != null ? DateTime.parse(json['static_fire_date_utc']).toLocal() : null,
      staticFireDateUnix: json['static_fire_date_unix'],
      net: json['net'],
      window: json['window'],
      cores: json['cores'] != null ? (json['cores'] as List).map((c) => CoreDetail.fromJson(c)).toList() : null,
      autoUpdate: json['auto_update'],
      tbd: json['tbd'],
      launchLibraryId: json['launch_library_id'],
      failures: json['failures'] != null ? (json['failures'] as List).map((f) => Failure.fromJson(f)).toList() : null,
    );
  }

  // Convenience getters for backward compatibility
  String? get patchUrl => links?.patch?.small ?? links?.patch?.large;
  DateTime? get launchDate => dateUtc;
  bool? get launchSuccess => success;
}

/// Launch links structure
class LaunchLinks {
  final PatchLinks? patch;
  final RedditLinks? reddit;
  final FlickrLinks? flickr;
  final String? presskit;
  final String? webcast;
  final String? youtubeId;
  final String? article;
  final String? wikipedia;

  const LaunchLinks({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  factory LaunchLinks.fromJson(Map<String, dynamic> json) {
    return LaunchLinks(
      patch: json['patch'] != null ? PatchLinks.fromJson(json['patch']) : null,
      reddit: json['reddit'] != null ? RedditLinks.fromJson(json['reddit']) : null,
      flickr: json['flickr'] != null ? FlickrLinks.fromJson(json['flickr']) : null,
      presskit: json['presskit'],
      webcast: json['webcast'],
      youtubeId: json['youtube_id'],
      article: json['article'],
      wikipedia: json['wikipedia'],
    );
  }
}

class PatchLinks {
  final String? small;
  final String? large;

  const PatchLinks({this.small, this.large});

  factory PatchLinks.fromJson(Map<String, dynamic> json) {
    return PatchLinks(
      small: json['small'],
      large: json['large'],
    );
  }
}

class RedditLinks {
  final String? campaign;
  final String? launch;
  final String? media;
  final String? recovery;

  const RedditLinks({this.campaign, this.launch, this.media, this.recovery});

  factory RedditLinks.fromJson(Map<String, dynamic> json) {
    return RedditLinks(
      campaign: json['campaign'],
      launch: json['launch'],
      media: json['media'],
      recovery: json['recovery'],
    );
  }
}

class FlickrLinks {
  final List<String>? small;
  final List<String>? original;

  const FlickrLinks({this.small, this.original});

  factory FlickrLinks.fromJson(Map<String, dynamic> json) {
    return FlickrLinks(
      small: json['small'] != null ? List<String>.from(json['small']) : null,
      original: json['original'] != null ? List<String>.from(json['original']) : null,
    );
  }
}

/// Core detail for each booster used in the launch
class CoreDetail {
  final String? core;
  final int? flight;
  final bool? gridfins;
  final bool? legs;
  final bool? reused;
  final bool? landingAttempt;
  final bool? landingSuccess;
  final String? landingType;
  final String? landpad;

  const CoreDetail({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  factory CoreDetail.fromJson(Map<String, dynamic> json) {
    return CoreDetail(
      core: json['core'],
      flight: json['flight'],
      gridfins: json['gridfins'],
      legs: json['legs'],
      reused: json['reused'],
      landingAttempt: json['landing_attempt'],
      landingSuccess: json['landing_success'],
      landingType: json['landing_type'],
      landpad: json['landpad'],
    );
  }
}

/// Launch failure details
class Failure {
  final int? time;
  final num? altitude;
  final String? reason;

  const Failure({this.time, this.altitude, this.reason});

  factory Failure.fromJson(Map<String, dynamic> json) {
    return Failure(
      time: json['time'],
      altitude: json['altitude'],
      reason: json['reason'],
    );
  }
}
