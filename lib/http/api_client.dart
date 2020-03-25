import 'dart:convert';

import 'package:covidlive/http/models/country.dart';
import 'package:covidlive/http/models/response_api.dart';
import 'package:http/http.dart';

Future<List<Country>> findAllCountries() async {
  final response = await get('https://lab.isaaclin.cn/nCoV/api/area?lang=eng');
  final result = jsonDecode(response.body);

  List<Country> countries = List();
  for (Map<dynamic, dynamic> country in result['results']) {
    countries.add(Country.fromJson(country));
  }

  return countries;
}
