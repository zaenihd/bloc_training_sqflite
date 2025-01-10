// To parse this JSON data, do
//
//     final usersList = usersListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UsersList usersListFromJson(String str) => UsersList.fromJson(json.decode(str));

String usersListToJson(UsersList data) => json.encode(data.toJson());

class UsersList {
    final int page;
    final int perPage;
    final int total;
    final int totalPages;
    final List<UserCok> data;
    final Support support;

    UsersList({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
        required this.support,
    });

    factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<UserCok>.from(json["data"].map((x) => UserCok.fromJson(x))),
        support: Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
    };
}

class UserCok {
    final int id;
    final String email;
    final String firstName;
    final String lastName;
    final String avatar;

    UserCok({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    factory UserCok.fromJson(Map<String, dynamic> json) => UserCok(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    final String url;
    final String text;

    Support({
        required this.url,
        required this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
