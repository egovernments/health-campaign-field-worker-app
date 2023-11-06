import 'dart:async';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';

import '../blocs/boundary/boundary.dart';
import '../blocs/household_details/household_details.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/search_households/search_households.dart';
import '../blocs/sync/sync.dart';
import '../data/local_store/no_sql/schema/oplog.dart';
import '../data/local_store/sql_store/sql_store.dart';
import '../data/repositories/local/address.dart';
import '../data/repositories/oplog/oplog.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../router/authenticated_route_observer.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/sidebar/side_bar.dart';

class AuthenticatedPageWrapper extends StatelessWidget {
  AuthenticatedPageWrapper({Key? key}) : super(key: key);

  final StreamController<bool> _drawerVisibilityController =
      StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _drawerVisibilityController.stream,
      builder: (context, snapshot) {
        final showDrawer = snapshot.data ?? false;

        return Portal(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                BlocBuilder<BoundaryBloc, BoundaryState>(
                  builder: (ctx, state) {
                    final selectedBoundary = ctx.boundaryOrNull;

                    if (selectedBoundary == null) {
                      return const SizedBox.shrink();
                    }

                    final boundaryName = selectedBoundary.name ??
                        selectedBoundary.code ??
                        AppLocalizations.of(context).translate(
                          i18.projectSelection.onProjectMapped,
                        );

                    final theme = Theme.of(context);

                    return GestureDetector(
                      onTap: () {
                        ctx.router.navigate(const BoundarySelectionRoute());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: theme.colorScheme.surface,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              ctx.router
                                  .navigate(const BoundarySelectionRoute());
                            },
                            child: Text(boundaryName),
                            // child: Text(boundaryName),
                          ),
                          const Icon(Icons.arrow_drop_down_outlined),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            drawer: showDrawer ? const Drawer(child: SideBar()) : null,
            body: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) {
                    final isar = context.read<Isar>();

                    return SearchHouseholdsBloc(
                      beneficiaryType: context.beneficiaryType,
                      userUid: context.loggedInUserUuid,
                      projectId: context.projectId,
                      addressRepository: AddressLocalRepository(
                        context.read<LocalSqlDataStore>(),
                        AddressOpLogManager(isar),
                      ),
                      projectBeneficiary: context.repository<
                          ProjectBeneficiaryModel,
                          ProjectBeneficiarySearchModel>(),
                      householdMember: context.repository<HouseholdMemberModel,
                          HouseholdMemberSearchModel>(),
                      household: context
                          .repository<HouseholdModel, HouseholdSearchModel>(),
                      individual: context
                          .repository<IndividualModel, IndividualSearchModel>(),
                      taskDataRepository:
                          context.repository<TaskModel, TaskSearchModel>(),
                      sideEffectDataRepository: context
                          .repository<SideEffectModel, SideEffectSearchModel>(),
                      referralDataRepository: context
                          .repository<ReferralModel, ReferralSearchModel>(),
                    )..add(const SearchHouseholdsClearEvent());
                  },
                ),
                BlocProvider(
                  create: (context) {
                    final userId = context.loggedInUserUuid;

                    final isar = context.read<Isar>();
                    final bloc = SyncBloc(
                      isarState: Constants().isar,
                      networkManager: context.read(),
                    );

                    if (!bloc.isClosed) {
                      bloc.add(SyncRefreshEvent(userId));
                    }
/* Every time when the user changes the screen 
 this will refresh the data of sync count */
                    isar.opLogs
                        .filter()
                        .createdByEqualTo(userId)
                        .syncedUpEqualTo(false)
                        .watch()
                        .listen(
                      (event) {
                        if (!bloc.isClosed) {
                          bloc.add(
                            SyncRefreshEvent(
                              userId,
                              event.where((element) {
                                switch (element.entityType) {
                                  case DataModelType.household:
                                  case DataModelType.individual:
                                  case DataModelType.householdMember:
                                  case DataModelType.projectBeneficiary:
                                  case DataModelType.task:
                                  case DataModelType.stock:
                                  case DataModelType.stockReconciliation:
                                  case DataModelType.service:
                                  case DataModelType.complaints:
                                  case DataModelType.sideEffect:
                                  case DataModelType.referral:
                                    return true;
                                  default:
                                    return false;
                                }
                              }).length,
                            ),
                          );
                        }
                      },
                    );

                    isar.opLogs
                        .filter()
                        .createdByEqualTo(userId)
                        .syncedUpEqualTo(true)
                        .syncedDownEqualTo(false)
                        .watch()
                        .listen(
                      (event) {
                        if (!bloc.isClosed) {
                          bloc.add(
                            SyncRefreshEvent(
                              userId,
                              event.where((element) {
                                switch (element.entityType) {
                                  case DataModelType.household:
                                  case DataModelType.individual:
                                  case DataModelType.projectBeneficiary:
                                  case DataModelType.task:
                                  case DataModelType.stock:
                                  case DataModelType.stockReconciliation:
                                  case DataModelType.complaints:
                                  case DataModelType.sideEffect:
                                  case DataModelType.referral:
                                  case DataModelType.householdMember:
                                    return true;
                                  default:
                                    return false;
                                }
                              }).length,
                            ),
                          );
                        }
                      },
                    );

                    return bloc;
                  },
                ),
                BlocProvider(
                  create: (_) => LocationBloc(location: Location())
                    ..add(const LoadLocationEvent()),
                ),
                BlocProvider(
                  create: (_) =>
                      HouseholdDetailsBloc(const HouseholdDetailsState()),
                ),
              ],
              child: AutoRouter(
                navigatorObservers: () => [
                  AuthenticatedRouteObserver(
                    onNavigated: () {
                      bool shouldShowDrawer;
                      switch (context.router.topRoute.name) {
                        case ProjectSelectionRoute.name:
                        case BoundarySelectionRoute.name:
                          shouldShowDrawer = false;
                          break;
                        default:
                          shouldShowDrawer = true;
                      }

                      _drawerVisibilityController.add(shouldShowDrawer);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
