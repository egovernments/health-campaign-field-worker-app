import 'package:flutter/foundation.dart';

enum AppSecurityLevel {
  low,
  medium,
  high,
}

class AppSecurity {
  late AppSecurityLevel securityLevel;
  static final AppSecurity instance = AppSecurity._();
  AppSecurity._() {
    securityLevel = AppSecurityLevel.low;
  }
  factory AppSecurity() {
    return instance;
  }

  set setSecurityLevel(AppSecurityLevel level) {
    securityLevel = level;
    switch (securityLevel) {
      case AppSecurityLevel.low:
        break;
      case AppSecurityLevel.medium:
        removeDebugPrints();
        break;
      case AppSecurityLevel.high:
        removeDebugPrints();
        break;
    }
  }

  void removeDebugPrints() {
    if (!kDebugMode) {
      debugPrint = (String? message, {int? wrapWidth}) => null;
    }
  }
}
