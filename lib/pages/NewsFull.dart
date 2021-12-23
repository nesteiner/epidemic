import 'package:epidemic/models/News.dart';
import 'package:flutter/material.dart';

class NewsFullPage extends StatelessWidget {
  late News news;
  NewsFullPage(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: buildBody(context),
    );
  }


  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: buildColumn(context),
      )
    );
  }
  Widget buildColumn(BuildContext context) {

    final headTitle = Text.rich(
      TextSpan(
          children: [
            TextSpan(text: news.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            TextSpan(text: "\n"),
            TextSpan(text: news.pubDateStr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey)),
            TextSpan(text: " "),
            TextSpan(text: news.infoSource, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey))
          ]
      ),

      textAlign: TextAlign.left,
      // TextS
    );

    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headTitle,
        SizedBox(height: 10,),
        Text(news.summary, style: TextStyle(fontSize: 18),),
      ],
    );
  }
}