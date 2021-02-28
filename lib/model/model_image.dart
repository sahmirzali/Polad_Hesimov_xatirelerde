// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Images> imagesFromJson(String str) => List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));

String imagesToJson(List<Images> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Images {
    Images({
        this.image,
        this.soz,
    });

    String image;
    String soz;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        image: json["image"] == null ? null : json["image"],
        soz: json["soz"] == null ? null : json["soz"],
    );

    Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "soz": soz == null ? null : soz,
    };
}

/*
 Widget build(BuildContext context) {
   SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
    ]);
    */