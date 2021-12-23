import 'package:epidemic/models/Overview.dart';
import 'package:epidemic/models/RiskArea.dart';
import 'dart:convert';
import 'News.dart';

class LocalDesc {
  late List<News> newslist;
  late Overview overview;
  late RiskArea riskArea;

  LocalDesc(this.newslist, this.overview, this.riskArea);

  static LocalDesc fromJSON(dynamic responseJSON) {
    // ATTENTION exception here, may the type error
    Map<String, dynamic> json = responseJSON['newslist'][0];
    //  create newslist from this list
    List<News> newslist = json['news'].map<News>((e) => News.fromJSON(e)).toList();
    Overview overview = Overview.fromJSON(json['desc']);
    RiskArea riskArea = RiskArea.fromJSON(json['riskarea']);

    return LocalDesc(newslist, overview, riskArea);
  }
}