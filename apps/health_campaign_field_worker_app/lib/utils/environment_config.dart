import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

EnvironmentConfiguration envConfig = EnvironmentConfiguration.instance;

class EnvironmentConfiguration {
  static final EnvironmentConfiguration _instance =
      EnvironmentConfiguration._internal();

  static EnvironmentConfiguration get instance => _instance;

  EnvironmentConfiguration._internal();

  bool _initialized = false;

  late DotEnv _dotEnv;
  late Variables _variables;

  FutureOr<void> initialize() async {
    _dotEnv = DotEnv();
    try {
      await _dotEnv.load();
      _variables = Variables(dotEnv: _dotEnv);
    } catch (error) {
      debugPrint(
        '\n.ENV: Error while accessing .env file. Using fallback values\n',
      );
      _variables = Variables(useFallbackValues: true, dotEnv: _dotEnv);
    } finally {
      _initialized = true;
    }
  }

  Variables get variables {
    if (!_initialized) {
      throw Exception('EnvironmentConfiguration has not been initialized');
    }

    return _variables;
  }
}

class Variables {
  final DotEnv _dotEnv;
  final bool useFallbackValues;

  static const _connectTimeoutValue = 6000;
  static const _receiveTimeoutValue = 6000;
  static const _sendTimeoutValue = 6000;

  static const _connectTimeout = EnvEntry(
    'CONNECT_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _receiveTimeout = EnvEntry(
    'RECEIVE_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _sendTimeout = EnvEntry(
    'SEND_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _baseUrl = EnvEntry(
    'BASE_URL',
    'https://health-dev.digit.org/',
  );

  static const _mdmsApi = EnvEntry(
    'MDMS_API_PATH',
    'egov-mdms-service/v1/_search',
  );

  static const _tenantId = EnvEntry(
    'TENANT_ID',
    'default',
  );

  const Variables({
    this.useFallbackValues = false,
    required DotEnv dotEnv,
  }) : _dotEnv = dotEnv;

  String get baseUrl => useFallbackValues
      ? _baseUrl.value
      : _dotEnv.get(_baseUrl.key, fallback: _baseUrl.value);

  String get mdmsApiPath => useFallbackValues
      ? _mdmsApi.value
      : _dotEnv.get(_mdmsApi.key, fallback: _mdmsApi.value);

  String get tenantId => useFallbackValues
      ? _tenantId.value
      : _dotEnv.get(_tenantId.key, fallback: _tenantId.value);

  int get connectTimeout => useFallbackValues
      ? int.tryParse(_connectTimeout.value) ?? _connectTimeoutValue
      : int.tryParse(_dotEnv.get(
            _connectTimeout.key,
            fallback: _connectTimeout.value,
          )) ??
          _connectTimeoutValue;

  int get receiveTimeout => useFallbackValues
      ? int.tryParse(_receiveTimeout.value) ?? _receiveTimeoutValue
      : int.tryParse(_dotEnv.get(
            _receiveTimeout.key,
            fallback: _receiveTimeout.value,
          )) ??
          _receiveTimeoutValue;

  int get sendTimeout => useFallbackValues
      ? int.tryParse(_sendTimeout.value) ?? _sendTimeoutValue
      : int.tryParse(_dotEnv.get(
            _sendTimeout.key,
            fallback: _sendTimeout.value,
          )) ??
          _sendTimeoutValue;
}

class EnvEntry {
  final String key;
  final String value;

  const EnvEntry(this.key, this.value);
}
