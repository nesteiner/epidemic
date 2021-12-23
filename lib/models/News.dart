class News {
  late int id;
  late int pubDate;
  late String pubDateStr;
  late String title;
  late String summary;
  late String infoSource;
  late String sourceUrl;

  News(this.id, this.pubDate, this.pubDateStr, this.title, this.summary,
      this.infoSource, this.sourceUrl);

  static News fromJSON(Map<String, dynamic> json) {
    return News(
      json['id'],
      json['pubDate'],
      json['pubDateStr'],
      json['title'],
      json['summary'],
      json['infoSource'],
      json['sourceUrl']
    );
  }
}