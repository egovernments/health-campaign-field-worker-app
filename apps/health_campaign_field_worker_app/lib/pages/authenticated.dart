import 'package:auto_route/auto_route.dart';
import 'package:digit_components/blocs/location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';

import '../blocs/household_details/household_details.dart';
import '../blocs/sync/sync.dart';
import '../data/local_store/no_sql/schema/oplog.dart';
import '../models/data_model.dart';
import '../widgets/sidebar/side_bar.dart';

class AuthenticatedPageWrapper extends StatelessWidget {
  const AuthenticatedPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight * 1.36),
        child: const Drawer(child: SideBar()),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final isar = context.read<Isar>();
              final bloc = SyncBloc(
                isar: isar,
                networkManager: context.read(),
              )..add(const SyncRefreshEvent());

              isar.opLogs.filter().isSyncedEqualTo(false).watch().listen(
                    (event) => bloc.add(
                      SyncRefreshEvent(event.where((element) {
                        switch (element.entityType) {
                          case DataModelType.household:
                          case DataModelType.individual:
                          case DataModelType.task:
                          case DataModelType.householdMember:
                          case DataModelType.projectBeneficiary:
                          case DataModelType.service:
                          case DataModelType.stock:
                          case DataModelType.stockReconciliation:
                            return true;
                          default:
                            return false;
                        }
                      }).length),
                    ),
                  );

              return bloc;
            },
          ),
          BlocProvider(
            create: (_) => LocationBloc(location: Location())
              ..add(const LoadLocationEvent()),
          ),
          BlocProvider(
            create: (_) => HouseholdDetailsBloc(const HouseholdDetailsState()),
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }
}
