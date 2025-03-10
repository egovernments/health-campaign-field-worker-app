import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_dss/data/local_store/no_sql/schema/dashboard_config_schema.dart';
import 'package:digit_dss/models/entities/dashboard_response_model.dart';
import 'package:digit_dss/router/dashboard_router.gm.dart';
import 'package:digit_dss/utils/utils.dart';
import 'package:digit_location_tracker/utils/utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sync_service/blocs/sync/sync.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/localization/localization.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/local_store/no_sql/schema/service_registry.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../models/entities/roles_type.dart';
import '../router/app_router.dart';
import '../utils/debound.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/least_level_boundary_singleton.dart';
import '../utils/utils.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/localized.dart';
import '../widgets/showcase/config/showcase_constants.dart';
import '../widgets/showcase/showcase_button.dart';

@RoutePage()
class HomePage extends LocalizedStatefulWidget {
  const HomePage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends LocalizedState<HomePage> {
  bool skipProgressBar = false;
  final storage = const FlutterSecureStorage();
  late StreamSubscription<List<ConnectivityResult>> subscription;
  bool isTriggerLocalisation = true;

  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      if (result.firstOrNull == ConnectivityResult.none) {
        if (context.mounted) {
          context.syncRefresh();
        }
      }
    });
    //// Function to set initial Data required for the packages to run
    setPackagesSingleton(context);
  }

  //  Be sure to cancel subscription after you are done
  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = context.read<AuthBloc>().state;
    final localSecureStore = LocalSecureStore.instance;
    if (state is! AuthAuthenticatedState) {
      return Container();
    }
    final roles = state.userModel.roles.map((e) {
      return e.code;
    });

    if (!(roles.contains(RolesType.distributor.toValue()) ||
        roles.contains(RolesType.registrar.toValue()))) {
      skipProgressBar = true;
    }

    final mappedItems = _getItems(context);

    final homeItems = mappedItems?.homeItems ?? [];
    final showcaseKeys = <GlobalKey>[
      if (!skipProgressBar) homeShowcaseData.distributorProgressBar.showcaseKey,
      ...(mappedItems?.showcaseKeys ?? []),
    ];

    return Scaffold(
      backgroundColor: DigitTheme.instance.colorScheme.surface,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ScrollableContent(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return homeItems.elementAt(index);
                },
                childCount: homeItems.length,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 145,
                childAspectRatio: 104 / 128,
              ),
            ),
          ],
          header: Column(
            children: [
              BackNavigationHelpHeaderWidget(
                showBackNavigation: false,
                showHelp: false,
                showcaseButton: ShowcaseButton(
                  showcaseFor: showcaseKeys.toSet().toList(),
                ),
              ),
            ],
          ),
          footer: Padding(
            padding: const EdgeInsets.only(bottom: spacer2),
            child: PoweredByDigit(
              version: Constants().version,
            ),
          ),
          children: [
            const SizedBox(height: spacer2 * 2),
            // INFO : Need to add sync bloc of package Here
            BlocConsumer<SyncBloc, SyncState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () => null,
                  pendingSync: (count) {
                    final debouncer = Debouncer(seconds: 5);
                    debouncer.run(() async {
                      if (count != 0) {
                        await localSecureStore.setManualSyncTrigger(false);
                        if (context.mounted) {
                          await performBackgroundService(
                            isBackground: false,
                            stopService: false,
                            context: context,
                          );
                        }
                      } else {
                        await localSecureStore.setManualSyncTrigger(true);
                      }
                    });
                  },
                  syncInProgress: () async {
                    await localSecureStore.setManualSyncTrigger(false);
                    if (context.mounted) {
                      DigitSyncDialog.show(
                        context,
                        type: DialogType.inProgress,
                        label: localizations.translate(
                          i18.syncDialog.syncInProgressTitle,
                        ),
                        barrierDismissible: false,
                      );
                    }
                  },
                  completedSync: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    await localSecureStore.setManualSyncTrigger(true);
                    if (context.mounted) {
                      DigitSyncDialog.show(context,
                          type: DialogType.complete,
                          label: localizations.translate(
                            i18.syncDialog.dataSyncedTitle,
                          ),
                          primaryAction: DigitDialogActions(
                            label: localizations.translate(
                              i18.syncDialog.closeButtonLabel,
                            ),
                            action: (ctx) {
                              Navigator.pop(ctx);
                            },
                          ),
                          barrierDismissible: true);
                    }
                  },
                  failedSync: () async {
                    await localSecureStore.setManualSyncTrigger(true);
                    if (context.mounted) {
                      _showSyncFailedDialog(
                        context,
                        message: localizations.translate(
                          i18.syncDialog.syncFailedTitle,
                        ),
                      );
                    }
                  },
                  failedDownSync: () async {
                    await localSecureStore.setManualSyncTrigger(true);
                    if (context.mounted) {
                      _showSyncFailedDialog(
                        context,
                        message: localizations.translate(
                          i18.syncDialog.downSyncFailedTitle,
                        ),
                      );
                    }
                  },
                  failedUpSync: () async {
                    await localSecureStore.setManualSyncTrigger(true);
                    if (context.mounted) {
                      _showSyncFailedDialog(
                        context,
                        message: localizations.translate(
                          i18.syncDialog.upSyncFailedTitle,
                        ),
                      );
                    }
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const Offstage(),
                  pendingSync: (count) {
                    return count == 0
                        ? const Offstage()
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: spacer2,
                            ),
                            child: InfoCard(
                              type: InfoType.info,
                              description: localizations
                                  .translate(i18.home.dataSyncInfoContent)
                                  .replaceAll('{}', count.toString()),
                              title: localizations.translate(
                                i18.home.dataSyncInfoLabel,
                              ),
                            ),
                          );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSyncFailedDialog(
    BuildContext context, {
    required String message,
  }) {
    Navigator.of(context, rootNavigator: true).pop();

    DigitSyncDialog.show(
      context,
      type: DialogType.failed,
      label: message,
      primaryAction: DigitDialogActions(
        label: localizations.translate(
          i18.syncDialog.retryButtonLabel,
        ),
        action: (ctx) {
          Navigator.pop(ctx);
          // Sync Failed Manual Sync is Enabled
          _attemptSyncUp(context);
        },
      ),
      secondaryAction: DigitDialogActions(
        label: localizations.translate(
          i18.syncDialog.closeButtonLabel,
        ),
        action: (ctx) => Navigator.pop(ctx),
      ),
    );
  }

  _HomeItemDataModel? _getItems(BuildContext context) {
    final state = context.read<AuthBloc>().state;
    if (state is! AuthAuthenticatedState) {
      return null;
    }

    final Map<String, Widget> homeItemsMap = {
      // INFO : Need to add home items of package Here

      i18.home.dashboard: homeShowcaseData.dashBoard.buildWith(
        child: HomeItemCard(
          icon: Icons.bar_chart_sharp,
          label: i18.home.dashboard,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(const UserDashboardRoute());
          },
        ),
      ),

      i18.home.syncDataLabel: homeShowcaseData.distributorSyncData.buildWith(
        child: StreamBuilder<Map<String, dynamic>?>(
          stream: FlutterBackgroundService().on('serviceRunning'),
          builder: (context, snapshot) {
            return HomeItemCard(
              icon: Icons.sync_alt,
              label: i18.home.syncDataLabel,
              onPressed: () async {
                if (snapshot.data?['enablesManualSync'] == true) {
                  if (context.mounted) _attemptSyncUp(context);
                } else {
                  if (context.mounted) {
                    Toast.showToast(
                      context,
                      message: localizations
                          .translate(i18.common.coreCommonSyncInProgress),
                      type: ToastType.success,
                    );
                  }
                }
              },
            );
          },
        ),
      ),
      i18.home.db: homeShowcaseData.db.buildWith(
        child: HomeItemCard(
          icon: Icons.table_chart,
          label: i18.home.db,
          onPressed: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DriftDbViewer(
                  context.read<LocalSqlDataStore>(),
                ),
              ),
            );
          },
        ),
      ),
      i18.home.dashboard: homeShowcaseData.dashBoard.buildWith(
        child: HomeItemCard(
          icon: Icons.bar_chart_sharp,
          label: i18.home.dashboard,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            ;
            context.router.push(const UserDashboardRoute());
          },
        ),
      ),
    };

    final Map<String, GlobalKey> homeItemsShowcaseMap = {
      // INFO : Need to add showcase keys of package Here
      i18.home.syncDataLabel: homeShowcaseData.distributorSyncData.showcaseKey,
      i18.home.db: homeShowcaseData.db.showcaseKey,
      i18.home.dashboard: homeShowcaseData.dashBoard.showcaseKey,
      i18.home.clfLabel: homeShowcaseData.clf.showcaseKey,
    };

    final homeItemsLabel = <String>[
      // INFO: Need to add items label of package Here
      i18.home.syncDataLabel,
      i18.home.db,
      i18.home.dashboard,
    ];

    final List<String> filteredLabels = homeItemsLabel
        .where((element) =>
            state.actionsWrapper.actions
                .map((e) => e.displayName)
                .toList()
                .contains(element) ||
            element == i18.home.db)
        .toList();

    final showcaseKeys = filteredLabels
        .where((f) => f != i18.home.db)
        .map((label) => homeItemsShowcaseMap[label]!)
        .toList();

    if (envConfig.variables.envType == EnvType.demo && kReleaseMode) {
      filteredLabels.remove(i18.home.db);
    }

    final List<Widget> widgetList =
        filteredLabels.map((label) => homeItemsMap[label]!).toList();

    return _HomeItemDataModel(
      widgetList,
      showcaseKeys,
    );
  }

  void _attemptSyncUp(BuildContext context) async {
    await LocalSecureStore.instance.setManualSyncTrigger(true);

    if (context.mounted) {
      context.read<SyncBloc>().add(
            SyncSyncUpEvent(
              userId: context.loggedInUserUuid,
              localRepositories: [
                // INFO : Need to add local repo of package Here
                context.read<
                    LocalRepository<IndividualModel, IndividualSearchModel>>(),
                context.read<
                    LocalRepository<UserActionModel, UserActionSearchModel>>()
              ],
              remoteRepositories: [
                // INFO : Need to add repo repo of package Here
                context.read<
                    RemoteRepository<IndividualModel, IndividualSearchModel>>(),
                context.read<
                    RemoteRepository<UserActionModel, UserActionSearchModel>>(),
              ],
            ),
          );
    }
  }

  void triggerLocalization() {
    context.read<AppInitializationBloc>().state.maybeWhen(
          orElse: () {},
          initialized: (
            AppConfiguration appConfiguration,
            _,
            __,
          ) {
            final appConfig = appConfiguration;
            final localizationModulesList = appConfiguration.backendInterface;
            final selectedLocale = AppSharedPreferences().getSelectedLocale;
            LocalizationParams()
                .setCode(LeastLevelBoundarySingleton().boundary);
            context
                .read<LocalizationBloc>()
                .add(LocalizationEvent.onLoadLocalization(
                  module:
                      "${localizationModulesList?.interfaces.where((element) => element.type == Modules.localizationModule).map((e) => e.name.toString()).join(',')}",
                  tenantId: appConfig.tenantId ?? "default",
                  locale: selectedLocale!,
                  path: Constants.localizationApiPath,
                ));
          },
        );
  }
}

// Function to set initial Data required for the packages to run
void setPackagesSingleton(BuildContext context) {
  context.read<AppInitializationBloc>().state.maybeWhen(
      orElse: () {},
      initialized: (
        AppConfiguration appConfiguration,
        List<ServiceRegistry> serviceRegistry,
        List<DashboardConfigSchema?>? dashboardConfigSchema,
      ) {
        final filteredDashboardConfig = filterDashboardConfig(
            dashboardConfigSchema ?? [], context.projectTypeCode ?? "");
        loadLocalization(context, appConfiguration);
        // INFO : Need to add singleton of package Here
        DashboardSingleton().setInitialData(
            projectId: context.projectId,
            tenantId: envConfig.variables.tenantId,
            dashboardConfig: filteredDashboardConfig.firstOrNull,
            appVersion: Constants().version,
            selectedProject: context.selectedProject,
            actionPath: Constants.getEndPoint(
              serviceRegistry: serviceRegistry,
              service: DashboardResponseModel.schemaName.toUpperCase(),
              action: ApiOperation.search.toValue(),
              entityName: DashboardResponseModel.schemaName,
            ));
        LocationTrackerSingleton().setInitialData(
          projectId: context.projectId,
          loggedInUserUuid: context.loggedInUserUuid,
        );
      });
}

void loadLocalization(
    BuildContext context, AppConfiguration appConfiguration) async {
  context.read<LocalizationBloc>().add(
      LocalizationEvent.onUpdateLocalizationIndex(
          index: appConfiguration.languages!.indexWhere((element) =>
              element.value == AppSharedPreferences().getSelectedLocale),
          code: AppSharedPreferences().getSelectedLocale!));
}

class _HomeItemDataModel {
  final List<Widget> homeItems;
  final List<GlobalKey> showcaseKeys;

  const _HomeItemDataModel(this.homeItems, this.showcaseKeys);
}
