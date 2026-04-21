// Importing necessary packages and files
import 'dart:io';

import "package:dio/dio.dart"; // Dio package for HTTP requests
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../app_security.dart';
import '../utils/environment_config.dart'; // Custom utility file for environment configurations
import 'repositories/api_interceptors.dart'; // Custom API interceptors for Dio

// The DioClient class for managing the Dio instance
class DioClient {
  late Dio _dio; // Private instance of Dio

  // Singleton instance of DioClient
  static final DioClient _instance = DioClient._internal();

  // Factory constructor for DioClient
  factory DioClient() {
    return _instance;
  }

  // Private constructor of DioClient
  DioClient._internal() {
    _init(); // Initialize the Dio client during construction
  }

  // Getter method to access the Dio instance
  Dio get dio => _dio;

  // Initialization method for the Dio client
  void _init() {
    _dio = Dio()
      ..interceptors.addAll([
        AuthTokenInterceptor(),
        // Custom interceptor for handling authentication tokens
        ApiLoggerInterceptor(),
        // Custom interceptor for logging API requests and responses
      ])
      ..options = BaseOptions(
        connectTimeout: Duration(
          milliseconds: envConfig.variables.connectTimeout,
        ),
        sendTimeout: Duration(milliseconds: envConfig.variables.sendTimeout),
        receiveTimeout: Duration(
          milliseconds: envConfig.variables.receiveTimeout,
        ),
        baseUrl: envConfig.variables
            .baseUrl, // Base URL for API endpoints from the environment configuration
      );
  }

  // Enable SSL certificate pinning
  Future<void> enableSSLPinning() async {
    if (AppSecurity.instance.securityLevel.index >=
        AppSecurityLevel.medium.index) {
      // Load the certificate from assets
      final certData = await rootBundle.load(
        'assets/certificates/tls_cert.crt',
      );

      // Create SecurityContext with pinned certificate
      final securityContext = SecurityContext(withTrustedRoots: false);
      securityContext.setTrustedCertificatesBytes(
        certData.buffer.asUint8List(),
      );

      // Create HttpClient with the custom SecurityContext
      final httpClient = HttpClient(context: securityContext)
        ..badCertificateCallback = (cert, host, port) {
          debugPrint('Bad certificate for $host');
          return false;
        };

      // Configure Dio to use the custom HttpClient
      (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        return httpClient;
      };

      debugPrint('SSL Certificate Pinning enabled');
    } else {
      debugPrint(
          'SSL Certificate Pinning not enabled due to low security level');
      return;
    }
  }

  // Disable SSL certificate pinning (use default system certificates)
  void disableSSLPinning() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      return HttpClient();
    };
    debugPrint('SSL Certificate Pinning disabled');
  }
}
