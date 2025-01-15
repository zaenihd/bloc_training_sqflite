import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManagerZen {
  DatabaseManagerZen._privateConst();
  static DatabaseManagerZen instance = DatabaseManagerZen._privateConst();

  Database? _dbNote;

  Future<Database> get db async {
    if (_dbNote == null) {
      _dbNote = await _initDb();
      log('ini db kejalan');
      return _dbNote!;
    } else {
      return _dbNote!;
    }
  }

  Future _initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "zen.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
      return await database.execute('''
        CREATE TABLE IF NOT EXISTS zezen (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        desc TEXT NOT NULL
        )
        ''');
      },
    );
  }

  Future closeDB() async {
    _dbNote = await instance.db;
    _dbNote!.close();
  }
}
