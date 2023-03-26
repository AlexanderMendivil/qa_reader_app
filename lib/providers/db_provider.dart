import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{

  static Database? _database;

  static final DBProvider db = DBProvider._();
  DBProvider._();

  get database async {
    if(_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'scansDB.db');

    print(path);

    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
       await  db.execute('''CREATE TABLE Scans(
        id INTEGER PRIMARY KEY,
        tipo TEXT,
        valor TEXT
       ) ''');
    });
  }
}