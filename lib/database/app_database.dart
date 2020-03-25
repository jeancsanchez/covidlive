import 'package:covidlive/http/models/country.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'covid.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE models ('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'deaths INTEGER)');
  }, version: 1);
}

Future<int> save(Model model) async {
  final db = await createDatabase();
  final Map<String, dynamic> modelsMap = Map();
  modelsMap['name'] = 'testando';
  modelsMap['deaths'] = 3;
  return db.insert('models', modelsMap);
}

Future<List<Model>> findAll() async {
  final db = await createDatabase();
  final maps = await db.query('models');
  final List<Model> models = List();
  for (Map<String, dynamic> map in maps) {
    final Model model = Model(pais: map['pais']);
    models.add(model);
  }
  return models;
}
