import 'dart:async';
import 'dart:convert';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:closed_household/closed_household.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:complaints/complaints.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
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
import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:recase/recase.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';
import 'package:survey_form/survey_form.dart';
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
              skipProgressBar
                  ? const SizedBox.shrink()
                  : homeShowcaseData.distributorProgressBar.buildWith(
                      child: BeneficiaryProgressBar(
                        label: localizations.translate(
                          i18.home.progressIndicatorTitle,
                        ),
                        prefixLabel: localizations.translate(
                          i18.home.progressIndicatorPrefixLabel,
                        ),
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
                            padding: const EdgeInsets.symmetric(
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
      i18.home.fileComplaint:
          homeShowcaseData.distributorFileComplaint.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.fileComplaint,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(const ComplaintsInboxWrapperRoute());
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
            context.router.push(const UserDashboardRoute());
          },
        ),
      ),

      i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.buildWith(
        child: HomeItemCard(
          icon: Icons.all_inbox,
          label: i18.home.beneficiaryLabel,
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final schemaJsonRaw = prefs.getString('app_config_schemas');

            if (schemaJsonRaw != null) {
              final allSchemas =
                  json.decode(schemaJsonRaw) as Map<String, dynamic>;

              final registrationSchemaEntry =
                  allSchemas['REGISTRATIONFLOW'] as Map<String, dynamic>?;
              final deliverySchemaEntry =
                  allSchemas['DELIVERYFLOW'] as Map<String, dynamic>?;

              final registrationSchemaData = registrationSchemaEntry?['data'];
              final deliverySchemaData = deliverySchemaEntry?['data'];

              if (registrationSchemaData != null ||
                  deliverySchemaData != null) {
                // Extract templates from both schemas
                final regTemplatesRaw = registrationSchemaData?['templates'];
                final delTemplatesRaw = deliverySchemaData?['templates'];

                final Map<String, dynamic> regTemplateMap =
                    regTemplatesRaw is Map<String, dynamic>
                        ? regTemplatesRaw
                        : {};

                final Map<String, dynamic> delTemplateMap =
                    delTemplatesRaw is Map<String, dynamic>
                        ? delTemplatesRaw
                        : {};

                final templates = {
                  for (final entry
                      in {...regTemplateMap, ...delTemplateMap}.entries)
                    entry.key: TemplateConfig.fromJson(
                        entry.value as Map<String, dynamic>)
                };

                final registrationConfig = json.encode(registrationSchemaData);
                final deliveryConfig = json.encode(deliverySchemaData);

                RegistrationDeliverySingleton().setTemplateConfigs(templates);
                RegistrationDeliverySingleton()
                    .setRegistrationConfig(registrationConfig);
                RegistrationDeliverySingleton()
                    .setDeliveryConfig(deliveryConfig);
              }

              if (isTriggerLocalisation) {
                final moduleName =
                    'hcm-registrationflow-${context.selectedProject.referenceID},hcm-deliveryflow-${context.selectedProject.referenceID}';
                triggerLocalization(module: moduleName);
                isTriggerLocalisation = false;
              }
            }
            RegistrationDeliverySingleton()
                .setHouseholdType(HouseholdType.family);

            await context.router.push(const RegistrationDeliveryWrapperRoute());
          },
        ),
      ),

      i18.home.clfLabel: homeShowcaseData.clf.buildWith(
        child: HomeItemCard(
          icon: Icons.account_balance,
          label: i18.home.clfLabel,
          onPressed: () async {
            RegistrationDeliverySingleton()
                .setHouseholdType(HouseholdType.community);
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            await context.router.push(const RegistrationDeliveryWrapperRoute());
          },
        ),
      ),

      i18.home.closedHouseHoldLabel: homeShowcaseData.closedHouseHold.buildWith(
        child: HomeItemCard(
          icon: Icons.home,
          enableCustomIcon: true,
          customIconSize: 40,
          customIcon: Constants.closedHouseholdSvg,
          label: i18.home.closedHouseHoldLabel,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(const ClosedHouseholdWrapperRoute());
          },
        ),
      ),
      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.buildWith(
        child: HomeItemCard(
          icon: Icons.store_mall_directory,
          label: i18.home.manageStockLabel,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(ManageStocksRoute());
          },
        ),
      ),
      i18.home.stockReconciliationLabel:
          homeShowcaseData.wareHouseManagerStockReconciliation.buildWith(
        child: HomeItemCard(
          icon: Icons.menu_book,
          label: i18.home.stockReconciliationLabel,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(StockReconciliationRoute());
          },
        ),
      ),
      i18.home.mySurveyForm: homeShowcaseData.supervisorMySurveyForm.buildWith(
        child: HomeItemCard(
          enableCustomIcon: true,
          customIcon: mySurveyFormSvg,
          iconPadding: const EdgeInsets.all(spacer1),
          icon: Icons.checklist,
          customIconSize: spacer8,
          label: i18.home.mySurveyForm,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(SurveyFormWrapperRoute());
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
                if (envConfig.variables.envType == EnvType.qa) {
                  if (context.mounted) _attemptSyncUp(context);
                } else {
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
                }
              },
            );
          },
        ),
      ),
      i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.buildWith(
        child: HomeItemCard(
          icon: Icons.supervised_user_circle_rounded,
          label: i18.home.beneficiaryReferralLabel,
          onPressed: () async {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(SearchReferralReconciliationsRoute());
          },
        ),
      ),
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.viewReportsLabel,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(InventoryReportSelectionRoute());
          },
        ),
      ),
      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.buildWith(
        child: HomeItemCard(
          icon: Icons.fingerprint_outlined,
          label: i18.home.manageAttendanceLabel,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(const ManageAttendanceRoute());
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
            context.router.push(const UserDashboardRoute());
          },
        ),
      ),
      i18.home.beneficiaryIdLabel: homeShowcaseData.beneficiaryId.buildWith(
        child: HomeItemCard(
          label: i18.home.beneficiaryIdLabel,
          onPressed: () {
            if (isTriggerLocalisation) {
              triggerLocalization();
              isTriggerLocalisation = false;
            }
            context.router.push(BeneficiaryIdDownSyncRoute());
          },
          icon: Icons.account_box,
          enableCustomIcon: true,
          customIconSize: spacer9,
          customIcon: Constants.beneficiaryIdDownload,
        ),
      ),
    };

    final Map<String, GlobalKey> homeItemsShowcaseMap = {
      // INFO : Need to add showcase keys of package Here
      i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.showcaseKey,
      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.showcaseKey,
      i18.home.stockReconciliationLabel:
          homeShowcaseData.wareHouseManagerStockReconciliation.showcaseKey,
      i18.home.mySurveyForm:
          homeShowcaseData.supervisorMySurveyForm.showcaseKey,
      i18.home.fileComplaint:
          homeShowcaseData.distributorFileComplaint.showcaseKey,
      i18.home.syncDataLabel: homeShowcaseData.distributorSyncData.showcaseKey,
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.showcaseKey,
      i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.showcaseKey,
      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.showcaseKey,
      i18.home.db: homeShowcaseData.db.showcaseKey,
      i18.home.closedHouseHoldLabel:
          homeShowcaseData.closedHouseHold.showcaseKey,
      i18.home.dashboard: homeShowcaseData.dashBoard.showcaseKey,
      i18.home.clfLabel: homeShowcaseData.clf.showcaseKey,
      i18.home.beneficiaryIdLabel: homeShowcaseData.beneficiaryId.showcaseKey,
    };

    final homeItemsLabel = <String>[
      // INFO: Need to add items label of package Here
      i18.home.beneficiaryLabel,
      i18.home.clfLabel,
      i18.home.closedHouseHoldLabel,
      i18.home.manageStockLabel,
      i18.home.stockReconciliationLabel,
      i18.home.mySurveyForm,
      i18.home.fileComplaint,
      i18.home.syncDataLabel,
      i18.home.viewReportsLabel,
      i18.home.beneficiaryReferralLabel,
      i18.home.manageAttendanceLabel,
      i18.home.dashboard,
      i18.home.beneficiaryIdLabel,
      i18.home.db,
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
                    LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(),
                context.read<
                    LocalRepository<IndividualModel, IndividualSearchModel>>(),
                context.read<
                    LocalRepository<HouseholdModel, HouseholdSearchModel>>(),
                context.read<
                    LocalRepository<ProjectBeneficiaryModel,
                        ProjectBeneficiarySearchModel>>(),
                context.read<
                    LocalRepository<HouseholdMemberModel,
                        HouseholdMemberSearchModel>>(),
                context.read<LocalRepository<TaskModel, TaskSearchModel>>(),
                context.read<
                    LocalRepository<SideEffectModel, SideEffectSearchModel>>(),
                context.read<
                    LocalRepository<ReferralModel, ReferralSearchModel>>(),
                context
                    .read<LocalRepository<ServiceModel, ServiceSearchModel>>(),
                context.read<LocalRepository<StockModel, StockSearchModel>>(),
                context.read<
                    LocalRepository<StockReconciliationModel,
                        StockReconciliationSearchModel>>(),
                context.read<
                    LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(),
                context.read<
                    LocalRepository<HFReferralModel, HFReferralSearchModel>>(),
                context.read<
                    LocalRepository<AttendanceLogModel,
                        AttendanceLogSearchModel>>(),
                context.read<
                    LocalRepository<UserActionModel, UserActionSearchModel>>(),
                context
                    .read<LocalRepository<ServiceModel, ServiceSearchModel>>(),
              ],
              remoteRepositories: [
                // INFO : Need to add repo repo of package Here
                context.read<
                    RemoteRepository<IndividualModel, IndividualSearchModel>>(),
                context.read<
                    RemoteRepository<HouseholdModel, HouseholdSearchModel>>(),
                context.read<
                    RemoteRepository<ProjectBeneficiaryModel,
                        ProjectBeneficiarySearchModel>>(),
                context.read<
                    RemoteRepository<HouseholdMemberModel,
                        HouseholdMemberSearchModel>>(),
                context.read<RemoteRepository<TaskModel, TaskSearchModel>>(),
                context.read<
                    RemoteRepository<SideEffectModel, SideEffectSearchModel>>(),
                context.read<
                    RemoteRepository<ReferralModel, ReferralSearchModel>>(),
                context
                    .read<RemoteRepository<ServiceModel, ServiceSearchModel>>(),
                context.read<RemoteRepository<StockModel, StockSearchModel>>(),
                context.read<
                    RemoteRepository<StockReconciliationModel,
                        StockReconciliationSearchModel>>(),
                context.read<
                    RemoteRepository<PgrServiceModel, PgrServiceSearchModel>>(),
                context.read<
                    RemoteRepository<HFReferralModel, HFReferralSearchModel>>(),
                context.read<
                    RemoteRepository<AttendanceLogModel,
                        AttendanceLogSearchModel>>(),
                context.read<
                    RemoteRepository<UserActionModel, UserActionSearchModel>>(),
                context
                    .read<RemoteRepository<ServiceModel, ServiceSearchModel>>(),
              ],
            ),
          );
    }
  }

  void triggerLocalization({String? module, bool? loadOnline}) {
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
            if (loadOnline == true) {
              context
                  .read<LocalizationBloc>()
                  .add(LocalizationEvent.onRemoteLoadLocalization(
                    module: module ??
                        "${localizationModulesList?.interfaces.where((element) => element.type == Modules.localizationModule).map((e) => e.name.toString()).join(',')}",
                    tenantId: envConfig.variables.tenantId,
                    locale: selectedLocale!,
                    path: Constants.localizationApiPath,
                  ));
            } else {
              context
                  .read<LocalizationBloc>()
                  .add(LocalizationEvent.onLoadLocalization(
                    module: module ??
                        "${localizationModulesList?.interfaces.where((element) => element.type == Modules.localizationModule).map((e) => e.name.toString()).join(',')}",
                    tenantId: envConfig.variables.tenantId,
                    locale: selectedLocale!,
                    path: Constants.localizationApiPath,
                  ));
            }
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
        ComplaintsSingleton().setInitialData(
          tenantId: envConfig.variables.tenantId,
          loggedInUserUuid: context.loggedInUserUuid,
          userMobileNumber: context.loggedInUser.mobileNumber,
          loggedInUserName: context.loggedInUser.name,
          complaintTypes:
              appConfiguration.complaintTypes!.map((e) => e.code).toList(),
          userName: context.loggedInUser.name ?? '',
        );

        RegistrationDeliverySingleton().setInitialData(
          beneficiaryIdMinCount:
              appConfiguration.beneficiaryIdConfig?.first.minCount.toInt(),
          beneficiaryIdBatchSize:
              appConfiguration.beneficiaryIdConfig?.first.batchSize.toInt(),
          loggedInUser: context.loggedInUserModel,
          loggedInUserUuid: context.loggedInUserUuid,
          maxRadius: appConfiguration.maxRadius!,
          projectId: context.projectId,
          selectedBeneficiaryType: context.beneficiaryType,
          projectType: context.selectedProjectType,
          selectedProject: context.selectedProject,
          genderOptions:
              appConfiguration.genderOptions!.map((e) => e.code).toList(),
          idTypeOptions:
              appConfiguration.idTypeOptions!.map((e) => e.code).toList(),
          memberRelationTypeOptions: appConfiguration.relationShipTypeOptions!
              .map((e) => e.code)
              .toList(),
          householdDeletionReasonOptions: appConfiguration
              .householdDeletionReasonOptions!
              .map((e) => e.code)
              .toList(),
          householdMemberDeletionReasonOptions: appConfiguration
              .householdMemberDeletionReasonOptions!
              .map((e) => e.code)
              .toList(),
          deliveryCommentOptions: appConfiguration.deliveryCommentOptions!
              .map((e) => e.code)
              .toList(),
          symptomsTypes: appConfiguration.symptomsTypes
              ?.where((e) => e.active)
              .map((e) => e.code)
              .toList(),
          searchHouseHoldFilter: appConfiguration.searchHouseHoldFilters != null
              ? appConfiguration.searchHouseHoldFilters!
                  .where((e) => e.active)
                  .map((e) => e.code)
                  .toList()
              : [],
          searchCLFFilters: appConfiguration.searchCLFFilters != null
              ? appConfiguration.searchCLFFilters!
                  .where((e) => e.active)
                  .map((e) => e.code)
                  .toList()
              : [],
          referralReasons: appConfiguration.referralReasons
              ?.where((e) => e.active)
              .map((e) => e.code)
              .toList(),
          houseStructureTypes: appConfiguration.houseStructureTypes
              ?.where((e) => e.active)
              .map((e) => e.code)
              .toList(),
          refusalReasons: appConfiguration.refusalReasons
              ?.where((e) => e.active)
              .map((e) => e.code)
              .toList(),
        );

        ClosedHouseholdSingleton().setInitialData(
          loggedInUserUuid: context.loggedInUserUuid,
          projectId: context.projectId,
          beneficiaryType: context.beneficiaryType,
        );

        AttendanceSingleton().setInitialData(
          projectId: context.projectId,
          loggedInIndividualId: context.loggedInIndividualId ?? '',
          loggedInUserUuid: context.loggedInUserUuid,
          appVersion: Constants().version,
        );

        SurveyFormSingleton().setInitialData(
          projectId: context.projectId,
          projectName: context.selectedProject.name,
          loggedInIndividualId: context.loggedInIndividualId ?? '',
          loggedInUserUuid: context.loggedInUserUuid,
          appVersion: Constants().version,
          roles: context.read<AuthBloc>().state.maybeMap(
              orElse: () => const Offstage(),
              authenticated: (res) {
                return res.userModel.roles
                    .map((e) => e.code.snakeCase.toUpperCase())
                    .toList();
              }),
        );

        ReferralReconSingleton().setInitialData(
          userName: context.loggedInUser.name ?? '',
          userUUid: context.loggedInUserUuid,
          projectId: context.selectedProject.id,
          projectName: context.selectedProject.name,
          roleCode: RolesType.healthFacilityWorker.toValue(),
          appVersion: Constants().version,
          tenantId: envConfig.variables.tenantId,
          validIndividualAgeForCampaign: ValidIndividualAgeForCampaign(
            validMinAge: context.selectedProjectType?.validMinAge ?? 3,
            validMaxAge: context.selectedProjectType?.validMaxAge ?? 64,
          ),
          genderOptions:
              appConfiguration.genderOptions?.map((e) => e.code).toList() ?? [],
          cycles: context.cycles,
          referralReasons: appConfiguration.referralReasons
                  ?.where((e) => e.active)
                  .map((e) => e.code)
                  .toList() ??
              [],
          checklistTypes:
              appConfiguration.checklistTypes?.map((e) => e.code).toList() ??
                  [],
        );

        InventorySingleton().setInitialData(
          isWareHouseMgr: context.loggedInUserRoles
              .where(
                  (role) => role.code == RolesType.warehouseManager.toValue())
              .toList()
              .isNotEmpty,
          isDistributor: context.loggedInUserRoles
              .where(
                (role) => role.code == RolesType.distributor.toValue(),
              )
              .toList()
              .isNotEmpty,
          loggedInUser: context.loggedInUserModel,
          projectId: context.projectId,
          loggedInUserUuid: context.loggedInUserUuid,
          transportTypes: appConfiguration.transportTypes
              ?.map((e) => InventoryTransportTypes()
                ..name = e.code
                ..code = e.code)
              .toList(),
        );
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
