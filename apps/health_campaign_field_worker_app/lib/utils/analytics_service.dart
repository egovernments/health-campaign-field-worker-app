import 'dart:async';

import 'package:digit_flow_builder/router/flow_builder_routes.gm.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

/// Product analytics for the field worker app, built for product owners.
///
/// Every event is sent to Firebase Analytics (always on) and to PostHog when
/// a project API key is configured via `POSTHOG_API_KEY` (see
/// [setupPostHog]). Both receive identical names and properties, so reports
/// in either tool line up.
///
/// Design rules:
/// * Event names are plain verbs a non-engineer can read in the Firebase /
///   GA4 console: `household_registered`, `data_synced`, `form_abandoned`.
/// * Parameter values are readable too: screen and form names are converted
///   from `closeHouseholdDetails` to `Close Household Details`, durations are
///   whole seconds, failure reasons are short phrases, not exception classes.
/// * No personal data. Names, phone numbers and beneficiary identifiers are
///   never sent. Campaign, area and worker ids are system identifiers.
/// * Firebase limits are respected: names <= 40 chars, string values <= 100
///   chars, user property values <= 36 chars.
///
/// Event catalogue (what a product owner sees):
///
/// | Question                          | Event(s)                                   |
/// |-----------------------------------|--------------------------------------------|
/// | Is the app usable on start?       | app_started, app_start_failed              |
/// | Who is working, where?            | worker_logged_in, campaign_selected,       |
/// |                                   | work_area_selected, language_selected      |
/// | What field work was completed?    | <flow>_completed (e.g. closehousehold_     |
/// |                                   | completed) and flow_completed              |
/// | Where do workers struggle?        | form_abandoned, form_validation_failed,    |
/// |                                   | scan_failed, location_unavailable,         |
/// |                                   | permission_denied, login_failed            |
/// | Is data reaching the server?      | data_synced, sync_failed, nothing_to_sync  |
/// | Are beneficiaries downloaded?     | beneficiaries_downloaded,                  |
/// |                                   | beneficiary_download_failed                |
/// | Is the backend healthy?           | request_failed, slow_request,              |
/// |                                   | campaign_data_load_failed                  |
/// | UX metrics (per flow)             | flow_started, flow_succeeded {seconds},    |
/// |                                   | flow_abandoned, button_clicked {button},   |
/// |                                   | back_navigated, error_shown,               |
/// |                                   | search_filtered, home_tile_clicked,        |
/// |                                   | sync_popup_closed, data_shared,            |
/// |                                   | beneficiary_ids_downloaded                 |
class AnalyticsService {
  static final AnalyticsService instance = AnalyticsService._();
  AnalyticsService._();

  /// Resolved lazily: the singleton is created in `main()` before
  /// `Firebase.initializeApp()` runs (see [markAppStart]), and touching
  /// `FirebaseAnalytics.instance` before that throws `[core/no-app]`.
  FirebaseAnalytics get _analytics => FirebaseAnalytics.instance;

  bool _posthogEnabled = false;
  bool _sessionReplayEnabled = false;

  /// Whether PostHog session replay is recording. When true the app root
  /// must be wrapped in [wrapForReplay].
  bool get sessionReplayEnabled => _sessionReplayEnabled;

  /// Wraps the app root so PostHog can capture replay frames. A no-op when
  /// replay is off.
  Widget wrapForReplay(Widget app) =>
      _sessionReplayEnabled ? PostHogWidget(child: app) : app;

  /// Turns PostHog on. Call after `envConfig.initialize()` and before
  /// [setAppContext]. A blank [apiKey] leaves PostHog disabled, which is the
  /// default for local builds and environments without a PostHog project.
  Future<void> setupPostHog({
    required String apiKey,
    required String host,
    bool debug = false,
    bool sessionReplay = false,
    bool maskReplay = true,
  }) async {
    if (apiKey.trim().isEmpty) return;
    final config = PostHogConfig(apiKey.trim())
      ..host = host.trim().isEmpty ? 'https://us.i.posthog.com' : host.trim()
      ..debug = debug
      ..captureApplicationLifecycleEvents = true
      // Field workers are always identified after login; anonymous events
      // before that should not create person profiles.
      ..personProfiles = PostHogPersonProfiles.identifiedOnly
      ..sessionReplay = sessionReplay;
    // Field data includes beneficiary names, phone numbers and IDs, so
    // replays mask every text field and image unless explicitly disabled.
    config.sessionReplayConfig
      ..maskAllTexts = maskReplay
      ..maskAllImages = maskReplay;
    await Posthog().setup(config);
    _posthogEnabled = true;
    _sessionReplayEnabled = sessionReplay;
  }

  /// Screen name for a route. Flow-builder and forms-engine screens all share
  /// one route each (FlowBuilderHomeRoute / FormsRenderRoute), so they are
  /// named by the page they render, e.g. `Beneficiary Location`, instead of
  /// the generic route name. This applies on push and on pop-back, for both
  /// Firebase and PostHog (including session replay screen labels).
  static String? _routeName(RouteSettings settings) {
    final args = settings.arguments;
    if (args is FlowBuilderHomeRouteArgs && args.pageName.isNotEmpty) {
      return humanize(args.pageName);
    }
    if (args is FormsRenderRouteArgs) {
      final page =
          args.pageName.isNotEmpty ? args.pageName : args.currentSchemaKey;
      if (page.isNotEmpty) return humanize(page);
    }
    final name = settings.name;
    return name == null ? null : humanize(name);
  }

  /// Navigator observers for every enabled provider. Route names such as
  /// `BoundarySelectionRoute` are reported as `Boundary Selection`.
  List<NavigatorObserver> get observers => [
        FirebaseAnalyticsObserver(
          analytics: _analytics,
          nameExtractor: _routeName,
        ),
        if (_posthogEnabled) PosthogObserver(nameExtractor: _routeName),
      ];

  // ---------------------------------------------------------------------------
  // Provider fan-out. All public methods go through these four helpers.
  // ---------------------------------------------------------------------------

  Future<void> _track(String name, [Map<String, Object>? params]) =>
      Future.wait([
        _analytics.logEvent(name: name, parameters: params),
        if (_posthogEnabled)
          Posthog().capture(eventName: name, properties: params),
      ]);

  /// A property attached to the user and, in PostHog, to every later event
  /// (a "super property").
  Future<void> _setProperty(String name, String? value) => Future.wait([
        _analytics.setUserProperty(name: name, value: value),
        if (_posthogEnabled)
          value == null
              ? Posthog().unregister(name)
              : Posthog().register(name, value),
      ]);

  Future<void> _setUserId(String? userId, {Map<String, Object>? traits}) =>
      Future.wait([
        _analytics.setUserId(id: userId),
        if (_posthogEnabled)
          userId == null
              ? Posthog().reset()
              : Posthog().identify(userId: userId, userProperties: traits),
      ]);

  // ---------------------------------------------------------------------------
  // Readability helpers
  // ---------------------------------------------------------------------------

  /// `closeHouseholdDetails` -> `Close Household Details`,
  /// `BoundarySelectionRoute` -> `Boundary Selection`,
  /// `HouseholdMemberModel` -> `Household Member`.
  /// All-caps configuration keys such as `CLOSEHOUSEHOLD` are left as-is
  /// because they are the names product owners gave the flows in the console.
  static String humanize(String raw) {
    var s = raw
        .replaceAll(RegExp(r'Route$'), '')
        .replaceAll(RegExp(r'Model$'), '')
        .replaceAll(RegExp(r'Wrapper$'), '');
    if (s.isEmpty) return raw;
    if (s.toUpperCase() == s) return s;
    s = s
        .replaceAllMapped(RegExp(r'(?<=[a-z0-9])(?=[A-Z])'), (_) => ' ')
        .replaceAll(RegExp(r'[_\-]+'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    return s[0].toUpperCase() + s.substring(1);
  }

  static String _clip(String value, [int max = 100]) =>
      value.length > max ? value.substring(0, max) : value;

  static int _seconds(int milliseconds) => (milliseconds / 1000).round();

  static String _yesNo(bool value) => value ? 'yes' : 'no';

  /// `SYNC_DIALOG_CONNECTION_TIMED_OUT` -> `connection timed out`.
  static String _readableSyncReason(String message) {
    final key = message.split('\n').first.trim();
    const known = {
      'SYNC_DIALOG_NO_INTERNET_CONNECTION': 'no internet',
      'SYNC_DIALOG_CONNECTION_TIMED_OUT': 'connection timed out',
      'SYNC_DIALOG_SERVER_ERROR': 'server error',
      'SYNC_DIALOG_SESSION_EXPIRED': 'session expired',
      'SYNC_DIALOG_NETWORK_ERROR': 'network error',
    };
    return known[key] ?? _clip(key);
  }

  /// Dio error type names -> short phrases.
  static String _readableRequestReason(String dioType, int? statusCode) {
    switch (dioType) {
      case 'connectionTimeout':
        return 'connection timed out';
      case 'sendTimeout':
        return 'upload timed out';
      case 'receiveTimeout':
        return 'response timed out';
      case 'connectionError':
        return 'no connection';
      case 'badCertificate':
        return 'bad certificate';
      case 'cancel':
        return 'cancelled';
      case 'badResponse':
        if (statusCode == 401) return 'session expired';
        if (statusCode != null && statusCode >= 500) return 'server error';
        if (statusCode != null && statusCode >= 400) return 'rejected by server';
        return 'bad response';
      default:
        return 'unknown';
    }
  }

  /// `/project-factory/v1/_search` -> `project-factory _search`.
  static String _readableApi(String path) {
    final parts = path.split('/').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return path;
    if (parts.length == 1) return parts.first;
    return _clip('${parts.first} ${parts.last}');
  }

  // ---------------------------------------------------------------------------
  // App start and context
  // ---------------------------------------------------------------------------

  final Stopwatch _startupTimer = Stopwatch();
  bool _startupLogged = false;

  /// Call first thing in `main()`.
  void markAppStart() => _startupTimer
    ..reset()
    ..start();

  /// `app_started {seconds}` when configuration is ready and the first screen
  /// can render, or `app_start_failed` when it cannot. Logged once per launch.
  Future<void> logAppStartup({required bool success}) {
    if (_startupLogged) return Future.value();
    _startupLogged = true;
    _startupTimer.stop();
    return _track(success ? 'app_started' : 'app_start_failed', {'seconds': _seconds(_startupTimer.elapsedMilliseconds)},
    );
  }

  /// Lets product owners filter UAT / QA traffic out of production reports.
  Future<void> setAppContext({
    required String env,
    required String tenantId,
  }) =>
      Future.wait([
        _setProperty('app_env', env),
        _setProperty('tenant_id', tenantId),
      ]);

  Future<void> logLanguageSelected({required String locale}) => Future.wait([
        _setProperty('app_language', locale),
        _track('language_selected', {'language': locale},
        ),
      ]);

  // ---------------------------------------------------------------------------
  // Workers
  // ---------------------------------------------------------------------------

  Future<void> setUser({required String userId, required String tenantId}) =>
      Future.wait([
        _setUserId(userId, traits: {'tenant_id': tenantId}),
        _setProperty('tenant_id', tenantId),
      ]);

  Future<void> clearUser() => Future.wait([
        _setUserId(null),
        _setProperty('campaign', null),
        _setProperty('work_area', null),
      ]);

  Future<void> logLogin({required List<String> roles}) => Future.wait([
        _analytics.logLogin(loginMethod: 'password'),
        _track('worker_logged_in', {'roles': _clip(roles.join(', '))},
        ),
      ]);

  Future<void> logLoginFailed() => _track('login_failed');

  Future<void> logLogout() => _track('worker_logged_out');

  Future<void> logDeviceSwitch({required String reason}) =>
      _track('device_switched', {'reason': _clip(reason)},
      );

  // ---------------------------------------------------------------------------
  // Campaign and work area
  // ---------------------------------------------------------------------------

  Future<void> logCampaignDataLoaded() =>
      _track('campaign_data_loaded');

  Future<void> logCampaignDataLoadFailed({required String reason}) =>
      _track('campaign_data_load_failed', {'reason': _clip(humanize(reason).toLowerCase())},
      );

  Future<void> logCampaignSelected({
    required String campaignId,
    required String campaignName,
  }) =>
      Future.wait([
        _track('campaign_selected', {
            'campaign': _clip(campaignName),
            'campaign_id': campaignId,
          },
        ),
        _setProperty('campaign', _clip(campaignName, 36),
        ),
      ]);

  /// The area (village, clinic, ward) the worker chose to work in.
  Future<void> logWorkAreaSelected({
    required String areaCode,
    required String areaName,
    required int level,
  }) =>
      Future.wait([
        _track('work_area_selected', {
            'area': _clip(areaName),
            'area_code': _clip(areaCode),
            'level': level,
          },
        ),
        _setProperty('work_area', _clip(areaName, 36),
        ),
      ]);

  // ---------------------------------------------------------------------------
  // Sending data to the server
  // ---------------------------------------------------------------------------

  final Stopwatch _syncTimer = Stopwatch();
  int _syncPending = 0;

  /// Starts the sync clock. No event of its own: product owners care about
  /// the outcome, which is `data_synced` or `sync_failed`.
  void markSyncStarted({required int pendingRecords}) {
    _syncPending = pendingRecords;
    _syncTimer
      ..reset()
      ..start();
  }

  Future<void> logDataSynced() {
    _syncTimer.stop();
    return _track('data_synced', {
        'records': _syncPending,
        'seconds': _seconds(_syncTimer.elapsedMilliseconds),
      },
    );
  }

  Future<void> logNothingToSync() =>
      _track('nothing_to_sync');

  /// [step] is `upload`, `download` or `sync`.
  Future<void> logSyncFailed({required String message, required String step}) {
    _syncTimer.stop();
    final lines = message.split('\n');
    return _track('sync_failed', {
        'reason': _readableSyncReason(message),
        'step': step,
        'records': _syncPending,
        'seconds': _seconds(_syncTimer.elapsedMilliseconds),
        if (lines.length > 1) 'api': _readableApi(lines[1].trim()),
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Downloading beneficiaries
  // ---------------------------------------------------------------------------

  final Stopwatch _downloadTimer = Stopwatch();

  void markDownloadStarted() => _downloadTimer
    ..reset()
    ..start();

  Future<void> logBeneficiariesDownloaded({
    required String area,
    required int records,
  }) {
    _downloadTimer.stop();
    return _track('beneficiaries_downloaded', {
        'area': _clip(area),
        'records': records,
        'seconds': _seconds(_downloadTimer.elapsedMilliseconds),
      },
    );
  }

  Future<void> logBeneficiaryDownloadFailed({
    required String area,
    required String reason,
  }) {
    _downloadTimer.stop();
    return _track('beneficiary_download_failed', {
        'area': _clip(area),
        'reason': reason,
        'seconds': _seconds(_downloadTimer.elapsedMilliseconds),
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Backend health
  // ---------------------------------------------------------------------------

  Future<void> logRequestFailed({
    required String path,
    required int? statusCode,
    required String dioType,
    required int? durationMs,
  }) =>
      _track('request_failed', {
          'api': _readableApi(path),
          'reason': _readableRequestReason(dioType, statusCode),
          'status': statusCode ?? 0,
          if (durationMs != null) 'seconds': _seconds(durationMs),
        },
      );

  Future<void> logSlowRequest({
    required String path,
    required int durationMs,
  }) =>
      _track('slow_request', {
          'api': _readableApi(path),
          'seconds': _seconds(durationMs),
        },
      );

  // ---------------------------------------------------------------------------
  // Device blockers
  // ---------------------------------------------------------------------------

  /// [permission] may be `Permission.camera`; it is reported as `camera`.
  Future<void> logPermissionDenied({
    required String permission,
    required bool permanent,
  }) =>
      _track('permission_denied', {
          'permission': humanize(permission.split('.').last).toLowerCase(),
          'permanent': _yesNo(permanent),
        },
      );

  /// [type] is `qr` or `barcode`.
  Future<void> logScanSucceeded({required String type}) =>
      _track('scan_succeeded', {'type': type},
      );

  Future<void> logScanFailed({required String reason}) => _track('scan_failed', {'reason': _clip(reason)},
      );

  Future<void> logLocationUnavailable({required String reason}) =>
      _track('location_unavailable', {
          'reason': _clip(reason.replaceFirst('Exception: ', '').toLowerCase()),
        },
      );

  // ---------------------------------------------------------------------------
  // Flows (screens built by the flow builder)
  // ---------------------------------------------------------------------------

  /// One session per visit to the flow builder: it starts when the first flow
  /// screen opens, and ends on a success screen (`flow_succeeded`) or when the
  /// worker leaves without one (`flow_abandoned`). Screens of different
  /// categories (e.g. REGISTRATION then DELIVERY) can belong to one visit;
  /// each success screen reports its own category and restarts the clock, so
  /// "time to success" is measured from the previous milestone.
  _FlowSession? _flow;
  Timer? _flowCloseTimer;
  static const _flowCloseGrace = Duration(milliseconds: 1500);

  String get _currentFlow => _flow?.flow ?? '';
  String get _currentScreen => _flow?.lastScreen ?? '';

  /// Success screens are recognised by convention: the screen name contains
  /// "success" or the body shows a success panel card.
  static bool _isSuccessScreen(String pageName, Map<String, dynamic>? config) {
    if (pageName.toLowerCase().contains('success')) return true;
    final body = config?['body'];
    if (body is! List) return false;
    for (final widget in body) {
      if (widget is Map && widget['format'] == 'panelCard') {
        final props = widget['properties'];
        final type = props is Map ? props['type'] : null;
        if (type == null || type == 'success') return true;
      }
    }
    return false;
  }

  static String _flowNameFor(String pageName, Map<String, dynamic>? config) {
    final category = config?['category'];
    if (category is String && category.trim().isNotEmpty) return category.trim();
    return humanize(pageName);
  }

  /// A flow screen opened. Also reported as a screen view with a readable
  /// name so it appears next to the regular routes in the Screens report.
  Future<void> logFlowScreenOpened({
    required String pageName,
    Map<String, dynamic>? config,
  }) {
    _flowCloseTimer?.cancel();
    final flowName = _flowNameFor(pageName, config);
    final futures = <Future<void>>[];

    var session = _flow;
    if (session == null) {
      session = _flow = _FlowSession(flow: flowName, lastScreen: pageName);
      futures.add(_track('flow_started', {
        'flow': flowName,
        'first_screen': humanize(pageName),
      }));
    }
    session.openScreens++;
    session.screensViewed++;
    session.lastScreen = pageName;


    if (_isSuccessScreen(pageName, config)) {
      session.succeeded = true;
      futures.add(_track('flow_succeeded', {
        'flow': flowName,
        'screen': humanize(pageName),
        'seconds': _seconds(session.clock.elapsedMilliseconds),
        'screens_viewed': session.screensViewed,
      }));
      session.clock
        ..reset()
        ..start();
      session.screensViewed = 0;
    }
    return Future.wait(futures);
  }

  /// A flow screen closed. When no flow screen remains open for a short grace
  /// period and no success screen was reached, the visit is abandoned.
  void logFlowScreenClosed({required String pageName}) {
    final session = _flow;
    if (session == null) return;
    session.openScreens--;
    if (session.openScreens > 0) return;
    _flowCloseTimer?.cancel();
    _flowCloseTimer = Timer(_flowCloseGrace, () {
      if (!identical(_flow, session)) return;
      _flow = null;
      if (session.succeeded) return;
      _track('flow_abandoned', {
        'flow': session.flow,
        'last_screen': humanize(session.lastScreen),
        'screens_viewed': session.screensViewed,
        'seconds': _seconds(session.clock.elapsedMilliseconds),
      });
    });
  }

  /// A tap on any configured flow widget: button, card, link, popup action.
  /// Back links and BACK_NAVIGATION actions are reported as `back_navigated`;
  /// taps that trigger a search are also reported as `search_filtered` or
  /// `search_performed`.
  /// Widget `format` -> what a product owner would call it.
  static const _buttonTypes = {
    'button': 'button',
    'card': 'card',
    'menu_card': 'menu card',
    'panelCard': 'success panel button',
    'backLink': 'back link',
    'actionPopup': 'popup button',
    'iconButton': 'icon button',
    'filter': 'filter',
    'searchBar': 'search bar',
    'selectionCard': 'selection card',
    'selectButton': 'select button',
    'switch': 'toggle',
    'labelToggle': 'toggle',
    'qrScanner': 'scanner',
  };

  /// Action types -> what the tap does, most significant first.
  static const _actionMeanings = [
    ['CREATE_EVENT', 'saves record'],
    ['UPDATE_EVENT', 'updates record'],
    ['SEARCH_EVENT', 'searches'],
    ['OPEN_SCANNER', 'opens scanner'],
    ['OPEN_POPUP', 'opens popup'],
    ['CLOSE_POPUP', 'closes popup'],
    ['BACK_NAVIGATION', 'goes back'],
    ['NAVIGATION', 'opens page'],
    ['CLEAR_STATE', 'clears filters'],
  ];

  static String _actionMeaning(List<String> types) {
    for (final pair in _actionMeanings) {
      if (types.contains(pair[0])) return pair[1];
    }
    return types.isEmpty ? 'none' : humanize(types.first).toLowerCase();
  }

  /// `Stock Receipt Heading` -> `Stock Receipt`.
  static String _cleanButtonName(String name) => name
      .replaceAll(RegExp(r'\s+(Heading|Label|Button|Btn|Action)$'), '')
      .trim();

  Future<void> logFlowWidgetTapped({
    required String? screenKey,
    required String? fieldName,
    required String? labelKey,
    required String? format,
    required List<String> actionTypes,
    String? destination,
  }) {
    final screen = humanize((screenKey ?? _currentScreen).split('::').first);
    final button = _cleanButtonName(fieldName != null && fieldName.isNotEmpty
        ? humanize(fieldName)
        : humanize(labelKey ?? format ?? 'unknown'));
    final buttonType = _buttonTypes[format] ?? humanize(format ?? 'widget').toLowerCase();
    final action = _actionMeaning(actionTypes);
    final isBack = format == 'backLink' || actionTypes.contains('BACK_NAVIGATION');
    final isSearch = format == 'searchBar' || actionTypes.contains('SEARCH_EVENT');

    return Future.wait([
      if (isBack)
        _track('back_navigated', {
          'flow': _currentFlow,
          'screen': screen,
          'via': button,
          if (destination != null) 'to': humanize(destination),
        })
      else
        _track('button_clicked', {
          'flow': _currentFlow,
          'screen': screen,
          'button': button,
          'button_type': buttonType,
          'action': action,
          if (destination != null && destination.isNotEmpty)
            'destination': humanize(destination),
          if (labelKey != null && labelKey.isNotEmpty) 'label': _clip(labelKey),
        }),
      if (isSearch)
        _track(format == 'searchBar' ? 'search_performed' : 'search_filtered', {
          'flow': _currentFlow,
          'screen': screen,
          'button': button,
        }),
    ]);
  }

  static const _formButtonNames = {
    'next': 'Next',
    'submit': 'Submit',
    'secondary': 'Secondary action',
    'popup_confirm': 'Confirm',
    'popup_cancel': 'Cancel',
  };

  /// Footer and popup buttons on forms-engine pages.
  Future<void> logFormButtonPressed({
    required String pageName,
    required String schemaKey,
    required String kind,
    String? labelKey,
    int pageNumber = 0,
    int pageCount = 0,
  }) =>
      _track('button_clicked', {
        'flow': _currentFlow.isNotEmpty ? _currentFlow : _clip(schemaKey),
        'form': _clip(schemaKey),
        'screen': humanize(pageName.isEmpty ? schemaKey : pageName),
        'button': _formButtonNames[kind] ?? humanize(kind),
        'button_type': kind.startsWith('popup') ? 'popup button' : 'form button',
        'action': switch (kind) {
          'next' => 'next page',
          'submit' => 'submits form',
          'popup_confirm' => 'confirms',
          'popup_cancel' => 'cancels',
          _ => 'secondary action',
        },
        if (pageCount > 0) 'page': '$pageNumber of $pageCount',
        if (labelKey != null && labelKey.isNotEmpty) 'label': _clip(labelKey),
      });

  /// A tap on a button in a native (non flow-builder) screen.
  Future<void> logButtonClicked({
    required String screen,
    required String button,
  }) =>
      _track('button_clicked', {'screen': screen, 'button': button});

  /// Header back arrow on forms-engine pages.
  Future<void> logBackPressed({String? screen}) => _track('back_navigated', {
        'flow': _currentFlow,
        'screen': humanize(screen ?? _currentScreen),
        'via': 'Header back',
      });

  /// An error or warning toast shown by a flow action.
  Future<void> logErrorShown({
    required String messageKey,
    String? screen,
    String type = 'error',
  }) =>
      _track('error_shown', {
        'flow': _currentFlow,
        'screen': humanize((screen ?? _currentScreen).split('::').first),
        'message': _clip(messageKey),
        'type': type,
      });

  // ---------------------------------------------------------------------------
  // Native screens: home tiles, sync dialog, data sharing, beneficiary IDs
  // ---------------------------------------------------------------------------

  static const _homeTiles = {
    'HOME_BENEFICIARY_LABEL': 'Registration & Delivery',
    'HOME_CLOSE_HOUSEHOLD_LABEL': 'Mark Closed Household',
    'HOME_MANAGE_STOCK_LABEL': 'Manage Stock',
    'HOME_STOCK_RECONCILIATION_LABEL': 'Stock Reconciliation',
    'HOME_FILE_COMPLAINT': 'File Complaint',
    'HOME_SYNC_DATA_LABEL': 'Sync Data',
    'HOME_STOCK_SYNC_DATA_LABEL': 'Sync Stock Data',
    'HOME_BENEFICIARY_REFERRAL_LABEL': 'Beneficiary Referral',
    'HOME_VIEW_REPORTS_LABEL': 'View Reports',
    'HOME_MANAGE_ATTENDANCE_LABEL': 'Manage Attendance',
    'HOME_DATA_SHARE_LABEL': 'Share Data',
    'HOME_BENEFICIARY_ID_LABEL': 'Beneficiary IDs',
    'HOME_TRANSIT_POST_LABEL': 'Transit Post',
    'HOME_DASHBOARD_LABEL': 'Dashboard',
    'MY_CHECK_LIST_LABEL': 'My Checklists',
    'HOME_DB_LABEL': 'Database',
  };

  final Stopwatch _syncClickClock = Stopwatch();

  Future<void> logHomeTileClicked({required String labelKey}) {
    final tile = _homeTiles[labelKey] ??
        humanize(labelKey
            .replaceFirst(RegExp(r'^HOME_'), '')
            .replaceFirst(RegExp(r'_LABEL$'), '')
            .toLowerCase());
    if (labelKey == 'HOME_SYNC_DATA_LABEL') {
      _syncClickClock
        ..reset()
        ..start();
    }
    return _track('home_tile_clicked', {'tile': tile});
  }

  /// The worker dismissed the "Data synced" dialog. `seconds` is measured from
  /// the Sync Data tile tap.
  Future<void> logSyncDialogClosed() {
    final params = <String, Object>{};
    if (_syncClickClock.isRunning) {
      _syncClickClock.stop();
      params['seconds'] = _seconds(_syncClickClock.elapsedMilliseconds);
    }
    return _track('sync_popup_closed', params);
  }

  final Stopwatch _dataShareClock = Stopwatch();

  /// [direction] is `send` or `receive`.
  Future<void> logDataShareStarted({required String direction}) {
    _dataShareClock
      ..reset()
      ..start();
    return _track('button_clicked', {
      'screen': 'Data Sharing',
      'button': direction == 'send' ? 'Send' : 'Receive',
    });
  }

  Future<void> logDataShared({required String direction, int? areas}) {
    _dataShareClock.stop();
    return _track('data_shared', {
      'direction': direction,
      if (areas != null) 'areas': areas,
      'seconds': _seconds(_dataShareClock.elapsedMilliseconds),
    });
  }

  Future<void> logDataShareFailed({
    required String direction,
    required String reason,
  }) {
    _dataShareClock.stop();
    return _track('data_share_failed', {
      'direction': direction,
      'reason': _clip(reason),
      'seconds': _seconds(_dataShareClock.elapsedMilliseconds),
    });
  }

  final Stopwatch _idDownloadClock = Stopwatch();

  void markBeneficiaryIdDownloadStarted() => _idDownloadClock
    ..reset()
    ..start();

  Future<void> logBeneficiaryIdsDownloaded({required int count}) {
    _idDownloadClock.stop();
    return _track('beneficiary_ids_downloaded', {
      'count': count,
      'seconds': _seconds(_idDownloadClock.elapsedMilliseconds),
    });
  }

  Future<void> logBeneficiaryIdDownloadFailed({required String reason}) {
    _idDownloadClock.stop();
    return _track('beneficiary_id_download_failed', {
      'reason': _clip(reason),
      'seconds': _seconds(_idDownloadClock.elapsedMilliseconds),
    });
  }

  /// Fired once per persisted save in a flow. Emits both a per-flow event
  /// (`closehousehold_completed`) so counts show up by name in the console,
  /// and a generic `flow_completed` for cross-flow totals.
  Future<void> logFlowCompleted({
    required String flowKey,
    required List<String> recordTypes,
  }) {
    final flow = flowKey.split('::').first;
    final records = recordTypes
        .map((t) => humanize(t).toLowerCase())
        .toSet()
        .join(', ');
    final eventName = _clip(
      '${flow.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '_')}_completed',
      40,
    );
    final params = {'flow': _clip(flow), 'records': _clip(records)};
    return Future.wait([
      _track(eventName, params),
      _track('flow_completed', params),
    ]);
  }

  Future<void> logActionFailed({
    required String action,
    required String error,
  }) =>
      _track('action_failed', {
          'action': humanize(action).toLowerCase(),
          'error': _clip(error),
        },
      );

  Future<void> logDataLoadFailed({
    required String flowKey,
    required String error,
  }) =>
      _track('data_load_failed', {
          'flow': _clip(flowKey.split('::').first),
          'error': _clip(error),
        },
      );

  // ---------------------------------------------------------------------------
  // Forms
  // ---------------------------------------------------------------------------

  /// One session per form (schema key). A form may span several pages that
  /// open and close as the worker moves forward, so abandonment is decided
  /// only when no page of the form is open for a short grace period and no
  /// submit happened.
  final Map<String, _FormSession> _forms = {};
  static const _formCloseGrace = Duration(milliseconds: 1500);

  Future<void> logFormOpened({
    required String pageName,
    required String schemaKey,
  }) {
    if (schemaKey.isEmpty) return Future.value();
    final session = _forms.putIfAbsent(schemaKey, _FormSession.new);
    session.closeTimer?.cancel();
    session.openPages++;
    session.lastPage = pageName;
    return _track('form_opened', {
        'form': _clip(schemaKey),
        'page': humanize(pageName.isEmpty ? schemaKey : pageName),
      },
    );
  }

  Future<void> logFormSubmitted({required String schemaKey}) {
    final session = _forms[schemaKey];
    if (session == null || session.submitted) return Future.value();
    session.submitted = true;
    return _track('form_completed', {
        'form': _clip(schemaKey),
        'seconds': _seconds(session.timer.elapsedMilliseconds),
      },
    );
  }

  void logFormClosed({required String pageName, required String schemaKey}) {
    final session = _forms[schemaKey];
    if (session == null) return;
    session.openPages--;
    if (session.openPages > 0) return;
    session.closeTimer?.cancel();
    session.closeTimer = Timer(_formCloseGrace, () {
      _forms.remove(schemaKey);
      if (session.submitted) return;
      _track('form_abandoned', {
          'form': _clip(schemaKey),
          'page': humanize(
            pageName.isEmpty ? (session.lastPage ?? schemaKey) : pageName,
          ),
          'seconds': _seconds(session.timer.elapsedMilliseconds),
        },
      );
    });
  }

  Future<void> logFormValidationFailed({
    required String pageName,
    required String schemaKey,
    required List<String> failedFields,
  }) =>
      _track('form_validation_failed', {
          'form': _clip(schemaKey),
          'page': humanize(pageName.isEmpty ? schemaKey : pageName),
          'field_count': failedFields.length,
          // Field keys are schema identifiers, not what the worker typed.
          'fields': _clip(
            failedFields.map((f) => humanize(f).toLowerCase()).join(', '),
          ),
        },
      );
}

class _FlowSession {
  _FlowSession({required this.flow, required this.lastScreen});
  final String flow;
  final Stopwatch clock = Stopwatch()..start();
  String lastScreen;
  int openScreens = 0;
  int screensViewed = 0;
  bool succeeded = false;
}

class _FormSession {
  final Stopwatch timer = Stopwatch()..start();
  int openPages = 0;
  bool submitted = false;
  String? lastPage;
  Timer? closeTimer;
}
