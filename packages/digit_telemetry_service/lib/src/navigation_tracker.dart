import 'package:flutter/widgets.dart';

import 'digit_telemetry.dart';
import 'tracking_policy.dart';

/// What the app says about a route, for telemetry.
@immutable
class TelemetryRoute {
  /// A screen with key [key], e.g. `AEFI_CREATE/aefiCaseDetails`.
  const TelemetryRoute.screen(String this.key) : isHome = false;

  /// The home screen: reaching it ends the current module.
  const TelemetryRoute.home()
      : key = null,
        isHome = true;

  final String? key;
  final bool isHome;
}

/// Names a route for telemetry, or returns null to ignore it (dialogs,
/// popups, routes the app does not want tracked). Supplied by the app, so
/// this package does not depend on the app's router.
typedef TelemetryRouteResolver = TelemetryRoute? Function(Route<dynamic> route);

/// Reports each route that comes to the top of a navigator to
/// [NavigationTracker]. Add it to the navigator's observers.
class TelemetryRouteObserver extends NavigatorObserver {
  TelemetryRouteObserver(this._resolve, {NavigationTracker? tracker})
      : _tracker = tracker ?? NavigationTracker.instance {
    _tracker.listenToAppLifecycle();
  }

  final TelemetryRouteResolver _resolve;
  final NavigationTracker _tracker;

  @override
  void didPush(Route route, Route? previousRoute) =>
      _onTop(route, forward: true);

  @override
  void didPop(Route route, Route? previousRoute) =>
      _onTop(previousRoute, forward: false);

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) =>
      _onTop(newRoute, forward: true);

  void _onTop(Route? route, {required bool forward}) {
    if (route == null) return;
    final TelemetryRoute? resolved;
    try {
      resolved = _resolve(route);
    } catch (_) {
      return;
    }
    if (resolved == null) return;
    if (resolved.isHome) {
      _tracker.homeShown();
    } else {
      _tracker.screenShown(resolved.key!, forward: forward);
    }
  }
}

/// Turns navigation inside a module into telemetry, as allowed by [policy]:
/// - a screen view for every screen that comes to the top
/// - `navigated` for every step between two screens, with `from`, `to`,
///   `direction` (`forward` / `back`) and the seconds spent on `from`
///
/// A module runs from [moduleOpened] until the home screen is back on top.
/// Time on a screen stops while the app is in the background.
///
/// Route callbacks for one navigation (e.g. "pop back, then push") arrive one
/// by one in the same frame. They are recorded once at the end of the frame
/// as a single step, so screens the user never saw don't show up.
class NavigationTracker with WidgetsBindingObserver {
  NavigationTracker({TelemetryService? service, TrackingPolicy? policy})
      : _service = service,
        policy = policy ?? TrackingPolicy.off;

  /// The tracker the app uses.
  static final NavigationTracker instance = NavigationTracker();

  /// Fixed service for tests; the app uses [DigitTelemetry.instance].
  final TelemetryService? _service;
  TelemetryService get _telemetry => _service ?? DigitTelemetry.instance;

  /// What may be sent. Off until the app sets it.
  TrackingPolicy policy;

  /// Value of `to` when the user goes back to the home screen.
  static const home = 'HOME';

  String? _module;

  /// Key of the screen the user currently sees.
  String? _current;

  /// Time spent on [_current], paused while the app is in the background.
  final Stopwatch _onScreen = Stopwatch();

  // Navigation collected during the current frame.
  String? _pendingScreen;
  bool _pendingForward = false;
  bool _pendingHome = false;
  bool _scheduled = false;

  bool _listening = false;

  /// Starts pausing the screen timer while the app is in the background.
  void listenToAppLifecycle() {
    if (_listening) return;
    _listening = true;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (_current != null) _onScreen.start();
    } else {
      _onScreen.stop();
    }
  }

  /// Called when module [module] (e.g. `AEFI`) is opened.
  void moduleOpened(String module) {
    _module = module;
    _current = null;
    _onScreen
      ..stop()
      ..reset();
  }

  /// Called when the screen with [key] comes to the top. [forward] is true
  /// when it was opened and false when the user came back to it.
  void screenShown(String key, {required bool forward}) {
    _pendingScreen = key;
    _pendingHome = false;
    _pendingForward = _pendingForward || forward;
    _schedule();
  }

  /// Called when the home screen is back on top, which ends the module.
  void homeShown() {
    _pendingScreen = null;
    _pendingHome = true;
    _schedule();
  }

  void _schedule() {
    if (_scheduled) return;
    _scheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _commit());
    WidgetsBinding.instance.ensureVisualUpdate();
  }

  /// Records the navigation collected during this frame as one step.
  void _commit() {
    _scheduled = false;
    final screen = _pendingScreen;
    final forward = _pendingForward;
    final isHome = _pendingHome;
    _pendingScreen = null;
    _pendingForward = false;
    _pendingHome = false;

    if (isHome) {
      if (_current != null) _recordStep(home, forward: false);
      _module = null;
      _current = null;
      _onScreen
        ..stop()
        ..reset();
      return;
    }
    if (screen == null || screen == _current) return;

    if (_current != null) _recordStep(screen, forward: forward);
    final module = _module;
    if (module != null &&
        policy.allows(TrackCapability.screens,
            module: module, screen: screen)) {
      _telemetry.screen(screen, properties: {
        'module': module,
        'screen': screen,
      });
    }
    _current = screen;
    _onScreen
      ..reset()
      ..start();
  }

  /// Sends `navigated` from [_current] to [to], if the policy allows it for
  /// either screen.
  void _recordStep(String to, {required bool forward}) {
    final from = _current!;
    final module = _module;
    if (module == null) return;
    final capability =
        forward ? TrackCapability.navigation : TrackCapability.backNavigation;
    bool allowed(TrackCapability c) =>
        policy.allows(c, module: module, screen: from) ||
        policy.allows(c, module: module, screen: to);
    if (!allowed(capability)) return;

    _telemetry.track('navigated', properties: {
      'module': module,
      'from': from,
      'to': to,
      'direction': forward ? 'forward' : 'back',
      if (policy.allows(TrackCapability.timeOnScreen,
          module: module, screen: from))
        'seconds_on_screen': (_onScreen.elapsedMilliseconds / 100).round() / 10,
    });
  }
}
