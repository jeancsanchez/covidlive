import 'dart:convert';

import 'package:covid19live/models/Country.dart';
import 'package:http/http.dart';

Future<List<Country>> getAll() async {
  final response = await get('https://www.covidvisualizer.com/api');
  final data = jsonDecode(response.body);

  List<Country> countries = List();
  for (String key in data['countries'].keys) {
    countries.add(Country.fromJson(data['countries'][key]));
  }

  return countries;
}
