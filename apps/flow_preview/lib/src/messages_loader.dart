import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'browser_storage_stub.dart'
    if (dart.library.js_interop) 'browser_storage_web.dart';
import 'config_loader.dart';
import 'localization.dart';

/// Exceptions to the app's naming rule `hcm-<config name>-<project ref>`
/// (apps/health_campaign_field_worker_app/lib/pages/home.dart), keyed by the
/// config's `name`. `{ref}` is the project referenceID. Checked against
/// unified-qa (2026-11-11): HOUSEHOLDSTRATEGY, MISSEDCHILDREN, STOCK, LQA,
/// COMPLAINTS, INSIDEMONITORING, OUTSIDEHOUSEHOLD follow the rule.
const Map<String, String> _modulesByConfigName = {
  'REGISTRATION': 'hcm-registration-{ref},hcm-beneficiary',
  'CLOSEHOUSEHOLD': 'hcm-closehousehold-{ref}',
  'CLOSEDHOUSEHOLD': 'hcm-closehousehold-{ref}',
  'COMPLAINTS': 'hcm-complaints-{ref}',
  'HFREFERRAL': 'hcm-hfreferral-{ref}',
  'INVENTORY': 'hcm-inventory-{ref}',
  'STOCK': 'hcm-stock-{ref}',
  'STOCKRECONCILIATION': 'hcm-stockreconciliation-{ref}',
  'STOCKREPORTS': 'hcm-stockreports-{ref}',
  'LQA': 'hcm-lqa-{ref}',
  'INSIDEMONITORING': 'hcm-insidemonitoring-{ref}',
  'CHECKLIST': 'hcm-checklist-{ref}',
};

/// Modules the field worker app adds whenever it opens a flow module
/// (`triggerLocalization` in apps/health_campaign_field_worker_app/lib/pages/home.dart).
/// The app also adds `hcm-boundary-<hierarchy type>` (see [guessModules]).
const List<String> appFlowCommonModules = [
  'hcm-common',
  'hcm-login',
  'hcm-scanner',
  'hcm-checklist',
  'hcm-beneficiary',
];

/// Same modules the app requests for [module]; the user can edit them.
String guessModules(PreviewModule? module, {String hierarchyType = 'ADMIN'}) {
  final modules = <String>[];
  if (module != null) {
    final ref = module.project ?? '';
    final pattern = _modulesByConfigName[module.name.toUpperCase()] ??
        'hcm-${module.name.toLowerCase()}-{ref}';
    modules.addAll(pattern.replaceAll('{ref}', ref).split(','));
  }
  for (final m in [
    ...appFlowCommonModules,
    if (hierarchyType.trim().isNotEmpty)
      'hcm-boundary-${hierarchyType.trim().toLowerCase()}',
  ]) {
    if (!modules.contains(m)) modules.add(m);
  }
  return modules.join(',');
}

/// Reads messages from a localisation search response, or a bare list.
List<PreviewMessage> parseMessages(dynamic json) {
  if (json is String) json = jsonDecode(json);
  if (json is Map && json['messages'] is List) json = json['messages'];
  if (json is! List) {
    throw const FormatException('Expected a "messages" list.');
  }
  return [
    for (final m in json)
      if (m is Map && m['code'] != null && m['message'] != null)
        PreviewMessage(
          m['code'].toString(),
          m['message'].toString(),
          // The engines only use messages whose locale equals the screen
          // locale. The preview shows one language, so whatever locale the
          // server stored (en_MZ, fr_MZ, ...) is shown as the preview locale.
          previewLocaleCode,
        ),
  ];
}

/// Locales tried, in order, when the requested one has no messages. DIGIT
/// servers store messages under the campaign's locale (unified-qa: en_MZ).
const _fallbackLocales = ['en_MZ', 'en_IN', 'en_NG', 'pt_MZ', 'fr_MZ'];

/// Where the current messages came from, e.g. "unified-qa.digit.org, tenant
/// qa, en_MZ" (shown to the user).
String? lastMessagesSource;

/// Locale that actually returned messages in the last successful fetch.
String? lastMessagesLocale;

/// Embed mode with no `session.host`: the host page's origin serves the
/// DIGIT APIs (the console's domain, or its dev server's proxy), so requests
/// go there directly even on localhost.
bool useSameOriginApi = false;

/// Served by tool/serve.py on this machine: requests go through its
/// read-only /digit-proxy (DIGIT servers block other origins via CORS).
bool get useDevProxy =>
    !useSameOriginApi && {'127.0.0.1', 'localhost'}.contains(Uri.base.host);

/// Fetches messages; if [locale] has none, tries the usual campaign locales
/// and keeps the first that has messages.
Future<List<PreviewMessage>> fetchMessages({
  required String host,
  required String tenantId,
  required String locale,
  required String modules,
}) async {
  for (final l in [locale, ..._fallbackLocales.where((x) => x != locale)]) {
    final list = await _fetchOnce(
        host: host, tenantId: tenantId, locale: l, modules: modules);
    if (list.isNotEmpty) {
      lastMessagesLocale = l;
      lastMessagesSource =
          '${Uri.tryParse(host)?.host ?? host}, tenant $tenantId, $l';
      return list;
    }
  }
  return const [];
}

/// One call to the DIGIT localisation search, the same read-only endpoint the
/// field worker app uses (`localization/messages/v1/_search`). Fails with a
/// readable message if the server blocks browser requests.
Future<List<PreviewMessage>> _fetchOnce({
  required String host,
  required String tenantId,
  required String locale,
  required String modules,
}) async {
  final base = host.endsWith('/') ? host : '$host/';
  const path = 'localization/messages/v1/_search';
  final query = {'locale': locale, 'module': modules, 'tenantId': tenantId};
  final body = {'RequestInfo': <String, dynamic>{}};

  // Served by tool/serve.py: go through its read-only proxy, because DIGIT
  // servers do not allow pages on other origins to read responses (CORS).
  final local = useDevProxy;
  if (local) {
    try {
      final res = await Dio().post<dynamic>(
        '/digit-proxy/$path',
        queryParameters: query,
        data: body,
        options: Options(headers: {'X-Digit-Upstream': base}),
      );
      return parseMessages(res.data);
    } on DioException catch (e) {
      // 404/405 = plain static server without the proxy; try directly below.
      final status = e.response?.statusCode;
      if (status != 404 && status != 405 && status != 501) {
        throw Exception('Proxy request failed (${status ?? e.type.name}): '
            '${e.response?.data ?? e.message}');
      }
    }
  }

  try {
    final res = await Dio().post<dynamic>(
      '$base$path',
      queryParameters: query,
      data: body,
    );
    return parseMessages(res.data);
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.unknown) {
      throw Exception(
          'The browser could not read from $host: the server does not allow '
          'requests from this page (CORS). Locally, run the preview with '
          '`python3 tool/serve.py` so messages go through its proxy. '
          'Otherwise paste the messages.');
    }
    throw Exception('Server returned ${e.response?.statusCode}: ${e.message}');
  }
}

/// Dialog with two ways to get messages: from a server, or pasted JSON.
Future<List<PreviewMessage>?> showMessagesDialog(
  BuildContext context, {
  PreviewModule? module,
}) {
  return showDialog<List<PreviewMessage>>(
    context: context,
    builder: (_) => _MessagesDialog(module: module),
  );
}

class _MessagesDialog extends StatefulWidget {
  final PreviewModule? module;

  const _MessagesDialog({this.module});

  @override
  State<_MessagesDialog> createState() => _MessagesDialogState();
}

/// Defaults match the field worker app's environment file at the time of
/// writing; override at build time with --dart-define, e.g.
/// `--dart-define=PREVIEW_SERVER=https://unified-uat.digit.org/`.
const _defaultServer = String.fromEnvironment('PREVIEW_SERVER',
    defaultValue: 'https://unified-qa.digit.org/');
const _defaultTenant =
    String.fromEnvironment('PREVIEW_TENANT', defaultValue: 'qa');
const _defaultHierarchy =
    String.fromEnvironment('PREVIEW_HIERARCHY_TYPE', defaultValue: 'NIGERIA');
const _defaultLocale =
    String.fromEnvironment('PREVIEW_LOCALE', defaultValue: 'en_MZ');

/// Server settings: build-time defaults, then the last values used in this
/// browser.
class MessageServerSettings {
  final String host;
  final String tenant;
  final String locale;
  final String hierarchy;

  const MessageServerSettings(this.host, this.tenant, this.locale, this.hierarchy);

  /// Set in embed mode from the host page's session, so every request goes
  /// to the console's server, tenant and locale instead of saved settings.
  static MessageServerSettings? override;

  /// Defaults before anything is saved in this browser.
  ///
  /// Served from a DIGIT domain (next to the campaign console): that domain's
  /// own APIs, and the tenant and locale the console left in this origin's
  /// localStorage (`Employee.tenant-id`, `Employee.locale`). Other servers'
  /// APIs are not reachable from here (CORS). Served by tool/serve.py: the
  /// build-time defaults, through its proxy.
  static MessageServerSettings get pageDefaults {
    final served = Uri.base.isScheme('http') || Uri.base.isScheme('https');
    if (useDevProxy || !served) {
      return const MessageServerSettings(
          _defaultServer, _defaultTenant, _defaultLocale, _defaultHierarchy);
    }
    return MessageServerSettings(
      '${Uri.base.origin}/',
      readBrowserStorage('Employee.tenant-id') ??
          readBrowserStorage('tenant-id') ??
          _defaultTenant,
      readBrowserStorage('Employee.locale') ??
          readBrowserStorage('locale') ??
          _defaultLocale,
      _defaultHierarchy,
    );
  }

  static Future<MessageServerSettings> load() async {
    if (override != null) return override!;
    final d = pageDefaults;
    try {
      final prefs = await SharedPreferences.getInstance();
      return MessageServerSettings(
        prefs.getString('preview.server') ?? d.host,
        prefs.getString('preview.tenant') ?? d.tenant,
        prefs.getString('preview.locale') ?? d.locale,
        prefs.getString('preview.hierarchy') ?? d.hierarchy,
      );
    } catch (_) {
      return d;
    }
  }
}

/// Modules the app loads before login (hcm-login, hcm-common), plus hcm-home
/// for the home screen labels.
const appShellModules = 'hcm-login,hcm-common,hcm-home';

/// Loads [appShellModules] into [store] with the current settings. Failures
/// leave labels showing their keys.
Future<void> loadShellMessagesInto(PreviewMessages store) async {
  try {
    final s = await MessageServerSettings.load();
    store.addAll(await fetchMessages(
      host: s.host,
      tenantId: s.tenant,
      locale: s.locale,
      modules: appShellModules,
    ));
  } catch (e) {
    debugPrint('Preview: could not load app messages: $e');
  }
}

/// `?messages=auto`: fetch the app's modules for [module] with the saved or
/// default server settings.
Future<List<PreviewMessage>> fetchMessagesFor(PreviewModule module) async {
  final s = await MessageServerSettings.load();
  final list = await fetchMessages(
    host: s.host,
    tenantId: s.tenant,
    locale: s.locale,
    modules: guessModules(module, hierarchyType: s.hierarchy),
  );
  if (list.isNotEmpty && lastMessagesLocale != s.locale) {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('preview.locale', lastMessagesLocale!);
    } catch (_) {}
  }
  return list;
}

class _MessagesDialogState extends State<_MessagesDialog> {
  static final _d = MessageServerSettings.pageDefaults;
  final _host = TextEditingController(text: _d.host);
  final _tenant = TextEditingController(text: _d.tenant);
  final _locale = TextEditingController(text: _d.locale);
  final _hierarchy = TextEditingController(text: _d.hierarchy);
  late final _modules = TextEditingController(
      text: guessModules(widget.module, hierarchyType: _d.hierarchy));

  @override
  void initState() {
    super.initState();
    _restore();
  }

  /// Last values used in this browser (kept in localStorage).
  Future<void> _restore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _host.text = prefs.getString('preview.server') ?? _host.text;
      _tenant.text = prefs.getString('preview.tenant') ?? _tenant.text;
      _locale.text = prefs.getString('preview.locale') ?? _locale.text;
      _hierarchy.text = prefs.getString('preview.hierarchy') ?? _hierarchy.text;
      _modules.text =
          guessModules(widget.module, hierarchyType: _hierarchy.text);
    } catch (_) {
      // Storage unavailable (private window): keep the defaults.
    }
  }

  Future<void> _remember() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('preview.server', _host.text.trim());
      await prefs.setString('preview.tenant', _tenant.text.trim());
      await prefs.setString('preview.locale', _locale.text.trim());
      await prefs.setString('preview.hierarchy', _hierarchy.text.trim());
    } catch (_) {}
  }
  final _pasted = TextEditingController();
  String? _error;
  bool _busy = false;

  Future<void> _fromServer() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final messages = await fetchMessages(
        host: _host.text.trim(),
        tenantId: _tenant.text.trim(),
        locale: _locale.text.trim(),
        modules: _modules.text.replaceAll(' ', ''),
      );
      if (messages.isNotEmpty) {
        if (lastMessagesLocale != null) _locale.text = lastMessagesLocale!;
        await _remember();
      }
      if (!mounted) return;
      if (messages.isEmpty) {
        setState(() => _error =
            'The server returned no messages for these modules. Check the '
            'tenant, locale and module names.');
        return;
      }
      Navigator.pop(context, messages);
    } catch (e) {
      setState(() => _error = e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _fromPaste() {
    try {
      Navigator.pop(context, parseMessages(_pasted.text));
    } catch (e) {
      setState(() => _error = 'Could not read the pasted messages: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AlertDialog(
        title: const Text('Localisation messages'),
        content: SizedBox(
          width: 600,
          height: 380,
          child: Column(
            children: [
              const TabBar(tabs: [Tab(text: 'From server'), Tab(text: 'Paste')]),
              const SizedBox(height: 12),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView(
                      children: [
                        TextField(
                            controller: _host,
                            decoration:
                                const InputDecoration(labelText: 'Server')),
                        Row(children: [
                          Expanded(
                              child: TextField(
                                  controller: _tenant,
                                  decoration: const InputDecoration(
                                      labelText: 'Tenant'))),
                          const SizedBox(width: 12),
                          Expanded(
                              child: TextField(
                                  controller: _locale,
                                  decoration: const InputDecoration(
                                      labelText: 'Locale'))),
                        ]),
                        TextField(
                          controller: _hierarchy,
                          decoration: const InputDecoration(
                              labelText: 'Boundary hierarchy type',
                              helperText:
                                  'Adds hcm-boundary-<type>, as the app does.'),
                          onChanged: (v) => _modules.text =
                              guessModules(widget.module, hierarchyType: v),
                        ),
                        TextField(
                          controller: _modules,
                          decoration: const InputDecoration(
                            labelText: 'Modules (comma-separated)',
                            helperText: 'Same modules the app loads for this '
                                'flow; edit if needed.',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FilledButton(
                            onPressed: _busy ? null : _fromServer,
                            child: Text(_busy ? 'Loading…' : 'Load from server'),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _pasted,
                            maxLines: null,
                            expands: true,
                            style: const TextStyle(
                                fontFamily: 'monospace', fontSize: 12),
                            decoration: const InputDecoration(
                              hintText:
                                  'Paste the localisation search response, or '
                                  '[{"code": "...", "message": "...", "locale": "en_IN"}]',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FilledButton(
                              onPressed: _fromPaste,
                              child: const Text('Load pasted messages')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(_error!,
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error)),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close')),
        ],
      ),
    );
  }
}


/// `?config=mdms:<NAME>@<project referenceID>`: the live FormConfig record,
/// read the way the app reads it (HCM-ADMIN-CONSOLE.FormConfig filtered by
/// project), through the local proxy when served by tool/serve.py.
Future<String> fetchConfigFromMdms(String spec) async {
  final m = RegExp(r'^mdms:([^@]+)@(.+)$').firstMatch(spec);
  if (m == null) {
    throw Exception('Use mdms:<NAME>@<project referenceID>, e.g. '
        'mdms:MISSEDCHILDREN@CMP-2026-11-10-011593');
  }
  final name = m.group(1)!, project = m.group(2)!;
  final rows = await mdmsSearch('HCM-ADMIN-CONSOLE.FormConfig',
      filters: {'project': project, 'name': name}, limit: 10);
  final s = await MessageServerSettings.load();
  final match = rows.where((r) => r['name'] == name);
  if (match.isEmpty) {
    throw Exception('No $name config for project $project on ${s.host} (tenant ${s.tenant}).');
  }
  return jsonEncode(match.first);
}


/// One MDMS v2 search through the local proxy (or directly when not served
/// by tool/serve.py). Returns the `data` of active rows, as the app does.
Future<List<Map<String, dynamic>>> mdmsSearch(
  String schemaCode, {
  Map<String, dynamic>? filters,
  int limit = 5000,
  String? tenantId,
}) async {
  final saved = await MessageServerSettings.load();
  // A signed-in tenant takes precedence over the saved setting.
  final s = tenantId == null
      ? saved
      : MessageServerSettings(saved.host, tenantId, saved.locale, saved.hierarchy);
  final base = s.host.endsWith('/') ? s.host : '${s.host}/';
  const path = 'egov-mdms-service/v2/_search';
  final local = useDevProxy;
  final res = await Dio().post<dynamic>(
    local ? '/digit-proxy/$path' : '$base$path',
    data: {
      'MdmsCriteria': {
        'tenantId': s.tenant,
        'schemaCode': schemaCode,
        if (filters != null) 'filters': filters,
        'limit': limit,
        'isActive': true,
      },
    },
    options: Options(headers: local ? {'X-Digit-Upstream': base} : null),
  );
  final rows = (res.data is Map ? res.data['mdms'] : null) as List? ?? [];
  return [
    for (final r in rows)
      if (r is Map && r['isActive'] != false && r['data'] is Map)
        Map<String, dynamic>.from(r['data'] as Map),
  ];
}

/// Same as the app's `enrichFormSchemasWithEnumsForForms`
/// (apps/health_campaign_field_worker_app/lib/blocs/project/project.dart):
/// every node with a two-part `schemaCode` ("MODULE.MASTER") gets its
/// `enums` replaced by the MDMS rows ({code, name ?? code}).
/// Returns the schema codes that were filled and those that failed.
Future<({List<String> filled, List<String> failed})> enrichWithMdmsOptions(
    List<Map<String, dynamic>> flows) async {
  final codes = <String>{};
  void collect(dynamic node) {
    if (node is Map) {
      final code = node['schemaCode'];
      if (code is String && code.split('.').length == 2) codes.add(code);
      node.values.forEach(collect);
    } else if (node is List) {
      node.forEach(collect);
    }
  }

  collect(flows);
  final byCode = <String, List<Map<String, dynamic>>>{};
  final failed = <String>[];
  for (final code in codes) {
    try {
      byCode[code] = await mdmsSearch(code);
    } catch (_) {
      failed.add(code);
    }
  }

  void apply(dynamic node) {
    if (node is Map) {
      final rows = byCode[node['schemaCode']];
      if (rows != null && rows.isNotEmpty) {
        node['enums'] = [
          for (final e in rows) {'code': e['code'], 'name': e['name'] ?? e['code']}
        ];
      }
      node.values.forEach(apply);
    } else if (node is List) {
      node.forEach(apply);
    }
  }

  apply(flows);
  return (
    filled: [for (final e in byCode.entries) if (e.value.isNotEmpty) e.key],
    failed: failed,
  );
}


/// Every FormConfig record created for [projectReferenceId], read the way the
/// app reads them during project sync (HCM-ADMIN-CONSOLE.FormConfig filtered
/// by `project`). Sorted by the console's `order`.
Future<List<Map<String, dynamic>>> fetchProjectConfigs(
  String projectReferenceId, {
  String? tenantId,
}) async {
  final rows = await mdmsSearch('HCM-ADMIN-CONSOLE.FormConfig',
      filters: {'project': projectReferenceId}, limit: 200, tenantId: tenantId);
  num order(Map<String, dynamic> r) => (r['order'] as num?) ?? 9999;
  return rows..sort((a, b) => order(a).compareTo(order(b)));
}
