// To parse this JSON data, do
//
//     final note = noteFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Note noteFromJson(String str) => Note.fromJson(json.decode(str));

String noteToJson(Note data) => json.encode(data.toJson());

class Note {
    final int id;
    final String title;
    final String desc;

    Note({
        required this.id,
        required this.title,
        required this.desc,
    });

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
    };

    static List<Note> toJsonList(List? data){
      if(data == null || data.isEmpty) return [];
      return data.map((e)=> Note.fromJson(e)).toList();
    }
}
