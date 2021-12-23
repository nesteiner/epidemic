import 'package:epidemic/models/AbroadNews.dart';

class AbroadDesc {
  late List<AbroadNews> newslist;

  AbroadDesc(this.newslist);

  static AbroadDesc fromJSON(dynamic json) {
    var newslist = json["newslist"].map<AbroadNews>((e) => AbroadNews.fromJSON(e)).toList();
    return AbroadDesc(
      newslist
    );
  }
}