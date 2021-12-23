import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:epidemic/models/LocalDesc.dart';
import 'package:epidemic/models/News.dart';
import 'package:epidemic/models/Overview.dart';
import 'package:epidemic/models/RiskArea.dart';

void main() async {
  Dio dio = Dio();
  Response response = await dio.get(
      "http://api.tianapi.com/ncov/index",
      queryParameters: {"key": "822216440f57b9d9cbac5dfcdb856449"});

  LocalDesc localDesc = LocalDesc.fromJSON(response.data);
  // Overview overview = Overview.fromJSON(json["desc"]);
  // print(localDesc);
}

