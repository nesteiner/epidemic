class AbroadNews {
  late String continents;
  late String provinceName;
  late int currentConfirmedCount;
  late int confirmedCount;
  late int curedCount;
  late int deadCount;


  AbroadNews(this.continents, this.provinceName, this.currentConfirmedCount,
      this.confirmedCount, this.curedCount, this.deadCount);

  static AbroadNews fromJSON(dynamic json) {
    return AbroadNews(
        json['continents'],
        json['provinceName'],
        json['currentConfirmedCount'],
        json['confirmedCount'],
        json['curedCount'],
        json['deadCount']
    );
  }
}