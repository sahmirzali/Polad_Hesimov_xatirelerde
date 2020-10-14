// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
    Comment({
        this.ad,
        this.vezife,
        this.rey,
    });

    String ad;
    String vezife;
    String rey;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        ad: json["ad"] == null ? null : json["ad"],
        vezife: json["vezife"] == null ? null : json["vezife"],
        rey: json["rey"] == null ? null : json["rey"],
    );

    Map<String, dynamic> toJson() => {
        "ad": ad == null ? null : ad,
        "vezife": vezife == null ? null : vezife,
        "rey": rey == null ? null : rey,
    };
}
