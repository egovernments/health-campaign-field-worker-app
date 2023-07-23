// Importing necessary packages and files
import 'dart:async'; // For working with asynchronous operations
import 'dart:convert'; // For working with JSON encoding and decoding

import 'package:digit_components/digit_components.dart'; // Importing components from Digit Components library
import 'package:dio/dio.dart'; // Importing the Dio package for making HTTP requests

import '../../models/request_info/request_info_model.dart'; // Importing the RequestInfoModel for request information
import '../../utils/constants.dart'; // Importing constants used in the application
import '../local_store/secure_store/secure_store.dart'; // Importing the LocalSecureStore for managing secure local storage

// AuthTokenInterceptor for adding the authorization token to requests
class AuthTokenInterceptor extends Interceptor {
  final LocalSecureStore localSecureStore; // Local secure storage for storing the access token

  // Constructor for AuthTokenInterceptor
  AuthTokenInterceptor({
    LocalSecureStore? localSecureStore,
  }) : localSecureStore = localSecureStore ?? LocalSecureStore.instance;

  // This method is called before a request is sent
  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authToken = await localSecureStore.accessToken; // Get the access token from local secure storage

    // Check if the request data is a Map (JSON object)
    if (options.data is Map) {
      // Add the "RequestInfo" JSON object to the request data
      options.data = {
        ...options.data, // Spread the existing data
        "RequestInfo": RequestInfoModel(
          apiId: RequestInfoData.apiId, // API ID from constants
          ver: RequestInfoData.ver, // API version from constants
          ts: RequestInfoData.ts, // Timestamp from constants
          action: options.path.split('/').last, // Extracting the action from the endpoint path
          did: RequestInfoData.did, // Device ID from constants
          key: "1", // Key information
          authToken: authToken, // Authorization token obtained from local secure storage
        ).toJson(),
      };
    }

    super.onRequest(options, handler); // Continue with the request after modifying the data
  }
}

// ApiLoggerInterceptor for logging request and response data
class ApiLoggerInterceptor extends Interceptor {
  // This method is called before a request is sent
  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Check if the request data is a Map or List (JSON object or array)
    if (options.data is Map || options.data is List) {
      // Log the formatted JSON representation of the request data
      AppLogger.instance.info(
        _getIndentedJson(json.encode(options.data)), // Get the formatted JSON
        title: '[REQUEST] ${options.uri.toString()}', // Log the request URL as the title
      );
    }

    super.onRequest(options, handler); // Continue with the request after logging
  }

  // This method is called after receiving a response
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler); // Continue with the response handling

    // Check if the response path contains 'boundarys'
    // If it does, return early without logging the response data
    if (response.requestOptions.path.contains('boundarys')) return;

    try {
      // Log the formatted JSON representation of the response data
      AppLogger.instance.info(
        _getIndentedJson(json.encode(response.data)), // Get the formatted JSON
        title:
            '[RESPONSE - ${response.statusCode}] ${response.requestOptions.uri.toString()}', // Log the response status code and URL as the title
      );
    } catch (error) {
      // Log the response data type and status code in case of an error while logging
      AppLogger.instance.info(
        // ignore: avoid_dynamic_calls
        '${response.data.runtimeType} ${response.statusCode.toString()}',
        title: '[RESPONSE (error)] ${response.requestOptions.path}', // Log the response URL as the title
      );
    }
  }

  // Method to get the formatted JSON with indentation
  String _getIndentedJson(String json) {
    return const JsonEncoder.withIndent('  ').convert(jsonDecode(json));
  }
}
