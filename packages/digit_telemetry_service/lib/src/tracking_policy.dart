/// Decides what telemetry may send, so tracking can be configured from data
/// (e.g. `analytics` blocks in a flow config) instead of code.
///
/// Screens are matched by the key the app gives them, e.g. a flow name plus
/// a form page: `aefiOverview` or `AEFI_CREATE/aefiCaseDetails`. Patterns may
/// use `*` as a wildcard.
library;

/// The kinds of tracking a policy can switch on.
enum TrackCapability {
  /// A screen view for every screen that comes to the top.
  screens('screens'),

  /// A step forward from one screen to another.
  navigation('navigation'),

  /// A step back from one screen to another.
  backNavigation('backNavigation'),

  /// The time spent on the screen that was left, sent with each step.
  timeOnScreen('timeOnScreen');

  const TrackCapability(this.key);

  /// The name used in the policy JSON.
  final String key;
}

class TrackingPolicy {
  const TrackingPolicy({
    required this.enabled,
    this.modules = const [],
    this.capabilities = const {},
    this.includeScreens = const ['*'],
    this.excludeScreens = const [],
  });

  /// Nothing is tracked.
  static const off = TrackingPolicy(enabled: false);

  /// Reads a policy shaped like the planned MDMS record:
  /// ```json
  /// {
  ///   "enabled": true,
  ///   "modules": ["AEFI"],
  ///   "track": ["screens", "navigation", "backNavigation", "timeOnScreen"],
  ///   "screens": { "include": ["*"], "exclude": [] }
  /// }
  /// ```
  /// Anything missing or malformed counts as off.
  factory TrackingPolicy.fromJson(Map<String, dynamic> json) {
    List<String> strings(Object? value) =>
        value is List ? value.whereType<String>().toList() : const [];

    final screens = json['screens'];
    final track = strings(json['track']);
    return TrackingPolicy(
      enabled: json['enabled'] == true,
      modules: strings(json['modules']),
      capabilities: {
        for (final capability in TrackCapability.values)
          if (track.contains(capability.key)) capability,
      },
      includeScreens:
          screens is Map ? strings(screens['include']) : const ['*'],
      excludeScreens: screens is Map ? strings(screens['exclude']) : const [],
    );
  }

  final bool enabled;

  /// Module keys (e.g. `AEFI`) that are tracked. `*` tracks every module.
  final List<String> modules;

  final Set<TrackCapability> capabilities;

  /// Screen key patterns that are tracked. An exclude match wins.
  final List<String> includeScreens;
  final List<String> excludeScreens;

  /// Whether anything is tracked for [module].
  bool tracksModule(String? module) =>
      enabled &&
      module != null &&
      modules.any((pattern) => matches(pattern, module));

  /// Whether [capability] is tracked for [screen] in [module].
  bool allows(
    TrackCapability capability, {
    required String? module,
    required String screen,
  }) =>
      tracksModule(module) &&
      capabilities.contains(capability) &&
      includeScreens.any((pattern) => matches(pattern, screen)) &&
      !excludeScreens.any((pattern) => matches(pattern, screen));

  /// Whether [value] matches [pattern], where `*` matches any characters.
  static bool matches(String pattern, String value) {
    if (pattern == '*') return true;
    final regex = RegExp(
      '^${pattern.split('*').map(RegExp.escape).join('.*')}\$',
    );
    return regex.hasMatch(value);
  }
}
