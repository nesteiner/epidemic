import 'package:dio/dio.dart';
import 'package:epidemic/models/AbroadDesc.dart';
import 'package:epidemic/widgets/AbroadDescTable.dart';
import 'package:flutter/material.dart';

class AbroadwidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: fetchAbroadDesc(),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData && snapshot.data != null) {
            AbroadDesc abroadDesc = snapshot.data;
            return AbroadDescTable(abroadDesc);
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }

  Future<AbroadDesc> fetchAbroadDesc() async {
    Dio dio = Dio();
    Response response = await dio.get(
        "http://api.tianapi.com/ncovabroad/index",
        queryParameters: {"key": "822216440f57b9d9cbac5dfcdb856449"}
    );

    AbroadDesc abroadDesc = AbroadDesc.fromJSON(response.data);
    return abroadDesc;
  }
}