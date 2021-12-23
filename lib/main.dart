import 'package:dio/dio.dart';
import 'package:epidemic/models/AbroadDesc.dart';
import 'package:epidemic/models/ProvinceDesc.dart';
import 'package:epidemic/pages/Abroadwide.dart';
import 'package:epidemic/pages/Nationwide.dart';
import 'package:epidemic/pages/NewsFull.dart';
import 'package:epidemic/pages/NewsShortcut.dart';
import 'package:flutter/material.dart';

import 'models/LocalDesc.dart';
import 'models/News.dart';

void main() async {
  runApp(MaterialApp(
    title: 'Demo',
    home: DefaultTabController(
      length: 2,
      child: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("疫情实时动态"),
        bottom: TabBar(
          tabs: [
            Tab(text: "国内疫情",),
            Tab(text: "国外疫情")
          ],
        ),
      ),
      body: TabBarView(
        children: [
          NationwidePage(),
          AbroadwidePage(),
        ],
      ),
    );
  }
}

