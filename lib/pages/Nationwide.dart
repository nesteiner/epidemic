import 'package:dio/dio.dart';
import 'package:epidemic/models/LocalDesc.dart';
import 'package:epidemic/models/Overview.dart';
import 'package:epidemic/models/ProvinceDesc.dart';
import 'package:epidemic/models/RiskArea.dart';
import 'package:epidemic/pages/NewsFull.dart';
import 'package:epidemic/pages/NewsShortcut.dart';
import 'package:epidemic/widgets/ProvinceDescTable.dart';
import 'package:epidemic/widgets/OverviewCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NationwidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          buildFutureLocalDesc(context),
          buildFutureProvinceDesc(context)
        ],
      ),
    );
  }

  Widget buildFutureLocalDesc(BuildContext context) {
    final padding = EdgeInsets.only(left: 10, top: 10);
    final title1 = Container(
      padding: padding,
      child: Text("国内疫情数据", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.blue),),
    );

    final title2 = Container(
      padding: padding,
      child: Text("疫情热点", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.red),),
    );


    return FutureBuilder(
        future: fetchLocalDesc(),
        builder: (context, AsyncSnapshot snapshot) {
          List<Widget> firstchildren = [];
          List<Widget> secondchildren = [];

          if(snapshot.hasData && snapshot.data != null) {
            LocalDesc localDesc = snapshot.data;
            firstchildren = [title1, OverviewCard(localDesc.overview)];
            secondchildren = [title2, NewsShortcutPage(localDesc.newslist)];
          } else {
            firstchildren = [title1, CircularProgressIndicator()];
            secondchildren = [title2, CircularProgressIndicator()];
          }

          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: firstchildren,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: secondchildren,
              )
            ],
          );
        }
    );
  }

  Widget buildFutureProvinceDesc(BuildContext context) {
    final title = Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Text("各地疫情数据", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.grey),),
    );

    return FutureBuilder(
      future: fetchProvinceDesc(),
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.hasData && snapshot.data != null) {
          List<ProvinceDesc> provinceDescList = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              ProvinceDescTable(provinceDescList)
            ],
          );

        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              CircularProgressIndicator()
            ],
          );

        }
      },
    );
  }
  // 国内疫情情况与各省疫情
  // use local desc
  // 1. overview
  // 2. newslist
  // 3. riskarea

  // use List<province desc>

  Future<LocalDesc> fetchLocalDesc() async {
    Dio dio = Dio();
    Response response = await dio.get(
        "http://api.tianapi.com/ncov/index",
        queryParameters: {"key": "822216440f57b9d9cbac5dfcdb856449"});

    LocalDesc localDesc = LocalDesc.fromJSON(response.data);
    return localDesc;
  }

  Future<List<ProvinceDesc>> fetchProvinceDesc() async {
    Dio dio = Dio();
    const url = "http://ncovdata.market.alicloudapi.com/ncov/cityDiseaseInfoWithTrend";
    dio.options.headers["Authorization"] = "APPCODE 66ae9e35defd4088994a8f35372001e6";

    Response response = await dio.get(url);
    return response.data["provinceArray"].map<ProvinceDesc>(ProvinceDesc.fromJSON).toList();
  }


}