class CompanyInfoDto {
  final String? name;
  final String? founder;
  final int? foundedYear;
  final int? employees;
  final int? vehicles;
  final int? launchSites;
  final int? testSites;
  final String? ceo;
  final String? cto;
  final String? coo;
  final String? ctoPropulsion;
  final int? valuation;
  final Headquarters? headquarters;
  final String? summary;

  CompanyInfoDto(
      {this.name,
      this.founder,
      this.foundedYear,
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
      this.summary});

  factory CompanyInfoDto.fromJson(Map<String, dynamic> json) {
    return CompanyInfoDto(
      name: json['name'],
      founder: json['founder'],
      foundedYear: json['founded'],
      employees: json['employees'],
      vehicles: json['vehicles'],
      launchSites: json['launch_sites'],
      testSites: json['test_sites'],
      ceo: json['ceo'],
      cto: json['cto'],
      coo: json['coo'],
      ctoPropulsion: json['cto_propulsion'],
      valuation: json['valuation'],
      headquarters: Headquarters.fromJson(json['headquarters']),
      summary: json['summary']
    );
  }
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
