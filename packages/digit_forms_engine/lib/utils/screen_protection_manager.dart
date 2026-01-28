import 'package:digit_logger/digit_logger.dart';
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

    // Update protection based on current page
    _updateProtection();
  }

  /// Unregister a page when it's disposed.
  /// Call this in dispose.
  void unregisterPage(String pageName) {
    _pageStack.removeWhere((entry) => entry.pageName == pageName);

    // Update protection based on the page that's now on top
    _updateProtection();
  }

  /// Update protection when a page's protection requirement changes.
  void updatePageProtection(String pageName, bool isProtected) {
    final index = _pageStack.indexWhere((entry) => entry.pageName == pageName);
    if (index != -1) {
      _pageStack[index] = _PageEntry(pageName: pageName, isProtected: isProtected);
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
    } catch (e) {
      DigitLogger.warn(
        'Failed to enable screen protection',
        category: LogCategory.lifecycle,
        context: {'error': e.toString()},
      );
    }
  }

  Future<void> _disableProtection() async {
    try {
      await ScreenProtector.protectDataLeakageOff();
      await ScreenProtector.preventScreenshotOff();
      _isProtectionEnabled = false;
    } catch (e) {
      DigitLogger.warn(
        'Failed to disable screen protection',
        category: LogCategory.lifecycle,
        context: {'error': e.toString()},
      );
    }
  }

  /// Force refresh protection state for a specific page.
  /// Useful when navigating back to a page.
  Future<void> refreshProtection(String pageName, bool isProtected) async {
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
