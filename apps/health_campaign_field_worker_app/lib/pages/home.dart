import 'package:survey_form/survey_form.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';

import 'package:complaints/complaints.dart';
import 'package:complaints/router/complaints_router.gm.dart';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:closed_household/router/closed_household_router.gm.dart';
import 'package:closed_household/utils/utils.dart';
import 'package:digit_data_model/models/entities/household_type.dart';

import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';

import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recase/recase.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/sync/sync.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../models/entities/roles_type.dart';
import '../router/app_router.dart';
import '../utils/debound.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/environment_config.dart';
import '../utils/utils.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/localized.dart';
import '../widgets/progress_indicator/custom_beneficiary_progress.dart';
import '../widgets/showcase/config/showcase_constants.dart';
import '../widgets/showcase/showcase_button.dart';
import 'reports/beneficiary/custom_distribution_summary_report_details.dart';
import 'reports/beneficiary/custom_enumeration_summary_report_details.dart';

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

  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      if (result.firstOrNull == ConnectivityResult.none) {
        if (context.mounted) {
          context
              .read<SyncBloc>()
              .add(SyncRefreshEvent(context.loggedInUserUuid));
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
                const BackNavigationHelpHeaderWidget(
                  showBackNavigation: false,
                  showHelp: false,
                ),
                skipProgressBar
                    ? const SizedBox.shrink()
                    : homeShowcaseData.distributorProgressBar.buildWith(
                        child: CustomBeneficiaryProgressBar(
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
      // INFO : Need to add home items of package Here
      i18.home.fileComplaint:
          homeShowcaseData.distributorFileComplaint.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.fileComplaint,
          onPressed: () =>
              context.router.push(const ComplaintsInboxWrapperRoute()),
        ),
      ),

      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.buildWith(
        child: HomeItemCard(
          icon: Icons.fingerprint_outlined,
          label: i18.home.manageAttendanceLabel,
          onPressed: () {
            context.router.push(const ManageAttendanceRoute());
          },
        ),
      ),

      i18.home.mySurveyForm: homeShowcaseData.supervisorMySurveyForm.buildWith(
        child: HomeItemCard(
          enableCustomIcon: true,
          customIcon: mySurveyFormSvg,
          icon: Icons.checklist,
          label: i18.home.mySurveyForm,
          onPressed: () => context.router.push(SurveyFormWrapperRoute()),
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
                    context.router.push(ManageStocksRoute());
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
            context.router.push(StockReconciliationRoute());
          },
        ),
      ),
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.viewReportsLabel,
          onPressed: () {
            context.router.push(InventoryReportSelectionRoute());
          },
        ),
      ),

      i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.buildWith(
        child: HomeItemCard(
          icon: Icons.all_inbox,
          label: i18.home.beneficiaryLabel,
          onPressed: () async {
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
            await context.router.push(const RegistrationDeliveryWrapperRoute());
          },
        ),
      ),

      i18.home.closedHouseHoldLabel: homeShowcaseData.closedHouseHold.buildWith(
        child: HomeItemCard(
          icon: Icons.home,
          enableCustomIcon: true,
          customIcon:
              closedHouseholdSvg, //add in constants foe closed households
          label: i18.home.closedHouseHoldLabel,
          onPressed: () async {
            await context.router.push(const ClosedHouseholdWrapperRoute());
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
                if (snapshot.data == null ||
                    snapshot.data?['enablesManualSync'] == true) {
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
      i18.home.viewSummaryReportsLabel:
          homeShowcaseData.summaryReport.buildWith(
        child: HomeItemCard(
          icon: Icons.book,
          label: i18.home.viewSummaryReportsLabel,
          onPressed: () {
            if (context.isDistributor) {
              context.router.push(
                CustomDistributionSummaryReportDetailsRoute(),
              );
            } else {
              context.router.push(
                CustomEumerationSummaryReportDetailsRoute(),
              );
            }
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
      // INFO : Need to add showcase keys of package Here
      i18.home.fileComplaint:
          homeShowcaseData.distributorFileComplaint.showcaseKey,

      i18.home.manageAttendanceLabel:
          homeShowcaseData.manageAttendance.showcaseKey,

      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.showcaseKey,
      i18.home.stockReconciliationLabel:
          homeShowcaseData.wareHouseManagerStockReconciliation.showcaseKey,
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.showcaseKey,
      i18.home.mySurveyForm:
          homeShowcaseData.supervisorMySurveyForm.showcaseKey,

      i18.home.beneficiaryLabel:
          homeShowcaseData.distributorBeneficiaries.showcaseKey,

      i18.home.syncDataLabel: homeShowcaseData.distributorSyncData.showcaseKey,
      i18.home.db: homeShowcaseData.db.showcaseKey,
      i18.home.closedHouseHoldLabel:
          homeShowcaseData.closedHouseHold.showcaseKey,
      i18.home.viewSummaryReportsLabel:
          homeShowcaseData.summaryReport.showcaseKey,
      i18.home.clfLabel: homeShowcaseData.clf.showcaseKey,
    };

    final homeItemsLabel = <String>[
      // INFO: Need to add items label of package Here
      i18.home.beneficiaryLabel,
      i18.home.clfLabel,
      i18.home.fileComplaint,

      i18.home.manageAttendanceLabel,

      i18.home.manageStockLabel,
      i18.home.stockReconciliationLabel,
      i18.home.viewReportsLabel,
      i18.home.mySurveyForm,

      i18.home.closedHouseHoldLabel,
      i18.home.viewSummaryReportsLabel,
      i18.home.syncDataLabel,
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
                // INFO : Need to add local repo of package Here
                context
                    .read<LocalRepository<ServiceModel, ServiceSearchModel>>(),

                context.read<
                    LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(),

                context.read<
                    LocalRepository<AttendanceLogModel,
                        AttendanceLogSearchModel>>(),

                context.read<LocalRepository<StockModel, StockSearchModel>>(),
                context.read<
                    LocalRepository<StockReconciliationModel,
                        StockReconciliationSearchModel>>(),

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

                context.read<
                    LocalRepository<IndividualModel, IndividualSearchModel>>(),
              ],
              remoteRepositories: [
                // INFO : Need to add repo repo of package Here
                context
                    .read<RemoteRepository<ServiceModel, ServiceSearchModel>>(),

                context.read<
                    RemoteRepository<PgrServiceModel, PgrServiceSearchModel>>(),

                context.read<
                    RemoteRepository<AttendanceLogModel,
                        AttendanceLogSearchModel>>(),

                context.read<RemoteRepository<StockModel, StockSearchModel>>(),
                context.read<
                    RemoteRepository<StockReconciliationModel,
                        StockReconciliationSearchModel>>(),

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

                context.read<
                    RemoteRepository<IndividualModel, IndividualSearchModel>>(),
              ],
            ),
          );
    }
  }
}

// Function to set initial Data required for the packages to run
void setPackagesSingleton(BuildContext context) {
  context.read<AppInitializationBloc>().state.maybeWhen(
      orElse: () {},
      initialized: (AppConfiguration appConfiguration, _) {
        // INFO : Need to add singleton of package Here
        SurveyFormSingleton().setInitialData(
          projectId: context.projectId,
          projectName: context.selectedProject.name,
          loggedInIndividualId: context.loggedInIndividualId ?? '',
          loggedInUserUuid: context.loggedInUserUuid,
          appVersion: Constants().version,
          isHealthFacilityWorker: context.loggedInUserRoles
              .where((role) =>
                  role.code == RolesType.healthFacilityWorker.toValue())
              .toList()
              .isNotEmpty,
          roles: context.read<AuthBloc>().state.maybeMap(
              orElse: () => const Offstage(),
              authenticated: (res) {
                return res.userModel.roles
                    .map((e) => e.code.snakeCase.toUpperCase())
                    .toList();
              }),
        );

        ComplaintsSingleton().setInitialData(
          tenantId: envConfig.variables.tenantId,
          loggedInUserUuid: context.loggedInUserUuid,
          userMobileNumber: context.loggedInUser.mobileNumber,
          loggedInUserName: context.loggedInUser.name,
          complaintTypes:
              appConfiguration.complaintTypes!.map((e) => e.code).toList(),
          userName: context.loggedInUser.name ?? '',
        );

        AttendanceSingleton().setInitialData(
            projectId: context.projectId,
            loggedInIndividualId: context.loggedInIndividualId ?? "",
            loggedInUserUuid: context.loggedInUserUuid,
            appVersion: Constants().version);

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

        RegistrationDeliverySingleton().setInitialData(
          loggedInUserUuid: context.loggedInUserUuid,
          maxRadius: appConfiguration.maxRadius!,
          projectId: context.projectId,
          selectedBeneficiaryType: context.beneficiaryType,
          projectType: context.selectedProjectType,
          selectedProject: context.selectedProject,
          searchHouseHoldFilter: [],
          refusalReasons: [],
          loggedInUser: context.loggedInUserModel,
          houseStructureTypes: [],
          genderOptions:
              appConfiguration.genderOptions!.map((e) => e.code).toList(),
          idTypeOptions:
              appConfiguration.idTypeOptions!.map((e) => e.code).toList(),
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
          symptomsTypes:
              appConfiguration.symptomsTypes!.map((e) => e.code).toList(),
          referralReasons:
              appConfiguration.referralReasons!.map((e) => e.code).toList(),
          searchCLFFilters: appConfiguration.searchCLFFilters != null
              ? appConfiguration.searchCLFFilters!.map((e) => e.code).toList()
              : [],
        );
        ClosedHouseholdSingleton().setInitialData(
          loggedInUserUuid: context.loggedInUserUuid,
          projectId: context.projectId,
          beneficiaryType: context.beneficiaryType,
        );
      });
}

class _HomeItemDataModel {
  final List<Widget> homeItems;
  final List<GlobalKey> showcaseKeys;

  const _HomeItemDataModel(this.homeItems, this.showcaseKeys);
}
