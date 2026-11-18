// Embed mode (`?embed=1`): the preview inside an iframe of the campaign
// console (DIGIT-Frontend campaign-manager), driven by window.postMessage.
//
// Protocol (all messages are objects with a `type`; same origin only):
//
//   preview -> host  {type: 'hcm-preview:ready', protocol: 1}
//                    sent once the preview is listening.
//   host -> preview  {type: 'hcm-preview:init',
//                     session: {token, userInfo, tenantId,
//                               host?, locale?, hierarchyType?},
//                     campaignNumber,
//                     config?}
//                    Uses the console's session (no second sign-in), opens
//                    the campaign's project by its referenceID, and puts
//                    `config` (an unsaved FormConfig: {name, flows, ...})
//                    on the home screen in place of the saved one.
//   host -> preview  {type: 'hcm-preview:config', config}
//                    Replaces the draft; if that module is open, it restarts
//                    at its first screen.
//   preview -> host  {type: 'hcm-preview:status',
//                     state: 'loading' | 'ready' | 'config-applied' |
//                            'signed-out' | 'error',
//                     message?}
//
// `session.host` defaults to this page's origin (the preview is served from
// the console's domain). The token is kept in memory only.
import 'dart:convert';

import 'package:digit_flow_builder/router/flow_builder_routes.gm.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:flutter/material.dart';

import '../config_loader.dart';
import '../digit_account.dart';
import '../launcher.dart';
import '../messages_loader.dart';
import '../router.dart';
import 'embed_bridge_stub.dart'
    if (dart.library.js_interop) 'embed_bridge_web.dart';

const embedProtocolVersion = 1;

bool get isEmbedded => Uri.base.queryParameters['embed'] == '1';

enum EmbedState { waiting, loading, ready, error }

class EmbedController extends ChangeNotifier {
  EmbedController._();

  static final instance = EmbedController._();

  EmbedState state = EmbedState.waiting;
  String? message;
  String? campaignNumber;

  PreviewRouter? _router;
  DigitAccount? _account;

  bool get insideHost => EmbedBridge.hasParent;

  /// Starts listening to the host page and tells it the preview is ready.
  void start({required PreviewRouter router, required DigitAccount account}) {
    if (_router != null) return;
    _router = router;
    _account = account;
    EmbedBridge.listen(_onMessage);
    EmbedBridge.send({
      'type': 'hcm-preview:ready',
      'protocol': embedProtocolVersion,
    });
  }

  /// Back to waiting for the host (after sign-out).
  void reset() {
    state = EmbedState.waiting;
    message = null;
    campaignNumber = null;
    MessageServerSettings.override = null;
    useSameOriginApi = false;
    _status('signed-out');
    notifyListeners();
  }

  void _onMessage(Map<String, dynamic> msg) {
    switch (msg['type']) {
      case 'hcm-preview:init':
        _init(msg);
      case 'hcm-preview:config':
        _updateConfig(msg['config']);
    }
  }

  void _status(String state, [String? message]) => EmbedBridge.send({
        'type': 'hcm-preview:status',
        'state': state,
        if (message != null) 'message': message,
      });

  void _fail(String text) {
    state = EmbedState.error;
    message = text;
    _status('error', text);
    notifyListeners();
  }

  Future<void> _init(Map<String, dynamic> msg) async {
    final account = _account!;
    final router = _router!;
    final session = msg['session'];
    final campaign = msg['campaignNumber']?.toString();
    if (session is! Map ||
        session['token'] is! String ||
        session['userInfo'] is! Map ||
        session['tenantId'] is! String) {
      _fail('init needs session.token, session.userInfo and session.tenantId.');
      return;
    }
    if (campaign == null || campaign.isEmpty) {
      _fail('init needs campaignNumber.');
      return;
    }
    // Check the config before touching the session, so a bad draft does not
    // leave the preview half set up.
    final config = msg['config'];
    Map<String, dynamic>? draft;
    if (config != null) {
      try {
        draft = draftFromConfig(config);
      } on ConfigError catch (e) {
        _fail('The config cannot be previewed: ${e.message}');
        return;
      }
    }

    state = EmbedState.loading;
    message = null;
    campaignNumber = campaign;
    _status('loading');
    notifyListeners();

    try {
      // Defaults (locale, hierarchy) from the saved settings, then the
      // host's values on top.
      MessageServerSettings.override = null;
      final defaults = await MessageServerSettings.load();
      final named = (session['host'] as String?)?.trim().isNotEmpty == true;
      final host = named ? session['host'] as String : Uri.base.origin;
      // No host named: the console's own origin serves the APIs.
      useSameOriginApi = !named;
      final tenant = session['tenantId'] as String;
      MessageServerSettings.override = MessageServerSettings(
        host,
        tenant,
        (session['locale'] as String?) ?? defaults.locale,
        (session['hierarchyType'] as String?) ?? defaults.hierarchy,
      );

      account.signOut();
      account.adoptSession(
        host: host,
        tenantId: tenant,
        token: session['token'] as String,
        userInfo: Map<String, dynamic>.from(session['userInfo'] as Map),
        hierarchyType: session['hierarchyType'] as String?,
      );
      final project = await account.loadProjectByReference(campaign);
      await account.selectProject(project);
      // The campaign's own hierarchy (boundary names, hcm-boundary-<type>
      // messages) unless the host named one.
      final projectHierarchy = project.additionalDetails?.hierarchyType;
      if (session['hierarchyType'] == null && projectHierarchy != null) {
        final s = MessageServerSettings.override!;
        MessageServerSettings.override =
            MessageServerSettings(s.host, s.tenant, s.locale, projectHierarchy);
      }
      if (draft != null) account.setDraftConfig(draft);

      state = EmbedState.ready;
      _status('ready');
      notifyListeners();
      // Same next step as the app after choosing a project.
      router.replaceAll([const AppBoundaryRoute()]);
    } catch (e) {
      _fail(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  void _updateConfig(dynamic config) {
    final account = _account!;
    if (state != EmbedState.ready) {
      _status('error', 'Send hcm-preview:init before hcm-preview:config.');
      return;
    }
    final Map<String, dynamic> draft;
    try {
      draft = draftFromConfig(config);
    } on ConfigError catch (e) {
      _status('error', 'The config cannot be previewed: ${e.message}');
      return;
    }
    account.setDraftConfig(draft);
    _status('config-applied');
    _restartIfOpen(draft);
  }

  /// If the updated module is on screen, open it again from its first
  /// screen so the change shows.
  void _restartIfOpen(Map<String, dynamic> draft) {
    final router = _router!;
    final open = currentModule;
    final top = router.topRoute.name;
    final inFlow = top == FlowBuilderHomeRoute.name ||
        top == FormsRenderRoute.name;
    if (open == null || open.name != draft['name'] || !inFlow) return;
    final module = parseConfig(jsonEncode(draft));
    router.replaceAll([const AppHomeRoute()]).then((_) {
      final context = router.navigatorKey.currentContext;
      if (context != null && context.mounted) {
        launchModule(context, module);
      }
    });
  }
}

/// Normalises any config shape [parseConfig] accepts into the module map the
/// home screen opens: {name, initialPage, flows, project}.
Map<String, dynamic> draftFromConfig(dynamic config) {
  final module = parseConfig(jsonEncode(config));
  return {
    'name': module.name,
    'initialPage': module.initialPage,
    'flows': module.flows,
    if (module.project != null) 'project': module.project,
  };
}

/// Start page in embed mode: waits for the host page's init message.
class EmbedPage extends StatelessWidget {
  const EmbedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = EmbedController.instance;
    return Scaffold(
      body: ListenableBuilder(
        listenable: c,
        builder: (context, _) {
          final theme = Theme.of(context);
          final (busy, text) = switch (c.state) {
            EmbedState.waiting => c.insideHost
                ? (true, 'Waiting for the campaign console…')
                : (
                    false,
                    'This page is opened by the campaign console. Open the '
                        'preview without ?embed=1 to use it on its own.'
                  ),
            EmbedState.loading =>
              (true, 'Opening campaign ${c.campaignNumber ?? ''}…'),
            EmbedState.ready => (true, 'Opening…'),
            EmbedState.error => (false, c.message ?? 'Something went wrong.'),
          };
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (busy) const CircularProgressIndicator(),
                  if (c.state == EmbedState.error)
                    Icon(Icons.error_outline,
                        color: theme.colorScheme.error, size: 32),
                  const SizedBox(height: 16),
                  Text(text, textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
