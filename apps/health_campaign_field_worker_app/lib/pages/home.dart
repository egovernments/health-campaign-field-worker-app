import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:overlay_builder/overlay_builder.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart'
    as app_config;
import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/search_households/search_households.dart';
import '../blocs/sync/sync.dart';
import '../data/data_repository.dart';
import '../data/local_store/no_sql/schema/oplog.dart';

import '../data/local_store/sql_store/sql_store.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/debound.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/action_card/action_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/localized.dart';
import '../widgets/progress_bar/beneficiary_progress.dart';

class HomePage extends LocalizedStatefulWidget {
  const HomePage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends LocalizedState<HomePage> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      performBackgroundService(
        isBackground: false,
        stopService: false,
        context: null,
      );

      // Got a new connectivity status!
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

    List<GlobalKey<OverlayWidgetState>> overlayWidgetStateList = [];
    List<GlobalKey<DigitWalkthroughState>> walkthroughWidgetStateList = [];
    for (var i = 0; i < _getItems(context).length + 1; i++) {
      overlayWidgetStateList
          .add(GlobalKey<OverlayWidgetState>(debugLabel: 'home_Overlay_$i'));
      walkthroughWidgetStateList.add(GlobalKey<DigitWalkthroughState>(
        debugLabel: 'HOME_$i',
      ));
    }

    GlobalKey<OverlayWidgetState> overlaykey = GlobalKey(debugLabel: 'new');

    GlobalKey<DigitWalkthroughWrapperState> overlayWrapperkey =
        GlobalKey(debugLabel: 'newwrapper');

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: DigitWalkthroughWrapper(
          key: overlayWrapperkey,
          overlayWidget: overlaykey,
          keysArray: overlayWidgetStateList,
          widgetKey: walkthroughWidgetStateList,
          initialIndex: 0,
          child: IgnorePointer(
            ignoring: overlayWrapperkey.currentState?.showOverlay ?? false,
            child: ScrollableContent(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return DigitWalkthrough(
                        onSkip: () =>
                            {overlayWrapperkey.currentState?.onSelectedSkip()},
                        widgetHeight: 130,
                        onTap: () => {
                          walkthroughWidgetStateList[index]
                              .currentState
                              ?.initOffsetsPositions(),
                          overlayWrapperkey.currentState?.onSelectedTap(),
                        },
                        key: walkthroughWidgetStateList[index + 1],
                        description: localizations.translate(
                          '${_getItems(context).elementAt(index).label}_HELP',
                        ),
                        overlayWidget: overlayWidgetStateList[index + 1],
                        titleAlignment: TextAlign.center,
                        skipLabel:
                            localizations.translate(i18.common.coreCommonSkip),
                        nextLabel:
                            localizations.translate(i18.common.coreCommonNext),
                        child: _getItems(context).elementAt(index),
                      );
                    },
                    childCount: _getItems(context).length,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 145,
                    childAspectRatio: 104 / 128,
                  ),
                ),
              ],
              header: Column(children: [
                BackNavigationHelpHeaderWidget(
                  showBackNavigation: false,
                  helpClicked: () {
                    for (var i = 0; i < _getItems(context).length; i++) {
                      walkthroughWidgetStateList[i]
                          .currentState
                          ?.initOffsetsPositions();
                    }
                    overlayWrapperkey.currentState?.onSelectedTap();
                  },
                ),
                if (context.showProgressBar)
                  DigitWalkthrough(
                    onSkip: () =>
                        {overlayWrapperkey.currentState?.onSelectedSkip()},
                    widgetHeight: 150,
                    onTap: () {
                      overlayWrapperkey.currentState?.onSelectedTap();
                    },
                    key: walkthroughWidgetStateList[0],
                    description:
                        localizations.translate(i18.home.progressIndicatorHelp),
                    overlayWidget: overlayWidgetStateList[0],
                    titleAlignment: TextAlign.center,
                    skipLabel:
                        localizations.translate(i18.common.coreCommonSkip),
                    nextLabel:
                        localizations.translate(i18.common.coreCommonNext),
                    child: BeneficiaryProgressBar(
                      label: localizations.translate(
                        i18.home.progressIndicatorTitle,
                      ),
                      prefixLabel: localizations.translate(
                        i18.home.progressIndicatorPrefixLabel,
                      ),
                    ),
                  ),
              ]),
              footer: PoweredByDigit(
                version: Constants().version,
              ),
              children: [
                const SizedBox(height: kPadding * 2),
                BlocConsumer<SyncBloc, SyncState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () => null,
                      syncInProgress: () => DigitSyncDialog.show(
                        context,
                        type: DigitSyncDialogType.inProgress,
                        label: localizations.translate(
                          i18.syncDialog.syncInProgressTitle,
                        ),
                        barrierDismissible: false,
                      ),
                      completedSync: () {
                        Navigator.of(context, rootNavigator: true).pop();

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
                      },
                      failedSync: () {
                        _showSyncFailedDialog(
                          context,
                          message: localizations.translate(
                            i18.syncDialog.syncFailedTitle,
                          ),
                        );
                      },
                      failedDownSync: () {
                        _showSyncFailedDialog(
                          context,
                          message: localizations.translate(
                            i18.syncDialog.downSyncFailedTitle,
                          ),
                        );
                      },
                      failedUpSync: () {
                        _showSyncFailedDialog(
                          context,
                          message: localizations.translate(
                            i18.syncDialog.upSyncFailedTitle,
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const Offstage(),
                      pendingSync: (count) {
                        final debouncer = Debouncer(seconds: 5);

                        debouncer.run(() async {
                          if (count == 0) {
                            performBackgroundService(
                              isBackground: false,
                              stopService: true,
                              context: context,
                            );
                          } else {
                            performBackgroundService(
                              isBackground: false,
                              stopService: false,
                              context: context,
                            );
                          }
                        });

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
                                title: localizations
                                    .translate(i18.home.dataSyncInfoLabel),
                              );
                      },
                    );
                  },
                ),
              ],
            ),
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

  List<HomeItemCard> _getItems(BuildContext context) {
    final state = context.read<AuthBloc>().state;
    if (state is! AuthAuthenticatedState) {
      return [];
    }

    final homeItems = <HomeItemCard>[
      HomeItemCard(
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
      HomeItemCard(
        icon: Icons.store_mall_directory,
        label: i18.home.manageStockLabel,
        onPressed: () => context.router.push(ManageStocksRoute()),
      ),
      HomeItemCard(
        icon: Icons.menu_book,
        label: i18.home.stockReconciliationLabel,
        onPressed: () => context.router.push(StockReconciliationRoute()),
      ),
      HomeItemCard(
        icon: Icons.menu_book,
        label: i18.home.warehouseManagerCheckList,
        onPressed: () => context.router.push(ChecklistWrapperRoute()),
      ),
      HomeItemCard(
        icon: Icons.menu_book,
        label: i18.home.myCheckList,
        onPressed: () => context.router.push(ChecklistWrapperRoute()),
      ),
      HomeItemCard(
        icon: Icons.announcement,
        label: i18.home.fileComplaint,
        onPressed: () =>
            context.router.push(const ComplaintsInboxWrapperRoute()),
      ),
      HomeItemCard(
        icon: Icons.sync_alt,
        label: i18.home.syncDataLabel,
        onPressed: () => _attemptSyncUp(context),
      ),
      HomeItemCard(
        icon: Icons.call,
        label: i18.home.callbackLabel,
        onPressed: () => DigitActionDialog.show(
          context,
          widget: BlocBuilder<AppInitializationBloc, AppInitializationState>(
            builder: (context, state) {
              if (state is! AppInitialized) {
                return const Offstage();
              }

              final supportList = state.appConfiguration.callSupportOptions ??
                  <app_config.CallSupportList>[];

              return ActionCard(
                items: supportList
                    .map(
                      (e) => ActionCardModel(
                        action: () async {
                          if (!await launchUrl(
                            Uri(
                              scheme: 'tel',
                              path: e.code,
                            ),
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        icon: Icons.call,
                        label: e.name,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ),
      HomeItemCard(
        icon: Icons.table_chart,
        label: 'DB',
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
      HomeItemCard(
        icon: Icons.delete_forever,
        label: 'Delete all',
        onPressed: () async {
          final sql = context.read<LocalSqlDataStore>();
          final isar = context.read<Isar>();

          for (var element in sql.allTables) {
            sql.delete(element).where((_) => const Constant(true));
          }

          await isar.writeTxn(() async => await isar.opLogs.clear());
        },
      ),
    ];

    return homeItems
        .where((element) => state.actionsWrapper.actions
            .map((e) => e.displayName)
            .toList()
            .contains(element.label))
        .toList();
  }

  void _attemptSyncUp(BuildContext context) {
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
              context.read<LocalRepository<StockModel, StockSearchModel>>(),
              context.read<LocalRepository<ServiceModel, ServiceSearchModel>>(),
              context.read<
                  LocalRepository<StockReconciliationModel,
                      StockReconciliationSearchModel>>(),
              context.read<
                  LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(),
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
              context.read<RemoteRepository<StockModel, StockSearchModel>>(),
              context
                  .read<RemoteRepository<ServiceModel, ServiceSearchModel>>(),
              context.read<
                  RemoteRepository<StockReconciliationModel,
                      StockReconciliationSearchModel>>(),
              context.read<
                  RemoteRepository<PgrServiceModel, PgrServiceSearchModel>>(),
            ],
          ),
        );
  }
}
