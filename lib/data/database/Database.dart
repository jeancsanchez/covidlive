import 'package:covidlive/data/database/DBContract.dart';
import 'package:covidlive/models/Country.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'covid.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE $DB_TABLE ('
        '$DB_COLUMN_ID INTEGER PRIMARY KEY, '
        '$DB_COLUMN_reports INTEGER, '
        '$DB_COLUMN_recovered INTEGER, '
        '$DB_COLUMN_flag TEXT, '
        '$DB_COLUMN_cases INTEGER,'
        '$DB_COLUMN_lng INTEGER, '
        '$DB_COLUMN_name TEXT, '
        '$DB_COLUMN_deaths INTEGER, '
        '$DB_COLUMN_lat INTEGER, '
        '$DB_COLUMN_deltaCases INTEGER, '
        '$DB_COLUMN_deltaDeaths INTEGER'
        ')');
  }, version: 1);
}

Future<int> saveAll(List<Country> countries) async {
  final db = await createDatabase();
  final Map<String, dynamic> countriesMap = Map();

  for (Country country in countries) {
    countriesMap.addAll(Country.toJson(country));
  }

  return db.insert(DB_TABLE, countriesMap);
}

Future<List<Country>> queryAll() async {
  final db = await createDatabase();
  final maps = await db.query(DB_TABLE);
  final List<Country> countries = List();

  for (Map<dynamic, dynamic> map in maps) {
    countries.add(Country.fromJson(map));
  }

  return countries;
}
