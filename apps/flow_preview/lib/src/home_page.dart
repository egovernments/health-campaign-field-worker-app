import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'account_ui.dart';
import 'config_loader.dart';
import 'launcher.dart';
import 'digit_account.dart';
import 'localization.dart';
import 'messages_loader.dart';
import 'records_panel.dart';

/// Start page: load a config (example, paste or `?config=<url>`), then open it
/// in the real flow builder.
class PreviewHomePage extends StatefulWidget {
  const PreviewHomePage({super.key});

  @override
  State<PreviewHomePage> createState() => _PreviewHomePageState();
}

class _PreviewHomePageState extends State<PreviewHomePage> {
  final _configText = TextEditingController();
  List<String> _examples = const [];
  String? _error;
  PreviewModule? _module;
  bool _loading = false;
  Future<void> _messagesLoaded = Future.value();

  @override
  void initState() {
    super.initState();
    _loadExampleList();
    final url = Uri.base.queryParameters['config'];
    if (url != null && url.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadFromUrl(url));
    }
    final messagesUrl = Uri.base.queryParameters['messages'];
    if (messagesUrl != null && messagesUrl.isNotEmpty) {
      _messagesLoaded = Future(() async {
        await WidgetsBinding.instance.endOfFrame;
        await _loadMessagesFromUrl(messagesUrl);
      });
    }
  }

  Future<void> _loadExampleList() async {
    try {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      final examples = manifest
          .listAssets()
          .where((a) => a.startsWith('assets/examples/') && a.endsWith('.json'))
          .toList()
        ..sort();
      if (mounted) setState(() => _examples = examples);
    } catch (_) {
      // No examples bundled; paste and URL loading still work.
    }
  }

  Future<void> _loadExample(String asset) async {
    _setText(await rootBundle.loadString(asset));
  }

  Future<void> _loadFromUrl(String url) async {
    setState(() => _loading = true);
    try {
      if (url.startsWith('mdms:')) {
        _setText(await fetchConfigFromMdms(url));
      } else {
        final res = await Dio().get<String>(url,
            options: Options(responseType: ResponseType.plain));
        _setText(res.data ?? '');
      }
      // `&open=1` opens the flow straight away (used by links from the config
      // agent). Wait for `?messages=` so the first screen is translated.
      final module = _module;
      if (module != null && Uri.base.queryParameters['open'] == '1') {
        await _messagesLoaded;
        if (mounted) await _openWithMdmsOptions(module);
      }
    } catch (e) {
      setState(() => _error = 'Could not load $url: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _setText(String text) {
    _configText.text = text;
    _parse();
  }

  void _parse() {
    setState(() {
      try {
        _module = parseConfig(_configText.text);
        _error = null;
      } on ConfigError catch (e) {
        _module = null;
        _error = e.message;
      }
    });
  }

  /// Opens [module] with the shared launcher (session, MDMS options, CRUD
  /// service), as a home-screen tile does.
  Future<void> _openWithMdmsOptions(PreviewModule module) =>
      launchModule(context, module, onNote: _snack);

  /// Opens one of the project's configs with its messages, as a field
  /// worker would see it.
  Future<void> _openProjectConfig(Map<String, dynamic> config) async {
    _setText(const JsonEncoder.withIndent('  ').convert(config));
    final module = _module;
    if (module == null) return;
    final store = context.read<PreviewMessages>();
    try {
      final list = await fetchMessagesFor(module);
      store.replaceWith(list);
      _snack(_loadedText(list.length));
    } catch (e) {
      _snack('Could not load messages: $e');
    }
    if (mounted) await _openWithMdmsOptions(module);
  }

  Future<void> _signIn() async {
    final account = context.read<DigitAccount>();
    if (!await showSignInDialog(context, account)) return;
    await _chooseProject();
  }

  Future<void> _chooseProject() async {
    final account = context.read<DigitAccount>();
    try {
      final projects = account.projects.isEmpty
          ? await account.loadProjects()
          : account.projects;
      if (!mounted) return;
      ProjectModel? picked;
      final ref = _module?.project;
      picked = projects.where((p) => p.referenceID == ref).firstOrNull;
      picked ??= projects.length == 1
          ? projects.first
          : await showProjectPicker(context, projects);
      if (picked != null) {
        await account.selectProject(picked);
        _snack('Using ${picked.name}.');
      }
    } catch (e) {
      _snack('Could not load projects: $e');
    }
  }

  Future<void> _loadMessages() async {
    final store = context.read<PreviewMessages>();
    final list = await showMessagesDialog(context, module: _module);
    if (list == null) return;
    store.replaceWith(list);
    _snack(_loadedText(list.length));
  }

  String _loadedText(int n) => n == 0
      ? 'No messages found. Check the server, tenant and modules under Messages.'
      : 'Loaded $n messages'
          '${lastMessagesSource == null ? '' : ' ($lastMessagesSource)'}.';

  /// `?messages=<url>`: a localisation search response or a list of
  /// {code, message, locale}, loaded at start-up.
  Future<void> _loadMessagesFromUrl(String url) async {
    final store = context.read<PreviewMessages>();
    try {
      final List<PreviewMessage> list;
      if (url == 'auto') {
        // Wait for ?config= so the modules can be worked out from it.
        while (_module == null && _loading) {
          await Future<void>.delayed(const Duration(milliseconds: 100));
        }
        final module = _module;
        if (module == null) throw Exception('no config loaded');
        list = await fetchMessagesFor(module);
      } else {
        final res = await Dio().get<String>(url,
            options: Options(responseType: ResponseType.plain));
        list = parseMessages(res.data ?? '[]');
      }
      store.replaceWith(list);
      _snack(_loadedText(list.length));
    } catch (e) {
      _snack('Could not load messages from $url: $e');
    }
  }

  void _snack(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  @override
  Widget build(BuildContext context) {
    final module = _module;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HCM flow preview'),
        actions: [
          IconButton(
            tooltip: 'Saved records',
            onPressed: () => showRecordsPanel(context),
            icon: const Icon(Icons.storage_outlined),
          ),
          ValueListenableBuilder<List<PreviewMessage>>(
            valueListenable: context.read<PreviewMessages>(),
            builder: (context, messages, _) {
              final loaded = messages.length - builtInMessages.length;
              return IconButton(
                tooltip: loaded > 0
                    ? 'Messages ($loaded loaded)'
                    : 'Messages (none loaded)',
                onPressed: _loadMessages,
                icon: Badge(
                  isLabelVisible: loaded > 0,
                  label: const Text('✓'),
                  child: const Icon(Icons.translate),
                ),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Paste a flow config, pick an example, or open this page with '
                '?config=<link to a JSON file>. The preview runs the real flow '
                'builder and forms engine with invented sample data. Nothing '
                'leaves your browser and nothing is saved after you close the page.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              AccountCard(
                account: context.read<DigitAccount>(),
                onSignIn: _signIn,
                onChangeProject: _chooseProject,
              ),
              ProjectModules(
                account: context.read<DigitAccount>(),
                onOpen: _openProjectConfig,
              ),
              const SizedBox(height: 16),
              if (_examples.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final e in _examples)
                      ActionChip(
                        label: Text(e.split('/').last.replaceAll('.json', '')),
                        onPressed: () => _loadExample(e),
                      ),
                  ],
                ),
              const SizedBox(height: 12),
              TextField(
                controller: _configText,
                minLines: 12,
                maxLines: 24,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                decoration: const InputDecoration(
                  labelText: 'Flow config (JSON)',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                onChanged: (_) => _parse(),
              ),
              const SizedBox(height: 12),
              if (_loading) const LinearProgressIndicator(),
              if (_error != null)
                Text(_error!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error)),
              if (module != null) ...[
                Text(
                  '${module.name}: ${module.flows.length} screens, starts at '
                  '"${module.initialPage}"',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(module.flowNames.join(' · '),
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FilledButton.icon(
                    onPressed: () => _openWithMdmsOptions(module),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Open preview'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
