import 'dart:convert';

import 'package:covidlive/http/models/country.dart';
import 'package:covidlive/http/models/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

Future<List<Country>> findAllCountries() async {
//  final response = await get('https://lab.isaaclin.cn/nCoV/api/area?lang=eng');
  final response =
      await get('https://www.covidvisualizer.com/api');
  final data = jsonDecode(response.body);

  List<Country> countries = List();
  for (String key in data['countries'].keys) {
    countries.add(Country.fromJson(data['countries'][key]));
  }

//  final List<Country> countries = List();
//  countries.add(Country(
//      locationId: 1010,
//      continentEnglishName: 'Test',
//      countryEnglishName: 'test1',
//      provinceEnglishName: 'test',
//      currentConfirmedCount: 10,
//      curedCount: 10,
//      confirmedCount: 3,
//      suspectedCount: 3,
//      deadCount: 20,
//      updateTime: 1029291));

//  countries.retainWhere((country) => country.countryEnglishName != null);
//  countries.sort((a, b) => b.confirmedCount.compareTo(a.confirmedCount));
  return countries;
}
