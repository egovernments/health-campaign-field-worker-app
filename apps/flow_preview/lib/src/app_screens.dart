// App-like screens for the preview: login, project selection and home, built
// with the same DIGIT UI components, texts (localisation keys) and layout as
// the field worker app (apps/health_campaign_field_worker_app/lib/pages/
// login.dart, project_selection.dart, home.dart, widgets/home/
// home_item_card.dart), so reviewers see what field workers see.
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config_loader.dart';
import 'digit_account.dart';
import 'embed/embed.dart';
import 'launcher.dart';
import 'localization.dart';
import 'messages_loader.dart';
import 'router.dart';

const _previewVersion = 'preview';

/// The app's pre-login messages (hcm-login, hcm-common, hcm-home).
Future<void> _loadShellMessages(BuildContext context) =>
    loadShellMessagesInto(context.read<PreviewMessages>());

String _t(BuildContext context, String key) =>
    context.read<PreviewMessages>().translate(key);

void _toast(BuildContext context, String message, {bool error = true}) {
  Toast.showToast(context,
      message: message, type: error ? ToastType.error : ToastType.success);
}

/// Header like the app's BackNavigationHelpHeaderWidget: back on the left,
/// logout on the right.
class _AppHeader extends StatelessWidget {
  final bool showBack;
  final bool showLogout;

  const _AppHeader({this.showBack = false, this.showLogout = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(spacer4, spacer4, spacer4, 0),
      child: Row(children: [
        if (showBack && context.router.canPop())
          DigitBackButton(
            digitBackButtonThemeData:
                const DigitBackButtonThemeData().copyWith(
              context: context,
              backDigitButtonIcon: Icon(
                Icons.arrow_left,
                size: MediaQuery.of(context).size.width < 500
                    ? Theme.of(context).spacerTheme.spacer5
                    : Theme.of(context).spacerTheme.spacer6,
                color: Theme.of(context).colorTheme.primary.primary2,
              ),
            ),
            handleBack: () => context.router.maybePop(),
            label: _t(context, 'CORE_COMMON_BACK'),
          ),
        const Spacer(),
        // In the console the session is the console's; no logout here.
        if (showLogout && !isEmbedded)
          DigitButton(
            label: _t(context, 'CORE_COMMON_LOGOUT'),
            prefixIcon: Icons.logout_outlined,
            onPressed: () {
              context.read<DigitAccount>().signOut();
              context.router.replaceAll([const AppLoginRoute()]);
            },
            type: DigitButtonType.tertiary,
            size: DigitButtonSize.medium,
            capitalizeLetters: false,
          ),
      ]),
    );
  }
}

/// Start page: the app-like login, or the developer page for `?config=`
/// links.
class PreviewEntryPage extends StatefulWidget {
  const PreviewEntryPage({super.key});

  @override
  State<PreviewEntryPage> createState() => _PreviewEntryPageState();
}

class _PreviewEntryPageState extends State<PreviewEntryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final q = Uri.base.queryParameters;
      final account = context.read<DigitAccount>();
      if (isEmbedded) {
        context.router.replace(const EmbedRoute());
      } else if (q.containsKey('config') || q['tools'] == '1') {
        context.router.replace(const PreviewHomeRoute());
      } else if (account.signedIn && account.project != null) {
        context.router.replace(const AppHomeRoute());
      } else {
        context.router.replace(const AppLoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
}

/// Same layout as the app's LoginPage.
class AppLoginPage extends StatefulWidget {
  const AppLoginPage({super.key});

  @override
  State<AppLoginPage> createState() => _AppLoginPageState();
}

class _AppLoginPageState extends State<AppLoginPage> {
  String _userId = '';
  String _password = '';
  String? _userError, _passwordError;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _loadShellMessages(context);
  }

  Future<void> _login() async {
    setState(() {
      _userError = _userId.trim().isEmpty
          ? _t(context, 'USER_ID_PLACEHOLDER_IS_REQUIRED')
          : null;
      _passwordError = _password.isEmpty
          ? _t(context, 'PASSWORD_PLACEHOLDER_IS_REQUIRED')
          : null;
    });
    if (_userError != null || _passwordError != null) return;
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _busy = true);
    final account = context.read<DigitAccount>();
    try {
      await account.signIn(username: _userId.trim(), password: _password.trim());
      _password = '';
      if (!mounted) return;
      await account.loadProjects();
      if (mounted) context.router.replace(const AppProjectsRoute());
    } catch (e) {
      if (mounted) {
        _toast(context, e.toString().replaceFirst('Exception: ', ''));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.colorTheme.paper.primary,
        backgroundColor: theme.colorTheme.primary.primary2,
        actions: [
          IconButton(
            tooltip: 'Developer tools (paste or link a config)',
            icon: const Icon(Icons.developer_mode),
            onPressed: () => context.router.push(const PreviewHomeRoute()),
          ),
        ],
      ),
      body: ScrollableContent(
        children: [
          DigitCard(
            margin: const EdgeInsets.all(spacer2),
            children: [
              Text(
                _t(context, 'LOGIN_LABEL_TEXT'),
                style: textTheme.headingXl
                    .copyWith(color: theme.colorTheme.primary.primary2),
              ),
              LabeledField(
                label: _t(context, 'USER_ID_PLACEHOLDER'),
                capitalizedFirstLetter: false,
                isRequired: true,
                child: DigitTextFormInput(
                  keyboardType: TextInputType.text,
                  errorMessage: _userError,
                  onChange: (v) => _userId = v,
                ),
              ),
              LabeledField(
                label: _t(context, 'PASSWORD_PLACEHOLDER'),
                isRequired: true,
                child: DigitPasswordFormInput(
                  errorMessage: _passwordError,
                  keyboardType: TextInputType.text,
                  onChange: (v) => _password = v,
                ),
              ),
              DigitButton(
                label: _busy
                    ? '${_t(context, 'LOGIN_ACTION_LABEL')}…'
                    : _t(context, 'LOGIN_ACTION_LABEL'),
                type: DigitButtonType.primary,
                onPressed: _busy ? () {} : _login,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
              ),
              DigitButton(
                label: _t(context, 'FORGOT_PASSWORD_ACTION_LABEL'),
                capitalizeLetters: false,
                mainAxisSize: MainAxisSize.max,
                type: DigitButtonType.tertiary,
                size: DigitButtonSize.medium,
                onPressed: () => _toast(
                    context, _t(context, 'FORGOT_PASSWORD_CONTENT_TEXT'),
                    error: false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Same layout as the app's ProjectSelectionPage.
class AppProjectsPage extends StatefulWidget {
  const AppProjectsPage({super.key});

  @override
  State<AppProjectsPage> createState() => _AppProjectsPageState();
}

class _AppProjectsPageState extends State<AppProjectsPage> {
  bool _busy = false;

  Future<void> _select(ProjectModel p) async {
    setState(() => _busy = true);
    try {
      await context.read<DigitAccount>().selectProject(p);
      if (mounted) context.router.replace(const AppBoundaryRoute());
    } catch (e) {
      if (mounted) _toast(context, 'Could not open ${p.name}: $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final projects = context.read<DigitAccount>().projects;
    return Scaffold(
      body: ScrollableContent(
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _AppHeader(),
            Padding(
              padding: const EdgeInsets.all(spacer4),
              child: Text(
                _t(context, 'PROJECT_DETAILS_LABEL'),
                style: textTheme.headingXl
                    .copyWith(color: theme.colorTheme.primary.primary2),
              ),
            ),
          ],
        ),
        children: [
          if (_busy) const LinearProgressIndicator(),
          if (projects.isEmpty)
            Padding(
              padding: const EdgeInsets.all(spacer4),
              child: Text(_t(context, 'NO_PROJECTS_ASSIGNED'),
                  style: textTheme.bodyL),
            ),
          for (final p in projects)
            Padding(
              padding: const EdgeInsets.all(spacer2),
              child: _ProjectMenuCard(
                heading: p.name,
                onTap: _busy ? null : () => _select(p),
              ),
            ),
        ],
      ),
    );
  }
}

/// Same as the app's _ProjectMenuCard.
class _ProjectMenuCard extends StatelessWidget {
  final String heading;
  final VoidCallback? onTap;

  const _ProjectMenuCard({required this.heading, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme
        .digitTextTheme(context)
        .headingM
        .copyWith(color: theme.colorTheme.primary.primary2);
    final iconSize = (headingStyle.fontSize ?? spacer5) + spacer1;
    return InkWell(
      onTap: onTap,
      child: DigitCard(
        spacing: spacer3,
        children: [
          Row(children: [
            Icon(Icons.article,
                size: iconSize, color: theme.colorTheme.primary.primary1),
            const SizedBox(width: spacer3),
            Expanded(child: Text(heading, style: headingStyle)),
          ]),
        ],
      ),
    );
  }
}

/// Icon and label the app's home screen uses for each module
/// (apps/health_campaign_field_worker_app/lib/pages/home.dart). Modules the
/// app doesn't map get a generic tile with HOME_<NAME>_LABEL.
const Map<String, (IconData, String)> _moduleTiles = {
  'REGISTRATION': (Icons.all_inbox, 'HOME_BENEFICIARY_LABEL'),
  'HOUSEHOLDSTRATEGY': (Icons.vaccines, 'HOME_POLIO_REGISTRATION_LABEL'),
  'MISSEDCHILDREN': (Icons.child_care, 'HOME_POLIO_MISSED_CHILDREN_LABEL'),
  'CLOSEHOUSEHOLD': (Icons.home, 'HOME_CLOSE_HOUSEHOLD_LABEL'),
  'CLOSEDHOUSEHOLD': (Icons.home, 'HOME_CLOSE_HOUSEHOLD_LABEL'),
  'COMPLAINTS': (Icons.announcement, 'HOME_FILE_COMPLAINT'),
  'LQA': (Icons.checklist, 'HOME_POLIO_LQA_DATA_COLLECTION_LABEL'),
  'INSIDEMONITORING': (Icons.home_work, 'HOME_POLIO_INSIDE_MONITORING_LABEL'),
  'STOCK': (Icons.store_mall_directory, 'HOME_MANAGE_STOCK_LABEL'),
  'INVENTORY': (Icons.store_mall_directory, 'HOME_MANAGE_STOCK_LABEL'),
  'STOCKRECONCILIATION': (Icons.menu_book, 'HOME_STOCK_RECONCILIATION_LABEL'),
  'STOCKREPORTS': (Icons.announcement, 'HOME_VIEW_REPORTS_LABEL'),
  'INVENTORYREPORTS': (Icons.announcement, 'HOME_VIEW_REPORTS_LABEL'),
  'HFREFERRAL': (
    Icons.supervised_user_circle_rounded,
    'HOME_BENEFICIARY_REFERRAL_LABEL'
  ),
  'ATTENDANCE': (Icons.fingerprint_outlined, 'HOME_MANAGE_ATTENDANCE_LABEL'),
};

/// Configs that are app pages, not home-screen modules.
const _notHomeModules = {'PERMISSIONHANDLER'};

/// Same layout as the app's HomePage: header, a grid of module tiles and
/// "Powered by DIGIT".
class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  /// Like the app: a tile first asks to confirm the current boundary
  /// (CurrentBoundaryPage), which then opens the module.
  Future<void> _open(BuildContext context, Map<String, dynamic> config) async {
    final PreviewModule module;
    try {
      module = parseConfig(jsonEncode(config));
    } on ConfigError catch (e) {
      _toast(context, e.message);
      return;
    }
    _pendingModule = module;
    context.router.push(const AppCurrentBoundaryRoute());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final account = context.read<DigitAccount>();
    final width = MediaQuery.of(context).size.width;
    return ListenableBuilder(
      listenable: account,
      builder: (context, _) {
        final configs = account.homeConfigs
            .where((c) =>
                !_notHomeModules.contains(c['name']) &&
                c['disabled'] != true &&
                c['flows'] is List &&
                (c['flows'] as List).isNotEmpty)
            .toList();
        return Scaffold(
          backgroundColor: theme.colorTheme.generic.background,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ScrollableContent(
              header: Column(children: [
                const _AppHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: spacer4, vertical: spacer2),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        '${account.project?.name ?? ''}'
                        '${account.boundary?.name != null ? ' · ${account.boundary!.name}' : ''}',
                        style: textTheme.bodyS,
                      ),
                    ),
                    if (account.loadingConfigs)
                      const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2)),
                  ]),
                ),
              ]),
              footer: const Padding(
                padding: EdgeInsets.only(bottom: spacer2),
                child: PoweredByDigit(version: _previewVersion),
              ),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(
                      left: spacer2, right: spacer2, top: spacer2),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final c = configs[i];
                        final name = (c['name'] ?? '').toString();
                        final tile = _moduleTiles[name.toUpperCase()] ??
                            (Icons.apps, 'HOME_${name.toUpperCase()}_LABEL');
                        final label = _t(context, tile.$2);
                        return _HomeItemCard(
                          icon: tile.$1,
                          // Unknown label key: show the module name instead.
                          label: label == tile.$2 && !_moduleTiles.containsKey(name.toUpperCase())
                              ? name
                              : label,
                          onPressed: () => _open(context, c),
                        );
                      },
                      childCount: configs.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width < 600
                          ? 3
                          : (width / 176).floor().clamp(3, 8),
                      childAspectRatio: 104 / 128,
                      mainAxisSpacing: spacer3,
                      crossAxisSpacing: spacer3,
                    ),
                  ),
                ),
              ],
              children: [
                if (account.configsError != null)
                  Padding(
                    padding: const EdgeInsets.all(spacer4),
                    child: Text(account.configsError!,
                        style: textTheme.bodyS
                            .copyWith(color: theme.colorTheme.alert.error)),
                  ),
                if (!account.loadingConfigs &&
                    account.configsError == null &&
                    configs.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(spacer4),
                    child: Text('No modules are configured for this project.',
                        style: textTheme.bodyS),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Same look as the app's HomeItemCard.
class _HomeItemCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const _HomeItemCard({required this.icon, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Material(
      color: theme.colorTheme.paper.primary,
      borderRadius: BorderRadius.circular(radius4),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius4),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorTheme.paper.primary,
            borderRadius: BorderRadius.circular(radius4),
            boxShadow: [
              BoxShadow(
                color: theme.colorTheme.text.primary.withOpacity(.16),
                offset: const Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: spacer2, vertical: spacer3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: spacer12,
                child: Center(
                  child: Icon(icon,
                      color: onPressed == null
                          ? theme.disabledColor
                          : theme.colorTheme.primary.primary1,
                      size: 40),
                ),
              ),
              const SizedBox(height: spacer2),
              SizedBox(
                height: spacer12,
                child: Center(
                  child: Text(label,
                      style: textTheme.bodyS,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/// Same layout and rules as the app's BoundarySelectionPage: a card
/// "Choose boundaries" with one required dropdown per hierarchy level, each
/// listing the boundaries under the level above, labelled
/// `<HIERARCHY>_<level>`, names translated from their codes; Submit sets the
/// lowest choice as the working boundary. (The app's beneficiary download and
/// sync dialogs on this screen are not part of the preview.)
class AppBoundaryPage extends StatefulWidget {
  const AppBoundaryPage({super.key});

  @override
  State<AppBoundaryPage> createState() => _AppBoundaryPageState();
}

class _AppBoundaryPageState extends State<AppBoundaryPage> {
  final Map<String, BoundaryModel> _selected = {};
  bool _submitted = false;

  DigitAccount get _account => context.read<DigitAccount>();

  String get _hierarchy =>
      (_account.project?.additionalDetails?.hierarchyType ??
              _account.hierarchyType ??
              'ADMIN')
          .toUpperCase();

  /// Hierarchy levels present under the project, top first.
  List<String> get _levels {
    final byLevel = <String, int>{};
    for (final b in _account.boundaryTree) {
      final label = b.label;
      if (label == null) continue;
      final depth = b.materializedPathList.length;
      byLevel[label] = byLevel.containsKey(label)
          ? (byLevel[label]! < depth ? byLevel[label]! : depth)
          : depth;
    }
    return byLevel.keys.toList()
      ..sort((a, b) => byLevel[a]!.compareTo(byLevel[b]!));
  }

  List<BoundaryModel> _itemsFor(int index, List<String> levels) {
    final label = levels[index];
    return _account.boundaryTree.where((b) {
      if (b.label != label) return false;
      if (index == 0) return true;
      final parent = _selected[levels[index - 1]];
      return parent != null && b.materializedPathList.contains(parent.code);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _loadBoundaryMessages();
    WidgetsBinding.instance.addPostFrameCallback((_) => _autoSelect());
  }

  /// Boundary names and level labels live in hcm-boundary-<hierarchy>, which
  /// the app loads with every module.
  Future<void> _loadBoundaryMessages() async {
    final store = context.read<PreviewMessages>();
    try {
      final s = await MessageServerSettings.load();
      store.addAll(await fetchMessages(
        host: s.host,
        tenantId: _account.tenantId ?? s.tenant,
        locale: lastMessagesLocale ?? s.locale,
        modules: 'hcm-boundary-${_hierarchy.toLowerCase()}',
      ));
    } catch (_) {
      // Names fall back to codes.
    }
  }

  /// Levels with a single choice (always the top one) are picked for you.
  void _autoSelect() {
    final levels = _levels;
    setState(() {
      for (var i = 0; i < levels.length; i++) {
        if (_selected.containsKey(levels[i])) continue;
        final items = _itemsFor(i, levels);
        if (items.length == 1) {
          _selected[levels[i]] = items.first;
        } else {
          break;
        }
      }
    });
  }

  void _pick(int index, List<String> levels, BoundaryModel b) {
    if (_selected[levels[index]]?.code == b.code) return;
    setState(() {
      _selected[levels[index]] = b;
      for (var i = index + 1; i < levels.length; i++) {
        _selected.remove(levels[i]);
      }
    });
    _autoSelect();
  }

  void _submit(List<String> levels) {
    setState(() => _submitted = true);
    final missing = [
      for (var i = 0; i < levels.length; i++)
        if (!_selected.containsKey(levels[i]) &&
            _itemsFor(i, levels).isNotEmpty)
          levels[i]
    ];
    if (missing.isNotEmpty) {
      _toast(context, _t(context, 'CORE_COMMON_REQUIRED'));
      return;
    }
    BoundaryModel? lowest;
    for (final l in levels) {
      lowest = _selected[l] ?? lowest;
    }
    if (lowest != null) _account.selectBoundary(lowest);
    // Opened from "Choose another boundary": go back to it. Otherwise this is
    // the step after project selection: go home.
    if (context.router.canPop()) {
      context.router.maybePop();
    } else {
      context.router.replace(const AppHomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final levels = _levels;
    return Scaffold(
      body: ScrollableContent(
        header: const _AppHeader(),
        footer: DigitCard(
          margin: const EdgeInsets.only(top: spacer2),
          children: [
            DigitButton(
              mainAxisSize: MainAxisSize.max,
              label: _t(context, 'CORE_COMMON_SUBMIT'),
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              onPressed: () => _submit(levels),
            ),
          ],
        ),
        children: [
          DigitCard(
            margin: const EdgeInsets.all(spacer2),
            children: [
              Text(
                _t(context, 'CORE_COMMON_CHOOSE_BOUNDARIES'),
                style: textTheme.headingXl
                    .copyWith(color: theme.colorTheme.primary.primary2),
              ),
              if (levels.isEmpty)
                Text(
                  'No boundaries were found under this project\'s boundary '
                  '(${_account.project?.address?.boundary ?? '-'}). Submit to '
                  'continue with the project boundary.',
                  style: textTheme.bodyS,
                ),
              for (var i = 0; i < levels.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: spacer2),
                  child: _levelField(context, i, levels),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _levelField(BuildContext context, int i, List<String> levels) {
    final items = _itemsFor(i, levels);
    final selected = _selected[levels[i]];
    final disabled = i != 0 && _selected[levels[i - 1]] == null;
    String name(BoundaryModel b) => _t(context, b.code ?? '');
    return LabeledField(
      capitalizedFirstLetter: false,
      label: _t(context, '${_hierarchy}_${levels[i]}'),
      isRequired: true,
      child: DigitDropdown<BoundaryModel>(
        key: ValueKey('${levels[i]}-${_selected[i == 0 ? levels[0] : levels[i - 1]]?.code}'),
        onTap: () {},
        isDisabled: disabled,
        sentenceCaseEnabled: false,
        emptyItemText: _t(context, 'NO_OPTIONS_AVAILABLE'),
        errorMessage: _submitted && selected == null && items.isNotEmpty
            ? _t(context, 'CORE_COMMON_REQUIRED')
            : null,
        selectedOption: selected == null
            ? null
            : DropdownItem(name: name(selected), code: selected.code ?? ''),
        items: [
          for (final b in items) DropdownItem(name: name(b), code: b.code ?? ''),
        ],
        onSelect: (value) {
          final b = items.firstWhere((e) => e.code == value.code);
          _pick(i, levels, b);
        },
      ),
    );
  }
}


/// The module a home tile asked to open, waiting for the boundary to be
/// confirmed.
PreviewModule? _pendingModule;

/// Same as the app's CurrentBoundaryPage: "Select current boundary" with the
/// chosen boundary as a card (tap to continue into the module) and "Choose
/// another boundary".
class AppCurrentBoundaryPage extends StatelessWidget {
  const AppCurrentBoundaryPage({super.key});

  Future<void> _continue(BuildContext context) async {
    final module = _pendingModule;
    if (module == null) {
      context.router.maybePop();
      return;
    }
    await launchModule(context, module,
        loadMessages: true, onNote: (m) => _toast(context, m));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final account = context.read<DigitAccount>();
    return ListenableBuilder(
      listenable: account,
      builder: (context, _) {
        final boundary = account.boundary;
        // Layout copied from the app's pages/current_boundary.dart.
        return Scaffold(
          body: ScrollableContent(
            header: const _AppHeader(showBack: true, showLogout: false),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: spacer4, right: spacer4, top: spacer2, bottom: spacer4),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _t(context, 'CORE_COMMON_SELECT_CURRENT_BOUNDARY'),
                    style: textTheme.headingXl
                        .copyWith(color: theme.colorTheme.primary.primary2),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              if (boundary != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacer4),
                  child: InkWell(
                    onTap: () => _continue(context),
                    child: DigitCard(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(_t(context, boundary.code ?? 'No Value'),
                                style: textTheme.headingM.copyWith(
                                    color: theme.colorTheme.text.primary)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: theme.colorTheme.primary.primary1,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(Icons.arrow_forward,
                                color: theme.colorTheme.paper.primary),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(spacer4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: spacer2),
                    Text(
                      _t(context, 'CORE_COMMON_WANT_TO_CHOOSE_ANOTHER_BOUNDARY'),
                      style: textTheme.headingS
                          .copyWith(color: theme.colorTheme.primary.primary2),
                    ),
                    const SizedBox(height: spacer2),
                    DigitButton(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      type: DigitButtonType.secondary,
                      size: DigitButtonSize.medium,
                      prefixIcon: Icons.location_on_outlined,
                      label: _t(context, 'CORE_COMMON_CHOOSE_ANOTHER_BOUNDARY'),
                      onPressed: () =>
                          context.router.push(const AppBoundaryRoute()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
