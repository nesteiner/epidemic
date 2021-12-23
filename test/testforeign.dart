import 'package:dio/dio.dart';
import 'package:epidemic/models/AbroadDesc.dart';

void main() async {
  Dio dio = Dio();
  Response response = await dio.get(
      "http://api.tianapi.com/ncovabroad/index",
      queryParameters: {"key": "822216440f57b9d9cbac5dfcdb856449"}
  );

  AbroadDesc abroadDesc = AbroadDesc.fromJSON(response.data);
}