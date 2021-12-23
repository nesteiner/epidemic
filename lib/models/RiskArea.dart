class RiskArea {
  late List<String> highAreas;
  late List<String> midAreas;

  RiskArea(this.highAreas, this.midAreas);

  static RiskArea fromJSON(Map<String, dynamic> json) {
    var highAreas = json['high'];
    var midAreas = json['mid'];
    return RiskArea(highAreas.cast<String>(), midAreas.cast<String>());
  }
}