import 'package:covidlive/http/models/country.dart';

class ResponseApi {
  final List<Country> results;
  final bool success;

  ResponseApi({this.results, this.success});

  factory ResponseApi.fromJson(Map<String, dynamic> json) {
    return ResponseApi(results: new List<Country>.from(json['results']), success: json['success']);
  }
}
