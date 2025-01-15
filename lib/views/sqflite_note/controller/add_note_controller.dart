import 'dart:math';

import 'package:bloc_training/views/sqflite_note/data/db/db_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class AddNoteController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  DatabaseManagerZen databse = DatabaseManagerZen.instance;

  void addNote() async {
    if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
      isLoading(true);

      Database db = await databse.db;
      // final db = await databse.initDb();

      await db.insert(
          "zezen",
          {
            "id": Random().nextInt(1000),
            "title": titleController.text,
            "desc": descController.text,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
      isLoading(false);
    }
  }

  void editNote(int id) async {
    Database db = await databse.db;
    await db.update("zezen",
        {"id": id, "title": titleController.text, "desc": descController.text},
        where: "id = ?", whereArgs: [id]);
  }
}
