import 'package:dio/dio.dart';
import 'package:epidemic/models/ProvinceDesc.dart';

void main() async {
  Dio dio = Dio();
  const url = "http://ncovdata.market.alicloudapi.com/ncov/cityDiseaseInfoWithTrend";
  dio.options.headers["Authorization"] = "APPCODE 66ae9e35defd4088994a8f35372001e6";

  Response response = await dio.get(url);
  var list = response.data["provinceArray"].map(ProvinceDesc.fromJSON).toList();
  print(list.length);
}