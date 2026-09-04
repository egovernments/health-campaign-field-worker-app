import 'package:flutter/foundation.dart';
import 'package:screen_protector/screen_protector.dart';

/// A singleton manager for handling screen protection across navigation.
/// This approach works reliably when pages share the same route type
/// but have different page names.
class ScreenProtectionManager {
  static final ScreenProtectionManager _instance = ScreenProtectionManager._internal();
  factory ScreenProtectionManager() => _instance;
  ScreenProtectionManager._internal();

  /// Stack of page entries tracking protection state
  final List<_PageEntry> _pageStack = [];

  /// Current protection state
  bool _isProtectionEnabled = false;

  /// Register a page when it becomes active.
  /// Call this in initState or when the page becomes visible.
  void registerPage(String pageName, bool isProtected) {
    // Remove any existing entry for this page (in case of re-registration)
    _pageStack.removeWhere((entry) => entry.pageName == pageName);

    // Add to stack
    _pageStack.add(_PageEntry(pageName: pageName, isProtected: isProtected));
    debugPrint('📋 ScreenProtectionManager: Registered $pageName (protected: $isProtected)');
    debugPrint('📋 Stack: ${_pageStack.map((e) => "${e.pageName}:${e.isProtected}").join(" -> ")}');

    // Update protection based on current page
    _updateProtection();
  }

  /// Unregister a page when it's disposed.
  /// Call this in dispose.
  void unregisterPage(String pageName) {
    _pageStack.removeWhere((entry) => entry.pageName == pageName);
    debugPrint('📋 ScreenProtectionManager: Unregistered $pageName');
    debugPrint('📋 Stack: ${_pageStack.map((e) => "${e.pageName}:${e.isProtected}").join(" -> ")}');

    // Update protection based on the page that's now on top
    _updateProtection();
  }

  /// Update protection when a page's protection requirement changes.
  void updatePageProtection(String pageName, bool isProtected) {
    final index = _pageStack.indexWhere((entry) => entry.pageName == pageName);
    if (index != -1) {
      _pageStack[index] = _PageEntry(pageName: pageName, isProtected: isProtected);
      debugPrint('📋 ScreenProtectionManager: Updated $pageName (protected: $isProtected)');
      _updateProtection();
    }
  }

  /// Get the current topmost page's protection requirement
  bool get _shouldBeProtected {
    if (_pageStack.isEmpty) return false;
    return _pageStack.last.isProtected;
  }

  /// Apply protection based on the topmost page
  Future<void> _updateProtection() async {
    final shouldProtect = _shouldBeProtected;

    if (shouldProtect && !_isProtectionEnabled) {
      await _enableProtection();
    } else if (!shouldProtect && _isProtectionEnabled) {
      await _disableProtection();
    }
  }

  Future<void> _enableProtection() async {
    try {
      await ScreenProtector.protectDataLeakageOn();
      await ScreenProtector.preventScreenshotOn();
      _isProtectionEnabled = true;
      debugPrint('🔒 ScreenProtectionManager: Protection ENABLED');
    } catch (e) {
      debugPrint('⚠️ ScreenProtectionManager: Failed to enable protection: $e');
    }
  }

  Future<void> _disableProtection() async {
    try {
      await ScreenProtector.protectDataLeakageOff();
      await ScreenProtector.preventScreenshotOff();
      _isProtectionEnabled = false;
      debugPrint('🔓 ScreenProtectionManager: Protection DISABLED');
    } catch (e) {
      debugPrint('⚠️ ScreenProtectionManager: Failed to disable protection: $e');
    }
  }

  /// Force refresh protection state for a specific page.
  /// Useful when navigating back to a page.
  Future<void> refreshProtection(String pageName, bool isProtected) async {
    debugPrint('🔄 ScreenProtectionManager: Refreshing protection for $pageName');

    // Update the page's protection state
    final index = _pageStack.indexWhere((entry) => entry.pageName == pageName);
    if (index != -1) {
      _pageStack[index] = _PageEntry(pageName: pageName, isProtected: isProtected);
    } else {
      // Page not in stack, add it
      _pageStack.add(_PageEntry(pageName: pageName, isProtected: isProtected));
    }

    // Force update protection
    if (isProtected) {
      await _enableProtection();
    } else {
      await _disableProtection();
    }
  }
}

class _PageEntry {
  final String pageName;
  final bool isProtected;

  _PageEntry({required this.pageName, required this.isProtected});
}
