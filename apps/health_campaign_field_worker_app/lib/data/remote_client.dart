import "package:dio/dio.dart";
import 'repositories/api_interceptors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Client {
  Dio init() {
    final Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = dotenv.env['BASE_URL'].toString();

    return dio;
  }
}
