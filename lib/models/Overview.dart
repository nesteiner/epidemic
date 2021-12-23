class Overview {
  late int currentConfirmedCount;
  late int confirmedCount;
  late int suspectedCount;
  late int curedCount;
  late int deadCount;
  late int seriousCount;

  late int? suspectedIncr;
  late int? currentConfirmedIncr;
  late int? confirmedIncr;
  late int? curedIncr;
  late int? deadIncr;
  late int? seriousIncr;


  Overview(
      this.currentConfirmedCount,
      this.confirmedCount,
      this.suspectedCount,
      this.curedCount,
      this.deadCount,
      this.seriousCount,
      this.suspectedIncr,
      this.currentConfirmedIncr,
      this.confirmedIncr,
      this.curedIncr,
      this.deadIncr,
      this.seriousIncr);

  static Overview fromJSON(Map<String, dynamic> json) {
    return Overview(
        json['currentConfirmedCount']!,
        json['confirmedCount']!,
        json['suspectedCount']!,
        json['curedCount']!,
        json['deadCount']!,
        json['seriousCount']!,
        json['suspectedIncr'],
        json['currentConfirmedIncr'],
        json['confirmedIncr'],
        json['curedIncr'],
        json['deadIncr'],
        json['seriousIncr']
    );
  }
}