import 'dart:convert';

import 'package:general_polad/model/model.dart';
import 'package:flutter/services.dart';

 class ServiceData {
  var infocomment = 'data/ali.json';

  Future<List<Comment>> loadInfo() async {
    var response = await rootBundle.loadString(infocomment);
    Iterable data = json.decode(response);

    return data.map((model) => Comment.fromJson(model)).toList();
  }
}

