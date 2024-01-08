import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../blocs/auth/auth.dart';
import '../blocs/search_households/search_households.dart';
import '../blocs/search_referrals/search_referrals.dart';
import '../blocs/sync/sync.dart';
import '../data/data_repository.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../data/local_store/sql_store/sql_store.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/debound.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/localized.dart';
import '../widgets/progress_bar/beneficiary_progress.dart';
import '../widgets/showcase/config/showcase_constants.dart';
import '../widgets/showcase/showcase_button.dart';

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

    if (!(roles.contains("DISTRIBUTOR") || roles.contains("REGISTRAR"))) {
      skipProgressBar = true;
    }

    final mappedItems = _getItems(context);

    final homeItems = mappedItems?.homeItems ?? [];
    final showcaseKeys = <GlobalKey>[
      if (!skipProgressBar) homeShowcaseData.distributorProgressBar.showcaseKey,
      ...(mappedItems?.showcaseKeys ?? []),
    ];

    return Scaffold(
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
            final searchBloc = context.read<SearchHouseholdsBloc>();
            await context.router.push(
              SearchBeneficiaryRoute(),
            );
            searchBloc.add(const SearchHouseholdsClearEvent());
          },
        ),
      ),
      i18.home.manageStockLabel:
          homeShowcaseData.warehouseManagerManageStock.buildWith(
        child: HomeItemCard(
          icon: Icons.store_mall_directory,
          label: i18.home.manageStockLabel,
          onPressed: () {
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
            context.router.push(StockReconciliationRoute());
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
            final searchBloc = context.read<SearchReferralsBloc>();
            searchBloc.add(const SearchReferralsClearEvent());
            await context.router.push(SearchReferralsRoute());
          },
        ),
      ),
      i18.home.viewReportsLabel: homeShowcaseData.inventoryReport.buildWith(
        child: HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.viewReportsLabel,
          onPressed: () {
            context.router.push(
              InventoryReportSelectionRoute(),
            );
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
      i18.home.db: homeShowcaseData.inventoryReport.showcaseKey,
      i18.home.beneficiaryReferralLabel:
          homeShowcaseData.hfBeneficiaryReferral.showcaseKey,
    };

    final homeItemsLabel = <String>[
      i18.home.beneficiaryLabel,
      i18.home.manageStockLabel,
      i18.home.stockReconciliationLabel,
      i18.home.myCheckList,
      i18.home.fileComplaint,
      i18.home.syncDataLabel,
      i18.home.viewReportsLabel,
      i18.home.db,
      i18.home.beneficiaryReferralLabel,
    ];

    final List<String> filteredLabels = homeItemsLabel
        .where((element) =>
            state.actionsWrapper.actions
                .map((e) => e.displayName)
                .toList()
                .contains(element) ||
            element == i18.home.db)
        .toList();

    final showcaseKeys =
        filteredLabels.map((label) => homeItemsShowcaseMap[label]!).toList();

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
                    LocalRepository<HFReferralModel, HFReferralSearchModel>>(),
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
                    RemoteRepository<HFReferralModel, HFReferralSearchModel>>(),
              ],
            ),
          );
    }
  }
}

class _HomeItemDataModel {
  final List<Widget> homeItems;
  final List<GlobalKey> showcaseKeys;

  const _HomeItemDataModel(this.homeItems, this.showcaseKeys);
}
