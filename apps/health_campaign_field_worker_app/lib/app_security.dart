import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'utils/root_detection_utils.dart';

enum AppSecurityLevel {
  low,
  medium,
  high,
}

enum SecurityThreatType {
  root,
  emulator,
  hook,
  debugger,
  repackaging,
  unknown,
}

class SecurityCheckResult {
  final bool isPassed;
  final List<SecurityThreatType> threats;
  final String checksum;
  final DateTime timestamp;

  SecurityCheckResult({
    required this.isPassed,
    required this.threats,
    required this.checksum,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'isPassed': isPassed,
        'threats': threats.map((t) => t.name).toList(),
        'checksum': checksum,
        'timestamp': timestamp.toIso8601String(),
      };
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
        RootDetectionUtils.instance.startPeriodicSecurityChecks(
          interval: const Duration(minutes: 5),
        );
        break;
    }
  }

  void removeDebugPrints() {
    if (!kDebugMode) {
      debugPrint = (String? message, {int? wrapWidth}) => null;
    }
  }
}
