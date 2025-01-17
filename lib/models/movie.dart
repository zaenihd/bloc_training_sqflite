// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
    final List<ListMovie> listMovie;
    final String totalResults;
    final String response;

    Movie({
        required this.listMovie,
        required this.totalResults,
        required this.response,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        listMovie: List<ListMovie>.from(json["Search"].map((x) => ListMovie.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
    );

    Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(listMovie.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
    };
}

class ListMovie {
    final String title;
    final String year;
    final String imdbId;
    final Type type;
    final String poster;

    ListMovie({
        required this.title,
        required this.year,
        required this.imdbId,
        required this.type,
        required this.poster,
    });

    factory ListMovie.fromJson(Map<String, dynamic> json) => ListMovie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map[json["Type"]]!,
        poster: json["Poster"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse[type],
        "Poster": poster,
    };
}

enum Type {
    GAME,
    MOVIE,
    SERIES
}

final typeValues = EnumValues({
    "game": Type.GAME,
    "movie": Type.MOVIE,
    "series": Type.SERIES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
