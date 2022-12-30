import "package:dio/dio.dart";
import '../utils/constants.dart';
import 'repositories/api_interceptors.dart';

class Client {
  Dio init() {
    final Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = Constants.baseURL;

    return dio;
  }
}
