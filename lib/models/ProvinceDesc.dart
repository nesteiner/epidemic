import 'package:epidemic/models/CityDesc.dart';

class ProvinceDesc {
  late String name;
  late int totalCured;
  late int totalDeath;
  late int totalConfirmed;

  late List<CityDesc> citydesclist;


  ProvinceDesc(this.name, this.totalCured, this.totalDeath, this.totalConfirmed,
      this.citydesclist);

    static ProvinceDesc fromJSON(dynamic json) {
      // this json is part of `provinceArray`
      var cityArray = json["cityArray"];
      List<CityDesc> list = cityArray
          .map<CityDesc>((city) => CityDesc(city["totalCured"], city["totalDeath"], city["childStatistic"], city["totalConfirmed"]))
          .toList();

      return ProvinceDesc(json["childStatistic"], json["totalCured"], json["totalDeath"], json["totalConfirmed"], list);
    }
}