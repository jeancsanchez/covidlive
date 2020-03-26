import 'package:covidlive/data/database/Database.dart';
import 'package:covidlive/data/http/ApiClient.dart';

import '../models/Country.dart';

class Repository {
  Future<List<Country>> findAll() async {
    try {
      final results = await getAll();

      if (results.length > 0) {
        saveAll(results);
      }

      return Future.value(results);
    } on Exception catch (e) {
      return queryAll();
    }
  }
}
