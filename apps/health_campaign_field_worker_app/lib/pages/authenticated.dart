import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';

import '../blocs/boundary/boundary.dart';
import '../blocs/household_details/household_details.dart';
import '../blocs/search_households/search_households.dart';
import '../blocs/sync/sync.dart';
import '../data/local_store/no_sql/schema/oplog.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/utils.dart';
import '../widgets/sidebar/side_bar.dart';

class AuthenticatedPageWrapper extends StatefulWidget {
  const AuthenticatedPageWrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AuthenticatedPageWrapperState();
  }
}

class AuthenticatedPageWrapperState extends State<AuthenticatedPageWrapper>
    with AutoRouteAwareStateMixin {
  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<BoundaryBloc, BoundaryState>(
              builder: (ctx, state) {
                BoundaryModel? selectedBoundary;
                try {
                  selectedBoundary = ctx.boundary;
                } catch (_) {
                  debugPrint('');
                }
                final boundaryName =
                    selectedBoundary?.name ?? selectedBoundary?.code;
                if (boundaryName == null) return const SizedBox.shrink();

                return TextButton(
                  onPressed: () {
                    ctx.router.navigate(const BoundarySelectionRoute());
                  },
                  child: Text(boundaryName),
                );
              },
            ),
          ],
        ),
        drawer: const Drawer(child: SideBar()),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) {
                return SearchHouseholdsBloc(
                  userUid: context.loggedInUserUuid,
                  projectId: context.projectId,
                  projectBeneficiary: context.repository<
                      ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>(),
                  householdMember: context.repository<HouseholdMemberModel,
                      HouseholdMemberSearchModel>(),
                  household: context
                      .repository<HouseholdModel, HouseholdSearchModel>(),
                  individual: context
                      .repository<IndividualModel, IndividualSearchModel>(),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(),
                )..add(const SearchHouseholdsClearEvent());
              },
            ),
            BlocProvider(
              create: (context) {
                final userId = context.loggedInUserUuid;

                final isar = context.read<Isar>();
                final bloc = SyncBloc(
                  isar: isar,
                  networkManager: context.read(),
                )..add(SyncRefreshEvent(userId));

                isar.opLogs
                    .filter()
                    .createdByEqualTo(userId)
                    .syncedUpEqualTo(false)
                    .watch()
                    .listen(
                  (event) {
                    bloc.add(
                      SyncRefreshEvent(
                        userId,
                        event.where((element) {
                          switch (element.entityType) {
                            case DataModelType.household:
                            case DataModelType.individual:
                            case DataModelType.task:
                            case DataModelType.householdMember:
                            case DataModelType.projectBeneficiary:
                            case DataModelType.stock:
                            case DataModelType.stockReconciliation:
                            case DataModelType.service:
                            case DataModelType.complaints:
                              return true;
                            default:
                              return false;
                          }
                        }).length,
                      ),
                    );
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
          child: const AutoRouter(),
        ),
      ),
    );
  }
}
