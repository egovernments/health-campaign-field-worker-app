import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../data/local_store/app_shared_preferences.dart';

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
      AppLogger.instance.error(
        title: runtimeType.toString(),
        message: 'Error while accessing .env file. Using fallback values',
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
  static const _retryTimeIntervalValue = 5;
  static const _syncDownRetryCountValue = 3;

  static const _envName = EnvEntry(
    'ENV_NAME',
    'DEV',
  );

  static const _connectTimeout = EnvEntry(
    'CONNECT_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _receiveTimeout = EnvEntry(
    'RECEIVE_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _dumpErrorApi = EnvEntry(
    'DUMP_ERROR_PATH',
    'error-handler/handle-error',
  );

  static const _syncDownRetryCount = EnvEntry(
    'SYNC_DOWN_RETRY_COUNT',
    '$_syncDownRetryCountValue',
  );

  static const _retryTimeInterval = EnvEntry(
    'RETRY_TIME_INTERVAL',
    '$_retryTimeIntervalValue',
  );
  static const _sendTimeout = EnvEntry(
    'SEND_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _baseUrl = EnvEntry(
    'BASE_URL',
    'https://health-dev.digit.org/',
  );

  static const _checkBandwidthApi = EnvEntry(
    'CHECK_BANDWIDTH_API',
    '/health-project/check/bandwidth',
  );

  static const _mdmsApi = EnvEntry(
    'MDMS_API_PATH', //override mdms path to 'egov-mdms-service/v1/_search' for unified-uat in .env
    'mdms-v2/v1/_search',
  );

  static const _mdmsBaseUrl = EnvEntry(
    'MDMS_BASE_URL',
    '', // Empty means use BASE_URL
  );

  static const _mdmsV2ApiPath = EnvEntry(
    'MDMS_V2_API_PATH',
    'mdms-v2/v2/_search',
  );

  static const _mdmsSchemaCode = EnvEntry(
    'MDMS_SCHEMA_CODE',
    '',
  );

  static const _tenantId = EnvEntry(
    'TENANT_ID',
    'default',
  );

  static const _actionMapUrl = EnvEntry(
    'ACTIONS_API_PATH',
    'access/v1/actions/mdms/_get',
  );

  static const _hierarchyType = EnvEntry(
    'HIERARCHY_TYPE',
    'ADMIN',
  );

  // Microsoft Entra ID (Azure AD) SSO Configuration
  static const _entraClientId = EnvEntry(
    'ENTRA_CLIENT_ID',
    '',
  );

  static const _entraTenantId = EnvEntry(
    'ENTRA_TENANT_ID',
    'common', // 'common' allows both personal and work accounts
  );

  static const _entraRedirectUrl = EnvEntry(
    'ENTRA_REDIRECT_URL',
    'com.digit.hcm://oauth/callback',
  );

  static const _entraOAuthLoginPath = EnvEntry(
    'ENTRA_OAUTH_LOGIN_PATH',
    '/user/oauth/login',
  );

  static const _enableSso = EnvEntry(
    'ENABLE_SSO',
    'false',
  );

  const Variables({
    this.useFallbackValues = false,
    required DotEnv dotEnv,
  }) : _dotEnv = dotEnv;

  String get baseUrl => useFallbackValues
      ? _baseUrl.value
      : _dotEnv.get(_baseUrl.key, fallback: _baseUrl.value);

  String get checkBandwidthApiPath => useFallbackValues
      ? _checkBandwidthApi.value
      : _dotEnv.get(_checkBandwidthApi.key, fallback: _checkBandwidthApi.value);

  String get mdmsApiPath => useFallbackValues
      ? _mdmsApi.value
      : _dotEnv.get(_mdmsApi.key, fallback: _mdmsApi.value);

  String get mdmsBaseUrl {
    final url = useFallbackValues
        ? _mdmsBaseUrl.value
        : _dotEnv.get(_mdmsBaseUrl.key, fallback: _mdmsBaseUrl.value);
    return url.isEmpty ? baseUrl : url;
  }

  String get mdmsV2ApiPath => useFallbackValues
      ? _mdmsV2ApiPath.value
      : _dotEnv.get(_mdmsV2ApiPath.key, fallback: _mdmsV2ApiPath.value);

  String get mdmsSchemaCode => useFallbackValues
      ? _mdmsSchemaCode.value
      : _dotEnv.get(_mdmsSchemaCode.key, fallback: _mdmsSchemaCode.value);

  String get hierarchyType => useFallbackValues
      ? _hierarchyType.value
      : _dotEnv.get(_hierarchyType.key, fallback: _hierarchyType.value);

  String get actionMapApiPath => useFallbackValues
      ? _actionMapUrl.value
      : _dotEnv.get(_actionMapUrl.key, fallback: _actionMapUrl.value);

  String get tenantId {
    // First check if user has selected a tenantId from MDMS dropdown
    final selectedTenantId = AppSharedPreferences().getSelectedTenantId;
    if (selectedTenantId != null && selectedTenantId.isNotEmpty) {
      return selectedTenantId;
    }
    // Fall back to environment variable
    return useFallbackValues
        ? _tenantId.value
        : _dotEnv.get(_tenantId.key, fallback: _tenantId.value);
  }

  String get dumpErrorApiPath => useFallbackValues
      ? _dumpErrorApi.value
      : _dotEnv.get(_dumpErrorApi.key, fallback: _dumpErrorApi.value);

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

  int get syncDownRetryCount => useFallbackValues
      ? int.tryParse(_syncDownRetryCount.value) ?? _syncDownRetryCountValue
      : int.tryParse(_dotEnv.get(
            _syncDownRetryCount.key,
            fallback: _syncDownRetryCount.value,
          )) ??
          _syncDownRetryCountValue;

  int get retryTimeInterval => useFallbackValues
      ? int.tryParse(_retryTimeInterval.value) ?? _retryTimeIntervalValue
      : int.tryParse(_dotEnv.get(
            _retryTimeInterval.key,
            fallback: _retryTimeInterval.value,
          )) ??
          _retryTimeIntervalValue;

  EnvType get envType {
    final envName = useFallbackValues
        ? _envName.value
        : _dotEnv.get(_envName.key, fallback: _envName.value);

    return EnvType.values.firstWhereOrNull((env) => env.name == envName) ??
        EnvType.dev;
  }

  // Microsoft Entra ID Configuration
  String get entraClientId => useFallbackValues
      ? _entraClientId.value
      : _dotEnv.get(_entraClientId.key, fallback: _entraClientId.value);

  String get entraTenantId => useFallbackValues
      ? _entraTenantId.value
      : _dotEnv.get(_entraTenantId.key, fallback: _entraTenantId.value);

  String get entraRedirectUrl => useFallbackValues
      ? _entraRedirectUrl.value
      : _dotEnv.get(
          _entraRedirectUrl.key,
          fallback: _entraRedirectUrl.value,
        );

  String get entraOAuthLoginPath => useFallbackValues
      ? _entraOAuthLoginPath.value
      : _dotEnv.get(
          _entraOAuthLoginPath.key,
          fallback: _entraOAuthLoginPath.value,
        );

  bool get enableSso {
    final value = useFallbackValues
        ? _enableSso.value
        : _dotEnv.get(_enableSso.key, fallback: _enableSso.value);
    return value.toLowerCase() == 'true';
  }

  /// Returns EntraConfig object with all Microsoft Entra ID configuration
  EntraConfig get entraConfig {
    final tenantId = entraTenantId;
    final discoveryUrl =
        'https://login.microsoftonline.com/$tenantId/v2.0/.well-known/openid-configuration';

    return EntraConfig(
      clientId: entraClientId,
      tenantId: tenantId,
      redirectUrl: entraRedirectUrl,
      discoveryUrl: discoveryUrl,
      scopes: ['openid', 'profile', 'email'],
      oauthLoginPath: entraOAuthLoginPath,
    );
  }
}

/// Configuration model for Microsoft Entra ID SSO
class EntraConfig {
  final String clientId;
  final String tenantId;
  final String redirectUrl;
  final String discoveryUrl;
  final List<String> scopes;
  final String oauthLoginPath;

  const EntraConfig({
    required this.clientId,
    required this.tenantId,
    required this.redirectUrl,
    required this.discoveryUrl,
    required this.scopes,
    required this.oauthLoginPath,
  });
}

class EnvEntry {
  final String key;
  final String value;

  const EnvEntry(this.key, this.value);
}

enum EnvType {
  dev("DEV"),
  uat("UAT"),
  qa("QA"),
  prod("PROD"),
  demo("DEMO");

  final String env;

  const EnvType(this.env);

  String get name => env;
}
