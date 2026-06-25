import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';

import 'utils/environment_config.dart';

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
        rootDetection();
        break;
    }
  }

  void removeDebugPrints() {
    if (!kDebugMode) {
      debugPrint = (String? message, {int? wrapWidth}) => null;
    }
  }

  Future<void> rootDetection() async {
    if (!kDebugMode) {
      try {
        final issues = await JailbreakRootDetection.instance.checkForIssues;
        if (issues.isNotEmpty) {
          debugPrint('Security warning: ${issues.join(', ')}');
          if (envConfig.variables.envType == EnvType.prod) {
            exit(0);
          }
        }
      } catch (e) {
        debugPrint('Security check failed: $e');
      }
    }
  }
}
