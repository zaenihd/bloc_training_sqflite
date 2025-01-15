import 'package:bloc_training/models/note.dart';
import 'package:bloc_training/views/sqflite_note/data/db/db_manager.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  RxList allNote = <Note>[].obs;

  DatabaseManagerZen database = DatabaseManagerZen.instance;
  RxBool isEdit = false.obs;

  Future<void> getAllNote() async {
    Database db = await database.db;
    List<Map<String, dynamic>> data = await db.query("zezen");

    if (data.isNotEmpty) {
      data.forEach(
        (element) {
          allNote(Note.toJsonList(data));
          allNote.refresh();
        },
      );
    } else {
      allNote.clear();
      allNote.refresh();
    }
  }

  Future deleteNote(int id) async {
    Database db = await database.db;
   await db.delete("zezen", where: "id = ?", whereArgs: [id]);
   getAllNote();
  }

  @override
  void onInit() {
    getAllNote();
    // TODO: implement onInit
    super.onInit();
  }
}
