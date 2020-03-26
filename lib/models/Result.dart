import 'package:covid19live/models/Country.dart';

class Result {
  final String timestamp;
  final List<Country> countries;

  Result({this.timestamp, this.countries});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(timestamp: json['timestamp'], countries: json['countries']);
  }
}
