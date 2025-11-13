class CompanyInfoDto {
  final String? id;
  final String? name;
  final String? founder;
  final int? founded;
  final int? employees;
  final int? vehicles;
  final int? launchSites;
  final int? testSites;
  final String? ceo;
  final String? cto;
  final String? coo;
  final String? ctoPropulsion;
  final num? valuation;
  final Headquarters? headquarters;
  final CompanyLinks? links;
  final String? summary;

  CompanyInfoDto({
    this.id,
    this.name,
    this.founder,
    this.founded,
    this.employees,
    this.vehicles,
    this.launchSites,
    this.testSites,
    this.ceo,
    this.cto,
    this.coo,
    this.ctoPropulsion,
    this.valuation,
    this.headquarters,
    this.links,
    this.summary,
  });

  factory CompanyInfoDto.fromJson(Map<String, dynamic> json) {
    return CompanyInfoDto(
      id: json['id'],
      name: json['name'],
      founder: json['founder'],
      founded: json['founded'],
      employees: json['employees'],
      vehicles: json['vehicles'],
      launchSites: json['launch_sites'],
      testSites: json['test_sites'],
      ceo: json['ceo'],
      cto: json['cto'],
      coo: json['coo'],
      ctoPropulsion: json['cto_propulsion'],
      valuation: json['valuation'],
      headquarters: json['headquarters'] != null
          ? Headquarters.fromJson(json['headquarters'])
          : null,
      links: json['links'] != null
          ? CompanyLinks.fromJson(json['links'])
          : null,
      summary: json['summary'],
    );
  }

  // Backward compatibility getter
  int? get foundedYear => founded;
}

class Headquarters {
  final String? address;
  final String? city;
  final String? state;

  Headquarters({this.address, this.city, this.state});

  factory Headquarters.fromJson(Map<String, dynamic> json) {
    return Headquarters(
      address: json['address'],
      city: json['city'],
      state: json['state'],
    );
  }
}

class CompanyLinks {
  final String? website;
  final String? flickr;
  final String? twitter;
  final String? elonTwitter;

  CompanyLinks({
    this.website,
    this.flickr,
    this.twitter,
    this.elonTwitter,
  });

  factory CompanyLinks.fromJson(Map<String, dynamic> json) {
    return CompanyLinks(
      website: json['website'],
      flickr: json['flickr'],
      twitter: json['twitter'],
      elonTwitter: json['elon_twitter'],
    );
  }
}
