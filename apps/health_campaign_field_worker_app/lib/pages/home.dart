import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import '../blocs/auth/auth.dart';
import '../blocs/service_definition/service_definition_remote.dart';
import '../blocs/sync/sync.dart';
import '../data/data_repository.dart';
import '../data/local_store/no_sql/schema/oplog.dart';
import '../data/local_store/sql_store/sql_store.dart';
import '../models/auth/auth_model.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/localized.dart';
import '../widgets/progress_indicator/progress_indicator.dart';

class HomePage extends LocalizedStatefulWidget {
  const HomePage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends LocalizedState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _getItems(context).elementAt(index),
              childCount: _getItems(context).length,
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
            ),
            ProgressIndicatorContainer(
              label: localizations.translate(
                i18.home.progressIndicatorTitle,
              ),
              prefixLabel: localizations.translate(
                i18.home.progressIndicatorPrefixLabel,
              ),
              suffixLabel: '200',
              value: .08,
            ),
          ],
        ),
        footer: const PoweredByDigit(),
        children: [
          const SizedBox(height: kPadding * 2),
          BlocConsumer<SyncBloc, SyncState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () => null,
                syncInProgress: () => DigitSyncDialogContent.show(
                  context,
                  type: DigitSyncDialogType.inProgress,
                  // TODO: Localization pending
                  label: 'Sync in Progress', barrierDismissible: false,
                ),
                completedSync: () {
                  Navigator.of(context, rootNavigator: true).pop();

                  DigitSyncDialogContent.show(
                    context,
                    type: DigitSyncDialogType.complete,
                    // TODO: Localization Pending
                    label: 'Data Synced',
                    primaryAction: DigitDialogActions(
                      // TODO: Localization Pending
                      label: 'Close',
                      action: (ctx) {
                        Navigator.pop(ctx);
                      },
                    ),
                  );
                },
                failedSync: () {
                  Navigator.of(context, rootNavigator: true).pop();

                  DigitSyncDialogContent.show(
                    context,
                    type: DigitSyncDialogType.failed,
                    // TODO: Localization Pending
                    label: 'Sync Failed !',
                    primaryAction: DigitDialogActions(
                      // TODO: Localization Pending
                      label: 'Retry',
                      action: (ctx) {
                        Navigator.pop(ctx);
                        _attemptSyncUp(context);
                      },
                    ),
                    secondaryAction: DigitDialogActions(
                      // TODO: Localization Pending
                      label: 'Close',
                      action: (ctx) => Navigator.pop(ctx),
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Offstage(),
                pendingSync: (count) => count == 0
                    ? const Offstage()
                    : DigitInfoCard(
                        icon: Icons.info,
                        backgroundColor: theme.colorScheme.tertiaryContainer,
                        iconColor: theme.colorScheme.surfaceTint,
                        description: localizations
                            .translate(i18.home.dataSyncInfoContent)
                            .replaceAll('{}', count.toString()),
                        title: localizations.translate(
                          i18.home.dataSyncInfoLabel,
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<HomeItemCard> _getItems(BuildContext context) {
    final state = context.read<AuthBloc>().state;
    if (state is! AuthAuthenticatedState) {
      return [];
    }

    final roles = state.userModel.roles.map((e) {
      return e.code;
    });

    final homeItems = <HomeItemCard>[];

    for (final roleModel in roles) {
      switch (roleModel) {
        case UserRoleCodeEnum.registrar:
          homeItems.add(
            HomeItemCard(
              icon: Icons.all_inbox,
              label: i18.home.beneficiaryLabel,
              onPressed: () {
                context.router.push(
                  SearchBeneficiaryRoute(),
                );
              },
            ),
          );
          break;
        case UserRoleCodeEnum.warehouseManager:
          homeItems.addAll(
            [
              HomeItemCard(
                icon: Icons.store_mall_directory,
                label: i18.home.manageStockLabel,
                onPressed: () {
                  context.router.push(ManageStocksRoute());
                },
              ),
              HomeItemCard(
                icon: Icons.menu_book,
                label: i18.home.stockReconciliationLabel,
                onPressed: () {
                  context.router.push(StockReconciliationRoute());
                },
              ),
            ],
          );
          break;
        case UserRoleCodeEnum.systemAdministrator:
          homeItems.addAll(
            [
              HomeItemCard(
                icon: Icons.store_mall_directory,
                label: i18.home.manageStockLabel,
              ),
              HomeItemCard(
                icon: Icons.menu_book,
                label: i18.home.stockReconciliationLabel,
              ),
              HomeItemCard(
                icon: Icons.all_inbox,
                label: i18.home.beneficiaryLabel,
                onPressed: () {
                  context.router.push(
                    SearchBeneficiaryRoute(),
                  );
                },
              ),
            ],
          );
          break;
      }
    }

    homeItems.addAll(
      [
        HomeItemCard(
          icon: Icons.menu_book,
          label: i18.home.viewReportsLabel,
        ),
        HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.fileComplaint,
        ),
        HomeItemCard(
          icon: Icons.announcement,
          label: i18.home.fileComplaint,
          onPressed: () {
            context
                .read<ServiceDefinitionRemoteBloc>()
                .add(const ServiceDefinitionInitEvent());
          },
        ),
        HomeItemCard(
          icon: Icons.sync_alt,
          label: i18.home.syncDataLabel,
          onPressed: () => _attemptSyncUp(context),
        ),
        HomeItemCard(
          icon: Icons.call,
          label: i18.home.callbackLabel,
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
            int count = 0;
            for (var element in sql.allTables) {
              final selector = sql.delete(element)
                ..where((_) => const Constant(true));
              count += await selector.go();
            }
            debugPrint('deleted: $count');

            await isar.writeTxn(() async => await isar.opLogs.clear());
          },
        ),
      ],
    );

    return homeItems;
  }

  void _attemptSyncUp(BuildContext context) {
    context.read<SyncBloc>().add(
          SyncSyncUpEvent(
            localRepositories: [
              context.read<
                  LocalRepository<IndividualModel, IndividualSearchModel>>(),
              context.read<
                  LocalRepository<HouseholdModel, HouseholdSearchModel>>(),
              context.read<
                  LocalRepository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>>(),
              context.read<
                  LocalRepository<ProjectBeneficiaryModel,
                      ProjectBeneficiarySearchModel>>(),
              context.read<LocalRepository<TaskModel, TaskSearchModel>>(),
              context.read<LocalRepository<ServiceModel, ServiceSearchModel>>(),
              context.read<LocalRepository<StockModel, StockSearchModel>>(),
            ],
            remoteRepositories: [
              context.read<
                  RemoteRepository<IndividualModel, IndividualSearchModel>>(),
              context.read<
                  RemoteRepository<HouseholdModel, HouseholdSearchModel>>(),
              context.read<
                  RemoteRepository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>>(),
              context.read<
                  RemoteRepository<ProjectBeneficiaryModel,
                      ProjectBeneficiarySearchModel>>(),
              context.read<RemoteRepository<TaskModel, TaskSearchModel>>(),
              context
                  .read<RemoteRepository<ServiceModel, ServiceSearchModel>>(),
              context.read<RemoteRepository<StockModel, StockSearchModel>>(),
            ],
          ),
        );
  }
}
