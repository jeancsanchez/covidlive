class Country {
  final int locationId;
  final String continentEnglishName;
  final String countryEnglishName;
  final String provinceEnglishName;
  final int currentConfirmedCount;
  final int confirmedCount;
  final int suspectedCount;
  final int curedCount;
  final int deadCount;
  final int updateTime;

  Country(
      {this.locationId,
      this.continentEnglishName,
      this.countryEnglishName,
      this.provinceEnglishName,
      this.currentConfirmedCount,
      this.confirmedCount,
      this.suspectedCount,
      this.curedCount,
      this.deadCount,
      this.updateTime});

  factory Country.fromJson(Map<dynamic, dynamic> json) {
    return Country(
      locationId: json['locationId'],
      continentEnglishName: json['continentEnglishName'],
      countryEnglishName: json['countryEnglishName'],
      provinceEnglishName: json['provinceEnglishName'],
      currentConfirmedCount: json['currentConfirmedCount'],
      confirmedCount: json['confirmedCount'],
      suspectedCount: json['suspectedCount'],
      curedCount: json['curedCount'],
      deadCount: json['deadCount'],
      updateTime: json['updateTime'],
    );
  }
}
