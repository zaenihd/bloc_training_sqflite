import 'package:bloc_training/models/note.dart';
import 'package:bloc_training/views/sqflite_note/controller/home_controller.dart';
import 'package:bloc_training/views/sqflite_note/views/add_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewSqflite extends StatelessWidget {
  HomeViewSqflite({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DATA NOTE'),
        actions: [
          IconButton(
              onPressed: () {
                controller.isEdit.value = false;
                Get.to(() => AddNoteSqflite());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.allNote.length,
            itemBuilder: (context, index) {
              if (controller.allNote.length == 0) {
                return Center(
                  child: Text("No DATA"),
                );
              } else {
                Note note = controller.allNote[index];
                return ListTile(
                  onTap: () {
                    controller.isEdit.value = true;
                    Get.to(() => AddNoteSqflite(), arguments: note);
                  },
                  trailing: InkWell(
                      onTap: () {
                        controller.deleteNote(note.id);
                      },
                      child: Icon(Icons.delete)),
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text('${note.title}'),
                  subtitle: Text("${note.desc}"),
                );
              }
            },
          )),
    );
  }
}
