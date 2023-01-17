import "package:dio/dio.dart";
import '../utils/environment_config.dart';
import 'repositories/api_interceptors.dart';

class Client {
  Dio init() {
    final Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = envConfig.variables.baseUrl;

    return dio;
  }
}
