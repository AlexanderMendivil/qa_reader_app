import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:qa_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
export 'package:qa_reader/models/scan_model.dart';

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

    print('path: $path');

    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
       await  db.execute('''CREATE TABLE Scans(
        id INTEGER PRIMARY KEY,
        tipo TEXT,
        valor TEXT
       ) ''');
    });


    // ignore: dead_code
  }
    Future<int> nuevoScanRaw( ScanModel nuevoScan ) async {

      final id = nuevoScan.id;
      final tipo = nuevoScan.tipo;
      final valor = nuevoScan.valor;
      final db = await database;

      final res = await db.rawInsert('''INSERT INTO Scans(id, tipo, valor) VALUES($id, '$tipo', '$valor')''');

      return res;
    }

    Future<int> nuevoScan( ScanModel nuevoScan ) async {
      final db = await database;

      final res = await db.insert('Scans', nuevoScan.toJson());
      print(res);
      return res;
    }
}