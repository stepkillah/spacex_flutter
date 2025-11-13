
/// Auxiliary model to storage all details about a rocket which performed a SpaceX's mission.
class Rocket {
  final String? id, name;
  final List<Core>? firstStage;
  final SecondStage? secondStage;
  final Fairing? fairing;

  const Rocket({
    this.id,
    this.name,
    this.firstStage,
    this.secondStage,
    this.fairing,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['rocket_id'],
      name: json['rocket_name'],
      firstStage: [
        for (final item in json['first_stage']['cores']) Core.fromJson(item)
      ],
      secondStage: SecondStage.fromJson(json['second_stage']),
      fairing:
          json['fairings'] == null ? null : Fairing.fromJson(json['fairings']),
    );
  }  
}

/// Auxiliary model to storage details about a core in a particular mission.
class Core {
  final String? id, landingType, landingZone;
  final bool? reused, landingSuccess, landingIntent, gridfins, legs;
  final int? block, flights;

  const Core({
    this.id,
    this.landingType,
    this.landingZone,
    this.reused,
    this.landingSuccess,
    this.landingIntent,
    this.gridfins,
    this.legs,
    this.block,
    this.flights,
  });

  factory Core.fromJson(Map<String, dynamic> json) {
    return Core(
      id: json['core_serial'],
      landingType: json['landing_type'],
      landingZone: json['landing_vehicle'],
      reused: json['reused'],
      landingSuccess: json['land_success'],
      landingIntent: json['landing_intent'],
      gridfins: json['gridfins'],
      legs: json['legs'],
      block: json['block'],
      flights: json['flight'],
    );
  }

}

/// Details about a rocket's second stage.
class SecondStage {
  final int? block;
  final List<Payload>? payloads;

  const SecondStage({this.block, this.payloads});

  factory SecondStage.fromJson(Map<String, dynamic> json) {
    return SecondStage(
      block: json['block'],
      payloads: [
        for (final payload in json['payloads']) Payload.fromJson(payload)
      ],
    );
  }

}

/// Specific details about an one-of-a-kink space payload.
class Payload {
  final String? id, capsuleSerial, customer, nationality, manufacturer, orbit;
  final bool? reused;
  final num? mass, periapsis, apoapsis, inclination, period;

  const Payload({
    this.id,
    this.capsuleSerial,
    this.customer,
    this.nationality,
    this.manufacturer,
    this.orbit,
    this.reused,
    this.mass,
    this.periapsis,
    this.apoapsis,
    this.inclination,
    this.period,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      id: json['payload_id'],
      capsuleSerial: json['cap_serial'],
      customer: json['customers'].isNotEmpty ? json['customers'][0] : null,
      nationality: json['nationality'],
      manufacturer: json['manufacturer'],
      orbit: json['orbit'],
      reused: json['reused'],
      mass: json['payload_mass_kg'],
      periapsis: json['orbit_params']['periapsis_km'],
      apoapsis: json['orbit_params']['apoapsis_km'],
      inclination: json['orbit_params']['inclination_deg'],
      period: json['orbit_params']['period_min'],
    );
  }
}

/// Auxiliary model to storage details about rocket's fairings.
class Fairing {
  final bool? reused, recoveryAttempt, recoverySuccess;

  const Fairing({
    this.reused,
    this.recoveryAttempt,
    this.recoverySuccess,
  });

  factory Fairing.fromJson(Map<String, dynamic> json) {
    return Fairing(
      reused: json['reused'],
      recoveryAttempt: json['recovery_attempt'],
      recoverySuccess: json['recovered'],
    );
  }
}