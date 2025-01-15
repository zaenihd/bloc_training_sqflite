import 'dart:developer';

import 'package:bloc_training/models/note.dart';
import 'package:bloc_training/views/sqflite_note/controller/add_note_controller.dart';
import 'package:bloc_training/views/sqflite_note/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteSqflite extends StatelessWidget {
  AddNoteSqflite({super.key});
  final controller = Get.put(AddNoteController());
  final controllerHome = Get.find<HomeController>();
  int id = 0;

  @override
  Widget build(BuildContext context) {
    if (controllerHome.isEdit.isTrue) {
      Note note = Get.arguments;
      controller.titleController.text = note.title;
      controller.descController.text = note.desc;
      id = note.id;
      log(note.toJson().toString());
    } else {
      controller.titleController.clear();
      controller.descController.clear();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD NOTE'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.titleController,
            decoration: const InputDecoration(
                labelText: "title", border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: controller.descController,
            decoration: const InputDecoration(
                labelText: "Desc", border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Obx(() => ElevatedButton(
              onPressed: () async {
                if (controller.isLoading.isFalse) {
                  if (controllerHome.isEdit.isFalse) {
                    controller.addNote();
                    await controllerHome.getAllNote();
                    Get.back();
                  } else {
                    controller.editNote(id);
                    await controllerHome.getAllNote();
                    Get.back();
                  }
                }
              },
              child: Text(controller.isLoading.isTrue
                  ? "LOADING"
                  : controllerHome.isEdit.isTrue
                      ? "EDIT NOTE"
                      : "ADD NOTE"))),
        ],
      ),
    );
  }
}
