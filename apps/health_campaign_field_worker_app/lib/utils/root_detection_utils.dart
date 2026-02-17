import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';

import '../app_security.dart';
import 'environment_config.dart';

class RootDetectionUtils {
  late RootDetectionUtils securityLevel;
  static final RootDetectionUtils instance = RootDetectionUtils._();
  SecurityCheckResult? _lastSecurityCheck;
  bool _isSecurityCompromised = false;

  RootDetectionUtils._();
  factory RootDetectionUtils() {
    return instance;
  }

  static const _securityChannel = MethodChannel('com.digit.hcm/security');

  SecurityCheckResult? get lastSecurityCheck => _lastSecurityCheck;
  bool get isSecurityCompromised => _isSecurityCompromised;

  /// Multi-layered root detection with bypass prevention
  Future<SecurityCheckResult> performSecurityChecks() async {
    final threats = <SecurityThreatType>[];

    // Layer 1: Library-based detection
    try {
      final issues = await JailbreakRootDetection.instance.checkForIssues;
      if (issues.isNotEmpty) {
        threats.add(SecurityThreatType.root);
      }
    } catch (e) {
      // Library might be tampered if it throws unexpected errors
      threats.add(SecurityThreatType.unknown);
    }

    // Layer 2: Custom root detection checks
    if (await _customRootDetection()) {
      threats.add(SecurityThreatType.root);
    }

    // Layer 3: Emulator detection
    if (await _detectEmulator()) {
      threats.add(SecurityThreatType.emulator);
    }

    // Layer 4: Hook framework detection
    if (await _detectHookFrameworks()) {
      threats.add(SecurityThreatType.hook);
    }

    // Layer 5: Debugger detection
    if (await _detectDebugger()) {
      threats.add(SecurityThreatType.debugger);
    }

    // Layer 6: Repackaging detection
    if (await _detectRepackaging()) {
      threats.add(SecurityThreatType.repackaging);
    }

    // Generate checksum for integrity verification
    final checksum = _generateChecksum(threats);

    final result = SecurityCheckResult(
      isPassed: threats.isEmpty,
      threats: threats,
      checksum: checksum,
      timestamp: DateTime.now(),
    );

    _lastSecurityCheck = result;
    _isSecurityCompromised = !result.isPassed;

    return result;
  }

  /// Legacy method for backward compatibility
  Future<void> rootDetection() async {
    final result = await performSecurityChecks();

    if (!result.isPassed) {
      debugPrint('Security threats detected: ${result.threats.join(', ')}');

      if (envConfig.variables.envType == EnvType.prod) {
        // In production, handle the security threat appropriately
        _handleSecurityThreat(result);
      }
    }
  }

  /// Custom root detection checks
  Future<bool> _customRootDetection() async {
    if (!Platform.isAndroid) return false;

    try {
      // Use native Android security checks
      final result =
          await _securityChannel.invokeMethod<bool>('checkRootAccess');
      return result ?? false;
    } catch (e) {
      debugPrint('Native root detection failed: $e');
    }

    // Fallback to Dart-based checks
    final suspiciousFiles = [
      '/system/app/Superuser.apk',
      '/system/xbin/su',
      '/system/bin/su',
      '/sbin/su',
      '/system/su',
      '/system/bin/.ext/.su',
      '/system/xbin/busybox',
      '/data/local/xbin/su',
      '/data/local/bin/su',
      '/data/local/su',
    ];

    // Check for suspicious files
    for (final path in suspiciousFiles) {
      try {
        if (await File(path).exists()) {
          return true;
        }
      } catch (_) {}
    }

    return false;
  }

  /// Detect emulator environment
  Future<bool> _detectEmulator() async {
    if (!Platform.isAndroid) return false;

    try {
      final result = await _securityChannel.invokeMethod<bool>('checkEmulator');
      return result ?? false;
    } catch (e) {
      debugPrint('Emulator detection failed: $e');
      return false;
    }
  }

  /// Detect hooking frameworks (Frida, Xposed, etc.)
  Future<bool> _detectHookFrameworks() async {
    if (!Platform.isAndroid) return false;

    try {
      final result =
          await _securityChannel.invokeMethod<bool>('checkHookingFrameworks');
      return result ?? false;
    } catch (e) {
      debugPrint('Hook detection failed: $e');
    }

    // Fallback to Dart-based checks
    final hookFiles = [
      '/data/local/tmp/frida-server',
      '/data/local/tmp/re.frida.server',
      '/system/lib/libfrida-gadget.so',
      '/system/lib64/libfrida-gadget.so',
      '/system/xbin/frida-server',
    ];

    for (final path in hookFiles) {
      try {
        if (await File(path).exists()) {
          return true;
        }
      } catch (_) {}
    }

    return false;
  }

  /// Detect debugger attachment
  Future<bool> _detectDebugger() async {
    // In debug mode, debugger is expected
    if (kDebugMode) return false;

    try {
      final result = await _securityChannel.invokeMethod<bool>('checkDebugger');
      return result ?? false;
    } catch (e) {
      debugPrint('Debugger detection failed: $e');
      return false;
    }
  }

  /// Detect app repackaging/tampering
  Future<bool> _detectRepackaging() async {
    try {
      // TODO: Add your expected app signature here
      // You can get it from your release keystore
      const String? expectedSignature = null; // Replace with actual signature

      final result = await _securityChannel.invokeMethod<bool>(
        'checkAppSignature',
        {'expectedSignature': expectedSignature},
      );
      return !(result ?? true);
    } catch (e) {
      debugPrint('Signature verification failed: $e');
      return false;
    }
  }

  /// Generate integrity checksum
  String _generateChecksum(List<SecurityThreatType> threats) {
    final data =
        '${threats.map((t) => t.name).join('|')}${DateTime.now().millisecondsSinceEpoch}';
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Handle security threat detection
  void _handleSecurityThreat(SecurityCheckResult result) {
    // Log to analytics/monitoring system
    debugPrint('Security threat detected: ${result.toJson()}');

    // Option 1: Exit app (most restrictive)
    if (!kDebugMode) exit(0);

    // Option 2: Restrict functionality (recommended)
    // Show warning dialog, disable sensitive features
    _isSecurityCompromised = true;

    // Option 3: Report to server for server-side validation
    // This should be the primary defense - validate on server
    // _reportSecurityIssueToServer(result);
  }

  /// Report security issues to server for validation
  /// SERVER-SIDE VALIDATION IS CRITICAL - Client-side checks can be bypassed
  Future<void> reportSecurityStatusToServer(SecurityCheckResult result) async {
    // Implement API call to report device security status
    // Server should:
    // 1. Log the security check results
    // 2. Track devices with repeated security issues
    // 3. Implement additional authentication challenges
    // 4. Monitor for suspicious patterns
    // 5. Potentially block compromised devices

    // Example implementation:
    // await apiClient.post('/security/device-status', result.toJson());
  }

  _securityCheck() async {
    final result = await performSecurityChecks();

    if (!result.isPassed && envConfig.variables.envType == EnvType.prod) {
      _handleSecurityThreat(result);
    }
  }

  /// Periodic security checks (to detect runtime tampering)
  Future<void> startPeriodicSecurityChecks(
      {Duration interval = const Duration(minutes: 5)}) async {
    // if (kDebugMode) return;

    // Implement periodic checks in production
    if (envConfig.variables.envType == EnvType.prod) {
      _securityCheck();
      while (true) {
        await Future.delayed(interval);
        _securityCheck();
      }
    }
  }
}
