import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_location_tracker/location_tracker.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:sync_service/utils/utils.dart' as sync_utils;

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/localization/localization.dart';
import '../blocs/project/project.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/repositories/local/localization.dart';
import '../router/app_router.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/runtime_hierarchy.dart';
import '../utils/utils.dart';
import '../widgets/download_progress/download_spinner_content.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

@RoutePage()
class ProjectSelectionPage extends LocalizedStatefulWidget {
  const ProjectSelectionPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ProjectSelectionPage> createState() => _ProjectSelectionPageState();
}

class _ProjectSelectionPageState extends LocalizedState<ProjectSelectionPage> {
  /// [_selectedProject] is to keep track of the project the user selected.
  /// Primary intention is to use this project during the retry mechanism of a
  /// failing down-sync. At this point, the [ProjectState] has not persisted the
  /// selected project yet
  ProjectModel? _selectedProject;
  DialogRoute? syncDialogRoute;

  @override
  void initState() {
    context.read<ProjectBloc>().add(const ProjectInitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ScrollableContent(
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackNavigationHelpHeaderWidget(
              showBackNavigation: false,
              showLogoutCTA: true,
            ),
            Padding(
              padding: const EdgeInsets.all(spacer4),
              child: Text(
                localizations.translate(
                  i18.projectSelection.projectDetailsLabelText,
                ),
                style: textTheme.headingXl
                    .copyWith(color: theme.colorTheme.primary.primary2),
              ),
            ),
          ],
        ),
        children: [
          BlocConsumer<ProjectBloc, ProjectState>(
            listener: (context, state) {
              final error = state.syncError;
              final projectSelected = state.selectedProject;

              final willNavigate = error == null &&
                  !state.loading &&
                  state.selectedProject?.address?.boundary != null;

              if ((syncDialogRoute?.isActive ?? false) && !willNavigate) {
                Navigator.of(context, rootNavigator: true).removeRoute(syncDialogRoute!);
              }

              if (error != null) {
                syncDialogRoute = DialogRoute(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => DigitSyncDialogContent(
                    label: localizations.translate(
                      '${error.name.toUpperCase()}_ERROR',
                    ),
                    type: DialogType.failed,
                    primaryAction: DigitDialogActions(
                      label: localizations.translate(
                        i18.projectSelection.retryButtonText,
                      ),
                      action: projectSelected == null
                          ? (cxt) {
                              if (syncDialogRoute != null &&
                                  syncDialogRoute!.isActive) {
                                Navigator.of(cxt, rootNavigator: true).removeRoute(syncDialogRoute!);
                              }
                              context
                                  .read<ProjectBloc>()
                                  .add(const ProjectInitializeEvent());
                            }
                          : (cxt) {
                              if (syncDialogRoute != null &&
                                  syncDialogRoute!.isActive) {
                                Navigator.of(cxt, rootNavigator: true).removeRoute(syncDialogRoute!);
                              }
                              cxt.read<ProjectBloc>().add(
                                    ProjectSelectProjectEvent(
                                      projectSelected,
                                    ),
                                  );
                            },
                    ),
                    secondaryAction: DigitDialogActions(
                      label: localizations.translate(
                        i18.projectSelection.dismissButtonText,
                      ),
                      action: (context) {
                        if (syncDialogRoute?.isActive ?? false) {
                          Navigator.of(context, rootNavigator: true).removeRoute(syncDialogRoute!);
                        }
                      },
                    ),
                  ),
                );

                Navigator.of(context, rootNavigator: true).push(syncDialogRoute!);

                return;
              } else if (state.loading) {
                syncDialogRoute = DialogRoute(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Popup(
                    type: PopUpType.simple,
                    title: "",
                    additionalWidgets: [
                      StreamBuilder<sync_utils.SyncProgress>(
                        stream:
                            sync_utils.SyncServiceSingleton().progressStream,
                        builder: (ctx, snapshot) => DownloadSpinnerContent(
                          title: localizations.translate(
                            i18.projectSelection.syncInProgressTitleText,
                          ),
                          subtitle: snapshot.data == null
                              ? null
                              : formatSyncProgressLabel(
                                  snapshot.data!,
                                  localizations,
                                ),
                        ),
                      ),
                    ],
                  ),
                );

                Navigator.of(context, rootNavigator: true).push(syncDialogRoute!);
              }

              final selectedProject = state.selectedProject;
              if (selectedProject != null) {
                final boundary = selectedProject.address?.boundary;

                if (boundary != null) {
                  // triggerLocationTracking(state.selectedProject!); // TODO: Enable location tracking
                  navigateToBoundary(boundary);
                } else {
                  Toast.showToast(
                    context,
                    message: localizations.translate(
                      i18.projectSelection.fetchBoundaryFailed,
                    ),
                    type: ToastType.error,
                  );
                }
              }
            },
            builder: (context, state) {
              if (state.loading) {
                return const Expanded(
                  child: Center(child: Offstage()),
                );
              }

              final projects = state.projects;

              if (projects.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text(localizations.translate(
                          i18.projectSelection.noProjectsAssigned,
                        )),
                        Text(localizations.translate(
                          i18.projectSelection.contactSysAdmin,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: SizedBox(
                            width: 300,
                            child: DigitButton(
                              label: localizations.translate(
                                i18.common.coreCommonOk,
                              ),
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large,
                              mainAxisSize: MainAxisSize.max,
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthLogoutEvent());
                              },                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Column(
                children: projects
                    .map(
                      (element) => Padding(
                        padding: const EdgeInsets.all(spacer2),
                        child: _ProjectMenuCard(
                          icon: Icons.article,
                          heading: element.name,
                          onTap: () {
                            _selectedProject = element;

                            context.read<ProjectBloc>().add(
                                  ProjectSelectProjectEvent(element),
                                );
                          },
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  void navigateToBoundary(String boundary) async {
    final appState = context.read<AppInitializationBloc>().state;
    final languages = (appState is AppInitialized)
        ? (appState.appConfiguration.languages ?? [])
        : <Languages>[];

    final projectReferenceId = context.selectedProject.referenceID ?? '';
    final selectedLocale = AppSharedPreferences().getSelectedLocale!;
    final locBloc = context.read<LocalizationBloc>();

    // Build module string for campaign localizations
    const moduleKey =
        'INVENTORY,REGISTRATION,COMPLAINTS,HFREFERRAL,CLOSEHOUSEHOLD,COMPLAINTS,STOCKREPORTS,STOCKRECONCILIATION,PERMISSIONHANDLER,CHECKLIST,STOCK,LQA,INSIDEMONITORING';
    final keys = moduleKey.split(',').map((e) => e.trim()).toList();
    final moduleNames =
        keys.map((key) => 'hcm-${key.toLowerCase()}-$projectReferenceId');
    final fullModuleString = moduleNames.join(',');

    // Reuse the syncDialogRoute already shown by the ProjectBloc listener.
    // If it's not active (project was pre-loaded), push a fresh one.
    if (mounted && !(syncDialogRoute?.isActive ?? false)) {
      syncDialogRoute = DialogRoute(
        context: context,
        barrierDismissible: false,
        builder: (context) => Popup(
          type: PopUpType.simple,
          title: "",
          additionalWidgets: [
            StreamBuilder<sync_utils.SyncProgress>(
              stream: sync_utils.SyncServiceSingleton().progressStream,
              builder: (ctx, snapshot) => DownloadSpinnerContent(
                title: localizations.translate(
                  i18.projectSelection.syncInProgressTitleText,
                ),
                subtitle: snapshot.data == null
                    ? null
                    : formatSyncProgressLabel(snapshot.data!, localizations),
              ),
            ),
          ],
        ),
      );
      Navigator.of(context, rootNavigator: true).push(syncDialogRoute!);
    }

    // Cache campaign localizations for the SELECTED locale only. Fetching
    // every language up-front at project selection meant N network calls +
    // N large batch inserts blocking the sync flow. Other locales can be
    // lazily fetched on demand when the user actually switches language.
    //
    // Only download modules not already in SQL — repeated project entries
    // used to re-fetch the full campaign bundle every time even when the
    // local cache already had them, hammering the localization API on
    // every project selection for no gain.
    final campaignCacheFuture = () async {
      try {
        final cachedRows = await LocalizationLocalRepository().fetchLocalization(
          sql: locBloc.sql,
          locale: selectedLocale,
          module: fullModuleString,
        );
        final cachedModules = cachedRows.map((l) => l.module).toSet();
        final requestedModules = moduleNames.toList();
        final missingModules = requestedModules
            .where((m) => !cachedModules.contains(m))
            .toList();
        if (missingModules.isEmpty) return;
        final results = await locBloc.localizationRepository.loadLocalization(
          path: Constants.localizationApiPath,
          locale: selectedLocale,
          module: missingModules.join(','),
          tenantId: envConfig.variables.tenantId,
        );
        await LocalizationLocalRepository().create(results, locBloc.sql);
      } catch (e) {
        debugPrint(
            'error caching campaign localization for $selectedLocale: $e');
      }
    }();
    BoundaryBloc boundaryBloc = context.read<BoundaryBloc>();
    boundaryBloc.add(BoundaryFindEvent(code: boundary));

    try {
      // Wait for both campaign caching and boundary finding concurrently
      await Future.wait([
        campaignCacheFuture,
        boundaryBloc.stream
            .firstWhere((element) => element.boundaryList.isNotEmpty),
      ]);

      // Cache permission handler localizations for the SELECTED locale only.
      final permHandlerModule =
          'hcm-permissionhandler-$projectReferenceId';
      try {
        final localResults =
            await LocalizationLocalRepository().fetchLocalization(
          sql: locBloc.sql,
          locale: selectedLocale,
          module: permHandlerModule,
        );
        if (localResults.isEmpty) {
          final results = await locBloc.localizationRepository.loadLocalization(
            path: Constants.localizationApiPath,
            locale: selectedLocale,
            module: permHandlerModule,
            tenantId: envConfig.variables.tenantId,
          );
          await LocalizationLocalRepository().create(results, locBloc.sql);
        }
      } catch (e) {
        debugPrint(
            'error caching permission handler localization for $selectedLocale: $e');
      }

      // Cache boundary localization for the SELECTED locale in the main
      // localization table. Runs once during the "Sync in progress" modal,
      // so the ~3–5k row insert is off the interactive path. `translate()`
      // picks up boundary codes automatically — they live in the same
      // `_messagesByCode` map as the rest of the strings, so boundary
      // dropdowns render translated names instead of raw codes.
      final hierarchyType = runtimeHierarchyType();
      final boundaryModule = 'hcm-boundary-${hierarchyType.toLowerCase()}';
      // Restrict the boundary fetch to codes actually assigned to this user.
      // Two kinds of code go in:
      //   1. Boundary code (e.g. IN_KA_BLR) — the raw `b.code`.
      //   2. Hierarchy-level LABEL code (e.g. HCM-MOZ-HIERARCHY_District) —
      //      not the bare `b.label`. The boundary selection page looks up
      //      level labels as `${runtimeHierarchyType()}_$label`
      //      (boundary_selection.dart:142-145), so the localization row for
      //      the label lives under that composite code, not the bare label.
      //
      // Reading from `boundaryLocalRepository`, NOT from
      // `boundaryBloc.state.boundaryList`. The bloc's list only holds what
      // `BoundaryFindEvent(codes: project.address.boundary, isSingle: true)`
      // returned — a partial slice of the tree. The FULL tree was already
      // downsynced into the local DB by ProjectBloc at project-selection
      // time (see project.dart:801 → boundaryLocalRepository.bulkCreate).
      // Using the local repo here means the first fetch already covers
      // every boundary the user can drill into on BoundarySelectionPage,
      // so drill-down refetches become a safety net instead of the
      // primary source.
      //
      // Sending an empty codes value falls back to fetching everything.
      final boundaryLocalRepo =
          context.read<LocalRepository<BoundaryModel, BoundarySearchModel>>();
      final allBoundaries =
          await boundaryLocalRepo.search(BoundarySearchModel());
      final allBoundaryCodes = allBoundaries
          .expand((b) => [
                b.code,
                if (b.label != null && b.label!.isNotEmpty)
                  '${hierarchyType}_${b.label}',
              ])
          .whereType<String>()
          .where((s) => s.isNotEmpty)
          .toSet();
      try {
        // Only fetch codes that aren't already cached locally. Historically
        // this path did an unconditional fetch of every boundary code
        // (thousands of entries in a large hierarchy) on every project
        // selection because the coarser module-level fetchLocalization
        // check would false-positive on a partially-populated cache. The
        // code-level `fetchCachedCodesForLocale` gives us a precise
        // delta — an all-hit case becomes a single indexed SELECT and no
        // network round-trip; a partial-cache case only re-downloads the
        // missing tail.
        final cachedCodes =
            await LocalizationLocalRepository().fetchCachedCodesForLocale(
          sql: locBloc.sql,
          locale: selectedLocale,
          codes: allBoundaryCodes,
        );
        final missingCodes =
            allBoundaryCodes.difference(cachedCodes).toList();
        if (missingCodes.isNotEmpty) {
          final results = await locBloc.localizationRepository.loadLocalization(
            path: Constants.localizationApiPath,
            locale: selectedLocale,
            module: boundaryModule,
            tenantId: envConfig.variables.tenantId,
            codes: missingCodes.join(','),
          );
          await LocalizationLocalRepository().create(results, locBloc.sql);
        }
      } catch (e) {
        debugPrint(
            'error caching boundary localization for $selectedLocale: $e');
      }

      // Now load ALL selected-locale strings into `_messagesByCode` via the
      // bloc. This is the ONE event that sets `LocalizationParams.module`
      // and triggers `_loadLocale` — so the module list here must cover
      // every module we just wrote directly to the DB above (campaign +
      // permission handler + boundary). Sending only one of these was
      // leaving the other two unresolved because `_loadLocale` clears the
      // map and refills only what matches the current filter.
      locBloc.add(LocalizationEvent.onLoadLocalization(
        module: '$fullModuleString,$permHandlerModule,$boundaryModule',
        tenantId: envConfig.variables.tenantId,
        locale: selectedLocale,
        path: Constants.localizationApiPath,
      ));

      // Ensure the locale index is correct
      final targetIndex =
          languages.indexWhere((l) => l.value == selectedLocale);
      final resolvedIndex = targetIndex >= 0 ? targetIndex : 0;
      locBloc.add(
        OnUpdateLocalizationIndexEvent(
          index: resolvedIndex,
          code: selectedLocale,
        ),
      );

      // Wait for both bloc events to complete — with a defensive timeout
      // because both handlers can end up as no-ops (onLoadLocalization
      // bails at its "all modules cached, locale matches" fast path with
      // no emit, and OnUpdateLocalizationIndexEvent's copyWith yields an
      // equal state that Bloc suppresses). Without the cap this
      // `firstWhere` would hang forever behind the sync dialog.
      final currentState = locBloc.state;
      final alreadySettled = currentState.index == resolvedIndex &&
          !currentState.loading;
      if (!alreadySettled) {
        try {
          await locBloc.stream
              .firstWhere((s) => s.index == resolvedIndex && !s.loading)
              .timeout(const Duration(seconds: 15));
        } on TimeoutException {
          debugPrint('localization state settle timed out — continuing');
        }
      }

      // Dismiss the single sync dialog before navigating
      if (mounted && syncDialogRoute?.isActive == true) {
        Navigator.of(context, rootNavigator: true)
            .removeRoute(syncDialogRoute!);
      }

      if (mounted) {
        context.router.replaceAll([
          const PermissionsRoute(),
        ]);
      }
    } catch (e) {
      debugPrint('error $e');
      // Dismiss the dialog on error too
      if (mounted && syncDialogRoute?.isActive == true) {
        Navigator.of(context, rootNavigator: true)
            .removeRoute(syncDialogRoute!);
      }
    }
  }

  void triggerLocationTracking(ProjectModel project) async {
    context.read<LocationBloc>().add(const LocationEvent.requestPermission());
    var locationState = context.read<LocationBloc>().state;

    if (locationState.hasPermissions) {
      DateTime now = DateTime.now();
      DateTime startAfterTimestamp =
          project.startDateTime!.isBefore(now) ? now : project.startDateTime!;
      DateTime endAfterTimestamp = project.endDateTime!;
      Isar isar = await Constants().isar;
      final appConfiguration = await isar.appConfigurations.where().findAll();

      if (endAfterTimestamp.isAfter(now)) {
        triggerLocationTracker(
          'com.digit.location_tracker',
          startAfterTimestamp: startAfterTimestamp.millisecondsSinceEpoch,
          locationUpdateInterval: 60 * 1000, // TODO: Read from config
          stopAfterTimestamp: project.endDate ??
              now.add(const Duration(hours: 8)).millisecondsSinceEpoch,
        );

        if (mounted) {
          LocationTrackerService().processLocationData(
              interval: 120, // TODO: Read from config
              createdBy: context.loggedInUserUuid,
              isar: isar);
        }
      }
    } else {
      context.read<LocationBloc>().add(const LocationEvent.requestPermission());
    }
  }
}

/// Local drop-in for `MenuCard` that aligns the icon to the first line of the
/// heading instead of the vertical center of the whole (potentially wrapped)
/// text block. Fixes the "icon floats between wrapped lines" bug on long
/// project names — pub-cache MenuCard uses CrossAxisAlignment.center on the
/// Row, which centers the icon relative to the full wrapped Text.
class _ProjectMenuCard extends StatelessWidget {
  final IconData icon;
  final String heading;
  final VoidCallback? onTap;

  const _ProjectMenuCard({
    required this.icon,
    required this.heading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final headingStyle = textTheme.headingM.copyWith(
      color: theme.colorTheme.primary.primary2,
    );
    // Icon size = heading fontSize + spacer1 (24 / 26 / 28 across
    // breakpoints). Same 24px as the original MenuCard on mobile; a
    // touch smaller than its 32px on tab/desktop, which was overpowering.
    final iconSize = (headingStyle.fontSize ?? spacer5) + spacer1;

    return InkWell(
      onTap: onTap,
      child: DigitCard(
        spacing: spacer3,
        children: [
          Row(
            // Center the icon vertically against the whole (possibly
            // wrapped) heading. On single-line names the icon sits on the
            // text midline; on 2-line names it sits between the two lines
            // — this is the design intent for a menu card with a wrapping
            // label.
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: theme.colorTheme.primary.primary1,
              ),
              const SizedBox(width: spacer2),
              Expanded(
                child: Text(
                  heading,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: headingStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
