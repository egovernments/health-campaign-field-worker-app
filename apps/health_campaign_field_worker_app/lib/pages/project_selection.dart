import 'package:digit_data_model/data_model.dart';
import 'package:digit_location_tracker/location_tracker.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

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

              if (syncDialogRoute?.isActive ?? false) {
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
                  builder: (context) => DigitSyncDialogContent(
                    type: DialogType.inProgress,
                    label: localizations.translate(
                      i18.projectSelection.syncInProgressTitleText,
                    ),
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
                        child: MenuCard(
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

    // Build module string for campaign localizations
    const moduleKey =
        'INVENTORY,REGISTRATION,COMPLAINTS,HFREFERRAL,CLOSEHOUSEHOLD,COMPLAINTS,STOCKREPORTS,STOCKRECONCILIATION,PERMISSIONHANDLER,CHECKLIST,STOCK,LQA,INSIDEMONITORING';
    final keys = moduleKey.split(',').map((e) => e.trim()).toList();
    final moduleNames =
        keys.map((key) => 'hcm-${key.toLowerCase()}-$projectReferenceId');
    final fullModuleString = moduleNames.join(',');

    final selectedLocale = AppSharedPreferences().getSelectedLocale!;
    final locBloc = context.read<LocalizationBloc>();

    // Show loading dialog while localizations are being cached
    DialogRoute? localizationDialogRoute;
    if (mounted) {
      localizationDialogRoute = DialogRoute(
        context: context,
        barrierDismissible: false,
        builder: (context) => DigitSyncDialogContent(
          type: DialogType.inProgress,
          label: localizations.translate(
            i18.projectSelection.syncInProgressTitleText,
          ),
        ),
      );
      Navigator.of(context, rootNavigator: true)
          .push(localizationDialogRoute);
    }

    // Cache campaign localizations for ALL locales directly to DB.
    final campaignCacheFuture = Future.wait(languages.map((language) async {
      try {
        final results = await locBloc.localizationRepository.loadLocalization(
          path: Constants.localizationApiPath,
          locale: language.value,
          module: fullModuleString,
          tenantId: envConfig.variables.tenantId,
        );
        await LocalizationLocalRepository().create(results, locBloc.sql);
      } catch (e) {
        debugPrint(
            'error caching campaign localization for ${language.value}: $e');
      }
    }));
    BoundaryBloc boundaryBloc = context.read<BoundaryBloc>();
    boundaryBloc.add(BoundaryFindEvent(code: boundary));

    try {
      // Wait for both campaign caching and boundary finding concurrently
      await Future.wait([
        campaignCacheFuture,
        boundaryBloc.stream
            .firstWhere((element) => element.boundaryList.isNotEmpty),
      ]);

      // Cache permission handler localizations for ALL locales directly to DB
      final permHandlerModule =
          'hcm-permissionhandler-$projectReferenceId';
      await Future.wait(languages.map((language) async {
        try {
          final localResults =
              await LocalizationLocalRepository().fetchLocalization(
            sql: locBloc.sql,
            locale: language.value,
            module: permHandlerModule,
          );
          if (localResults.isEmpty) {
            final results =
                await locBloc.localizationRepository.loadLocalization(
              path: Constants.localizationApiPath,
              locale: language.value,
              module: permHandlerModule,
              tenantId: envConfig.variables.tenantId,
            );
            await LocalizationLocalRepository().create(results, locBloc.sql);
          }
        } catch (e) {
          debugPrint(
              'error caching permission handler localization for ${language.value}: $e');
        }
      }));

      // Now load the selected locale's permission handler strings via the bloc.
      locBloc.add(LocalizationEvent.onLoadLocalization(
        module: permHandlerModule,
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

      // Wait for both bloc events to complete.
      await locBloc.stream.firstWhere(
        (s) => s.index == resolvedIndex && !s.loading,
      );

      // Dismiss the loading dialog before navigating
      if (mounted && localizationDialogRoute?.isActive == true) {
        Navigator.of(context, rootNavigator: true)
            .removeRoute(localizationDialogRoute!);
      }

      if (mounted) {
        context.router.replaceAll([
          const PermissionsRoute(),
        ]);
      }
    } catch (e) {
      debugPrint('error $e');
      // Dismiss the loading dialog on error too
      if (mounted && localizationDialogRoute?.isActive == true) {
        Navigator.of(context, rootNavigator: true)
            .removeRoute(localizationDialogRoute!);
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
