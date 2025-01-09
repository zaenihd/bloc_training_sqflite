import 'package:bloc_training/database/tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  final databaseName = 'auth.db';
  //DATABASE CONNECTION
  Future<Database> initDB()async{
    final databasePath = await getApplicationCacheDirectory();
    final path = join(databasePath.path, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version)async {
      db.execute(Tables.userTable);
      
    },);
  }
}