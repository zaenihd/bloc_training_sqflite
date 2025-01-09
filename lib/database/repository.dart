import 'dart:developer';

import 'package:bloc_training/database/connection.dart';
import 'package:bloc_training/database/tables.dart';
import 'package:bloc_training/models/user.dart';

class Repository {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  //LOGIN
  Future<bool> authenticate(Users user) async {
    final db = await databaseHelper.initDB();
    final authenticated = await db.query(Tables.userTableName,
        where: 'username = ? AND password = ?',
        whereArgs: [user.username, user.password]);
    if (authenticated.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //SIGN UP
  Future<int> registerUser(Users user) async {
    final db = await databaseHelper.initDB();
    //First check whether user has already exist or not then create it.
    final isDuplicate = await db.query(Tables.userTableName,
        where: 'username = ?', whereArgs: [user.username]);
    if (isDuplicate.isNotEmpty) {
      return 0;
    } else {
      //if not create the user
      return await db.insert(Tables.userTableName, user.toJson());
    }
  }

  Future<Users> getLoggedInUser(String username) async {
    final db = await databaseHelper.initDB();
    final res = await db.query(Tables.userTableName,
        where: 'username = ?', whereArgs: [username]);
    if (res.isNotEmpty) {
      log(res.first.toString());
      return Users.fromJson(res.first);
    } else {
      throw Exception("User $username not found");
    }
  }
}
