import 'dart:convert';

import 'package:general_polad/model/model.dart';
import 'package:flutter/services.dart';
import 'package:general_polad/model/model_image.dart';

class ServiceData {
  var infocomment = 'data/ali.json';
  var infoimage = 'data/image.json';

  Future<List<Comment>> loadInfo() async {
    var response = await rootBundle.loadString(infocomment);
    Iterable data = json.decode(response);

    return data.map((model) => Comment.fromJson(model)).toList();
  }

  Future<List<Images>> loadImage() async {
    var response = await rootBundle.loadString(infoimage);
    Iterable data = json.decode(response);

    return data.map((model) => Images.fromJson(model)).toList();
  }
}
