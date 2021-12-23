import 'package:epidemic/models/News.dart';
import 'package:epidemic/widgets/NewsCard.dart';
import 'package:flutter/material.dart';

class NewsShortcutPage extends StatelessWidget {
  late List<News> newslist;
  NewsShortcutPage(this.newslist);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // build news card from newslist
    return Column(
      children: newslist.map((news) => NewsCard(news)).toList(),
    );
  }

}