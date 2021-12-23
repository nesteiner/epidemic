import 'package:epidemic/models/News.dart';
import 'package:epidemic/pages/NewsFull.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  late News news;
  NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildButton(context);
  }

  Widget buildRow(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(news.title),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsFullPage(news)
            ),
        );
      },
      child: buildRow(context),
    );
  }

}