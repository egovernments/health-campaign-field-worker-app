import 'dart:async';

import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inventory_management/models/entities/inventory_transport_type.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:registration_delivery/blocs/search_households/search_bloc_common_wrapper.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:registration_delivery/widgets/progress_bar/beneficiary_progress.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/attendance/hcm_attendance_bloc.dart';
import '../blocs/auth/auth.dart';
import '../blocs/inventory/hcm_inventory_bloc.dart';
import '../blocs/referral_reconciliation/hcm_referral_reconciliation_bloc.dart';
import '../blocs/sync/sync.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/local_store/secure_store/secure_store.dart';
// import '../models/entities/hcm_attendance_log_model.dart';
// import '../models/entities/hcm_attendance_model.dart';
import '../models/entities/hcm_hf_referral.dart';
import '../models/entities/roles_type.dart';
import '../router/app_router.dart';
import '../utils/debound.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
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
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resSyncBlocult) async {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult != ConnectivityResult.none) {
        if (context.mounted) {
          context
              .read<SyncBloc>()
              .add(SyncRefreshEvent(context.loggedInUserUuid));
        }
      }
    });
    setRegistrationDeliverySingleton(context);
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

    //[TODO: Add below roles to enum]
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
      backgroundColor: DigitTheme.instance.colorScheme.background,
      body: BlocListener<SyncBloc, SyncState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
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
          );
        },
        child: SizedBox(
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
            footer: PoweredByDigit(
              version: Constants().version,
            ),
            children: [
              const SizedBox(height: kPadding * 2),
              BlocConsumer<SyncBloc, SyncState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () => null,
                    syncInProgress: () async {
                      await localSecureStore.setManualSyncTrigger(false);
                      if (context.mounted) {
                        DigitSyncDialog.show(
                          context,
                          type: DigitSyncDialogType.inProgress,
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
                        DigitSyncDialog.show(
                          context,
                          type: DigitSyncDialogType.complete,
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
                        );
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
                          : DigitInfoCard(
                              icon: Icons.info,
                              backgroundColor:
                                  theme.colorScheme.tertiaryContainer,
                              iconColor: theme.colorScheme.surfaceTint,
                              description: localizations
                                  .translate(i18.home.dataSyncInfoContent)
                                  .replaceAll('{}', count.toString()),
                              title: localizations.translate(
                                i18.home.dataSyncInfoLabel,
                              ),
                            );
                    },
                  );
                },
              ),
            ],
          ),
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
      type: DigitSyncDialogType.failed,
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
      i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.buildWith(
        child: HomeItemCard(
          icon: Icons.all_inbox,
          label: i18.home.beneficiaryLabel,
          onPressed: () async {
            final searchBloc = context.read<SearchBlocWrapper>();
            await context.router.push(
              SearchBeneficiaryRoute(),
            );
            searchBloc.searchHouseholdsBloc
                .add(const SearchHouseholdsClearEvent());
          },
        ),
      ),
      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.buildWith(
        child: HomeItemCard(
          icon: Icons.store_mall_directory,
          label: i18.home.manageStockLabel,
          onPressed: () {
            context.read<AppInitializationBloc>().state.maybeWhen(
                  orElse: () {},
                  initialized: (AppConfiguration appConfiguration, _) {
                    context.router.push(ManageStocksRoute(
                      isWareHouseMgr: context.loggedInUserRoles
                          .where((role) =>
                              role.code == RolesType.warehouseManager.toValue())
                          .toList()
                          .isNotEmpty,
                      isDistributor: context.loggedInUserRoles
                          .where(
                            (role) =>
                                role.code == RolesType.distributor.toValue(),
                          )
                          .toList()
                          .isNotEmpty,
                      boundaryName: context.boundary.name!,
                      inventoryListener: HcmInventoryBloc(
                        context: context,
                        userId: context.loggedInUserUuid,
                        individualId: context.loggedInIndividualId,
                        projectId: context.projectId,
                        stockLocalRepository: context.read<
                            LocalRepository<StockModel, StockSearchModel>>(),
                        stockReconLocalRepository: context.read<
                            LocalRepository<StockReconciliationModel,
                                StockReconciliationSearchModel>>(),
                      ),
                      projectId: context.projectId,
                      userId: context.loggedInUserUuid,
                      transportType: appConfiguration.transportTypes
                          ?.map((e) => InventoryTransportTypes()
                            ..name = e.name
                            ..code = e.code)
                          .toList(),
                    ));
                  },
                );
          },
        ),
      ),
      i18.home.stockReconciliationLabel:
          homeShowcaseData.wareHouseManagerStockReconciliation.buildWith(
        child: HomeItemCard(
          icon: Icons.menu_book,
          label: i18.home.stockReconciliationLabel,
          onPressed: () {
            context.router.push(StockReconciliationRoute(
              inventoryListener: HcmInventoryBloc(
                context: context,
                userId: context.loggedInUserUuid,
                individualId: context.loggedInIndividualId,
                projectId: context.projectId,
                stockLocalRepository: context
                    .read<LocalRepository<StockModel, StockSearchModel>>(),
                stockReconLocalRepository: context.read<
                    LocalRepository<StockReconciliationModel,
                        StockReconciliationSearchModel>>(),
              ),
              projectId: context.projectId,
              isDistributor: context.loggedInUserRoles
                  .where(
                    (role) => role.code == RolesType.distributor.toValue(),
                  )
                  .toList()
                  .isNotEmpty,
              isWareHouseMgr: context.loggedInUserRoles
                  .where(
                    (role) => role.code == RolesType.warehouseManager.toValue(),
                  )
                  .toList()
                  .isNotEmpty,
              loggedInUserUuid: context.loggedInUserUuid,
            ));
          },
        ),
      ),
      i18.home.myCheckList: homeShowcaseData.supervisorMyChecklist.buildWith(
        child: HomeItemCard(
          enableCustomIcon: true,
          customIcon: myChecklistSvg,
          icon: Icons.checklist,
          label: i18.home.myCheckList,
          onPressed: () => context.router.push(ChecklistWrapperRoute()),
        ),
      ),
      i18.home.fileComplaint:
          homeShowcaseData.distributorFileComplaint.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.fileComplaint,
          onPressed: () =>
              context.router.push(const ComplaintsInboxWrapperRoute()),
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
                    DigitToast.show(
                      context,
                      options: DigitToastOptions(
                        localizations
                            .translate(i18.common.coreCommonSyncInProgress),
                        false,
                        Theme.of(context),
                      ),
                    );
                  }
                }
              },
            );
          },
        ),
      ),
      i18.home.beneficiaryReferralLabel:
          homeShowcaseData.beneficiaryReferral.buildWith(
        child: HomeItemCard(
          icon: Icons.supervised_user_circle_rounded,
          label: i18.home.beneficiaryReferralLabel,
          onPressed: () async {
            context.read<AppInitializationBloc>().state.maybeWhen(
                  orElse: () {},
                  initialized: (AppConfiguration appConfiguration, _) {
                    context.router.push(SearchReferralReconciliationsRoute(
                      projectId: context.projectId,
                      cycles: context.cycles,
                      referralReconListener: HcmReferralReconBloc(
                        context: context,
                        userName: context.loggedInUser.name ?? '',
                        userId: context.loggedInUserUuid,
                        tenantId: envConfig.variables.tenantId,
                        selectedProject: context.selectedProject,
                        hfReferralLocalRepository: context.read<
                            LocalRepository<HcmHFReferralModel,
                                HcmHFReferralSearchModel>>(),
                        serviceDefinitionLocalRepository: context.read<
                            LocalRepository<ServiceDefinitionModel,
                                ServiceDefinitionSearchModel>>(),
                        serviceLocalRepository: context.read<
                            LocalRepository<ServiceModel,
                                ServiceSearchModel>>(),
                        checklistTypes: appConfiguration.checklistTypes
                                ?.map((e) => e.code)
                                .toList() ??
                            [],
                      ),
                      validIndividualAgeForCampaign:
                          ValidIndividualAgeForCampaign(
                        validMinAge:
                            context.selectedProjectType?.validMinAge ?? 0,
                        validMaxAge:
                            context.selectedProjectType?.validMaxAge ?? 64,
                      ),
                      referralReasons: appConfiguration.referralReasons
                              ?.map((r) => r.code)
                              .toList() ??
                          [],
                      appVersion: Constants().version,
                      userName: context.loggedInUser.name ?? '',
                      boundaryName: context.boundary.code ?? '',
                      genders: appConfiguration.genderOptions
                              ?.map((g) => g.code)
                              .toList() ??
                          [],
                      tenantId: envConfig.variables.tenantId,
                      checklistTypes: appConfiguration.checklistTypes
                              ?.map((e) => e.code)
                              .toList() ??
                          [],
                    ));
                  },
                );
          },
        ),
      ),
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.viewReportsLabel,
          onPressed: () {
            context.router.push(InventoryReportSelectionRoute(
              isWareHouseMgr: context.loggedInUserRoles
                  .where((role) =>
                      role.code == RolesType.warehouseManager.toValue())
                  .toList()
                  .isNotEmpty,
              isDistributor: context.loggedInUserRoles
                  .where(
                    (role) => role.code == RolesType.distributor.toValue(),
                  )
                  .toList()
                  .isNotEmpty,
              inventoryListener: HcmInventoryBloc(
                context: context,
                userId: context.loggedInUserUuid,
                individualId: context.loggedInIndividualId,
                projectId: context.projectId,
                stockLocalRepository: context
                    .read<LocalRepository<StockModel, StockSearchModel>>(),
                stockReconLocalRepository: context.read<
                    LocalRepository<StockReconciliationModel,
                        StockReconciliationSearchModel>>(),
              ),
              projectId: context.projectId,
              loggedInUserUuid: context.loggedInUserUuid,
            ));
          },
        ),
      ),
      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.buildWith(
        child: HomeItemCard(
          icon: Icons.fingerprint_outlined,
          label: i18.home.manageAttendanceLabel,
          onPressed: () {
            context.router.push(ManageAttendanceRoute(
              attendanceListeners: HCMAttendanceBloc(
                userId: context.loggedInUserUuid,
                projectId: context.projectId,
                attendanceLocalRepository: context.read<
                    LocalRepository<AttendanceRegisterModel,
                        AttendanceRegisterSearchModel>>(),
                individualLocalRepository: context.read<
                    LocalRepository<IndividualModel, IndividualSearchModel>>(),
                attendanceLogLocalRepository: context.read<
                    LocalRepository<AttendanceLogModel,
                        AttendanceLogSearchModel>>(),
                context: context,
                individualId: context.loggedInIndividualId,
              ),
              projectId: context.projectId,
              userId: context.loggedInUserUuid,
              appVersion: Constants().version,
            ));
          },
        ),
      ),
      i18.home.db: homeShowcaseData.db.buildWith(
        child: HomeItemCard(
          icon: Icons.table_chart,
          label: i18.home.db,
          onPressed: () {
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
      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.buildWith(
        child: HomeItemCard(
          icon: Icons.fingerprint_outlined,
          label: i18.home.manageAttendanceLabel,
          onPressed: () {
            context.router.push(ManageAttendanceRoute(
              attendanceListeners: HCMAttendanceBloc(
                userId: context.loggedInUserUuid,
                projectId: context.projectId,
                attendanceLocalRepository: context.read<
                    LocalRepository<AttendanceRegisterModel,
                        AttendanceRegisterSearchModel>>(),
                individualLocalRepository: context.read<
                    LocalRepository<IndividualModel, IndividualSearchModel>>(),
                attendanceLogLocalRepository: context.read<
                    LocalRepository<AttendanceLogModel,
                        AttendanceLogSearchModel>>(),
                context: context,
                individualId: context.loggedInIndividualId,
              ),
              projectId: context.projectId,
              userId: context.loggedInUserUuid,
              appVersion: Constants().version,
            ));
          },
        ),
      ),
      i18.home.db: homeShowcaseData.db.buildWith(
        child: HomeItemCard(
          icon: Icons.table_chart,
          label: i18.home.db,
          onPressed: () {
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
    };

    final Map<String, GlobalKey> homeItemsShowcaseMap = {
      i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.showcaseKey,
      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.showcaseKey,
      i18.home.stockReconciliationLabel:
          homeShowcaseData.wareHouseManagerStockReconciliation.showcaseKey,
      i18.home.myCheckList: homeShowcaseData.supervisorMyChecklist.showcaseKey,
      i18.home.fileComplaint:
          homeShowcaseData.distributorFileComplaint.showcaseKey,
      i18.home.syncDataLabel: homeShowcaseData.distributorSyncData.showcaseKey,
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.showcaseKey,
      i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.showcaseKey,
      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.showcaseKey,
      // i18.home.db: homeShowcaseData.db.showcaseKey,
    };

    final homeItemsLabel = <String>[
      i18.home.beneficiaryLabel,
      i18.home.manageStockLabel,
      i18.home.stockReconciliationLabel,
      i18.home.myCheckList,
      i18.home.fileComplaint,
      i18.home.syncDataLabel,
      i18.home.viewReportsLabel,
      i18.home.beneficiaryReferralLabel,
      i18.home.manageAttendanceLabel,
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
                context.read<
                    LocalRepository<HouseholdModel, HouseholdSearchModel>>(),
                context.read<
                    LocalRepository<IndividualModel, IndividualSearchModel>>(),
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
                context.read<LocalRepository<StockModel, StockSearchModel>>(),
                context
                    .read<LocalRepository<ServiceModel, ServiceSearchModel>>(),
                context.read<
                    LocalRepository<StockReconciliationModel,
                        StockReconciliationSearchModel>>(),
                context.read<
                    LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(),
                context.read<
                    LocalRepository<HcmHFReferralModel,
                        HcmHFReferralSearchModel>>(),
                // context.read<
                //     LocalRepository<HCMAttendanceLogModel,
                //         HCMAttendanceLogSearchModel>>(),
              ],
              remoteRepositories: [
                context.read<
                    RemoteRepository<HouseholdModel, HouseholdSearchModel>>(),
                context.read<
                    RemoteRepository<IndividualModel, IndividualSearchModel>>(),
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
                context.read<RemoteRepository<StockModel, StockSearchModel>>(),
                context
                    .read<RemoteRepository<ServiceModel, ServiceSearchModel>>(),
                context.read<
                    RemoteRepository<StockReconciliationModel,
                        StockReconciliationSearchModel>>(),
                context.read<
                    RemoteRepository<PgrServiceModel, PgrServiceSearchModel>>(),
                context.read<
                    RemoteRepository<HcmHFReferralModel,
                        HcmHFReferralSearchModel>>(),
                // context.read<
                //     RemoteRepository<HCMAttendanceLogModel,
                //         HCMAttendanceLogSearchModel>>(),
              ],
            ),
          );
    }
  }
}

void setRegistrationDeliverySingleton(BuildContext context) {
  context.read<AppInitializationBloc>().state.maybeWhen(
      orElse: () {},
      initialized: (AppConfiguration appConfiguration, _) {
        RegistrationDeliverySingleton().setInitialData(
          tenantId: envConfig.variables.tenantId,
          loggedInUserUuid: context.loggedInUserUuid,
          maxRadius: appConfiguration.maxRadius!,
          projectId: context.projectId,
          selectedBeneficiaryType: context.beneficiaryType,
          projectType: context.selectedProjectType,
          selectedProject: context.selectedProject,
          persistenceConfiguration: PersistenceConfiguration.offlineFirst,
          genderOptions: appConfiguration.genderOptions!.map((option) {
            return {
              'label': option.name,
              'value': option.code,
            };
          }).toList(),
          idTypeOptions: appConfiguration.idTypeOptions!.map((option) {
            return {
              'label': option.name,
              'value': option.code,
            };
          }).toList(),
          householdDeletionReasonOptions:
              appConfiguration.householdDeletionReasonOptions!.map((option) {
            return {
              'label': option.name,
              'value': option.code,
            };
          }).toList(),
          householdMemberDeletionReasonOptions: appConfiguration
              .householdMemberDeletionReasonOptions!
              .map((option) {
            return {
              'label': option.name,
              'value': option.code,
            };
          }).toList(),
          deliveryCommentOptions:
              appConfiguration.deliveryCommentOptions!.map((option) {
            return {
              'label': option.name,
              'value': option.code,
            };
          }).toList(),
          symptomsTypes: appConfiguration.symptomsTypes!.map((option) {
            return {
              'label': option.name,
              'value': option.code,
              'bool': option.active,
            };
          }).toList(),
          referralReasons: appConfiguration.referralReasons!.map((option) {
            return {
              'label': option.name,
              'value': option.code,
              'bool': option.active,
            };
          }).toList(),
        );
      });
}

class _HomeItemDataModel {
  final List<Widget> homeItems;
  final List<GlobalKey> showcaseKeys;

  const _HomeItemDataModel(this.homeItems, this.showcaseKeys);
}
