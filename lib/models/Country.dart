class Country {
  final int reports;
  final int recovered;
  final String flag;
  final int cases;
  final int lng;
  final String name;
  final int deaths;
  final int lat;
  final int deltaCases;
  final int deltaDeaths;

  Country(
      {this.reports,
      this.recovered,
      this.flag,
      this.cases,
      this.lng,
      this.name,
      this.deaths,
      this.lat,
      this.deltaCases,
      this.deltaDeaths});

  factory Country.fromJson(Map<dynamic, dynamic> json) {
    return Country(
        reports: json['reports'],
        recovered: json['recovered'],
        flag: json['flag'],
        cases: json['cases'],
        lng: json['lng'],
        name: json['name'],
        deaths: json['deaths'],
        lat: json['lat'],
        deltaCases: json['deltaCases'],
        deltaDeaths: json['deltaDeaths']);
  }

  static Map<String, dynamic> toJson(Country country) {
    final json = Map<String, dynamic>();
    json['reports'] = country.reports;
    json['recovered'] = country.recovered;
    json['flag'] = country.flag;
    json['cases'] = country.cases;
    json['lng'] = country.lng;
    json['name'] = country.name;
    json['deaths'] = country.deaths;
    json['lat'] = country.lat;
    json['deltaCases'] = country.deltaCases;
    json['deltaDeaths'] = country.deltaDeaths;
    return json;
  }
}
