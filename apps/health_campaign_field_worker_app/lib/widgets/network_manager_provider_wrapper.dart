import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../data/data_repository.dart';
import '../data/local_store/sql_store/sql_store.dart';
import '../data/network_manager.dart';
import '../data/repositories/local/household.dart';
import '../data/repositories/local/houshold_member.dart';
import '../data/repositories/local/individual.dart';
import '../data/repositories/oplog/oplog.dart';
import '../data/repositories/remote/facility.dart';
import '../data/repositories/remote/household.dart';
import '../data/repositories/remote/household_member.dart';
import '../data/repositories/remote/individual.dart';
import '../data/repositories/remote/product.dart';
import '../data/repositories/remote/product_variant.dart';
import '../data/repositories/remote/project.dart';
import '../data/repositories/remote/project_beneficiary.dart';
import '../data/repositories/remote/project_facility.dart';
import '../data/repositories/remote/project_product_variant.dart';
import '../data/repositories/remote/project_resource.dart';
import '../data/repositories/remote/project_staff.dart';
import '../data/repositories/remote/project_type.dart';
import '../data/repositories/remote/task.dart';
import '../models/data_model.dart';

class NetworkManagerProviderWrapper extends StatelessWidget {
  final LocalSqlDataStore sql;
  final Dio dio;
  final Widget child;
  final Isar isar;

  final NetworkManagerConfiguration configuration;

  const NetworkManagerProviderWrapper({
    super.key,
    required this.configuration,
    required this.isar,
    required this.dio,
    required this.sql,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitializationBloc, AppInitializationState>(
      builder: (context, state) {
        final actionMap = state.entityActionMapping;
        if (actionMap.isEmpty) {
          return const Offstage();
        }

        final remote = _getRemoteRepositories(dio, actionMap);
        final local = _getLocalRepositories(sql, isar);

        return MultiRepositoryProvider(
          providers: [...local, ...remote]
              .map((e) => RepositoryProvider.value(value: e))
              .toList(),
          child: Provider(
            create: (ctx) => NetworkManager(
              configuration: configuration,
              localRepositories: local,
              remoteRepositories: remote,
            ),
            child: child,
          ),
        );
      },
    );
  }

  List<LocalRepository> _getLocalRepositories(
    LocalSqlDataStore sql,
    Isar isar,
  ) {
    return [
      IndividualLocalRepository(
        sql,
        OpLogManager<IndividualModel>(isar),
      ),
      HouseholdMemberLocalRepository(
        sql,
        OpLogManager<HouseholdMemberModel>(isar),
      ),
      HouseholdLocalRepository(
        sql,
        OpLogManager<HouseholdModel>(isar),
      ),
    ];
  }

  List<RemoteRepository> _getRemoteRepositories(
    Dio dio,
    Map<DataModelType, Map<ApiOperation, String>> actionMap,
  ) {
    final remoteRepositories = <RemoteRepository>[];
    for (final value in DataModelType.values) {
      if (!actionMap.containsKey(value)) {
        continue;
      }

      final actions = actionMap[value]!;

      remoteRepositories.addAll([
        if (value == DataModelType.facility)
          FacilityRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.household)
          HouseholdRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.householdMember)
          HouseholdMemberRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.individual)
          IndividualRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.product)
          ProductRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.productVariant)
          ProductVariantRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.project)
          ProjectRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectBeneficiary)
          ProjectBeneficiaryRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectFacility)
          ProjectFacilityRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectProductVariant)
          ProjectProductVariantRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectStaff)
          ProjectStaffRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectResource)
          ProjectResourceRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.projectType)
          ProjectTypeRemoteRepository(dio, actionMap: actions),
        if (value == DataModelType.task)
          TaskRemoteRepository(dio, actionMap: actions),
      ]);
    }

    return remoteRepositories;
  }
}

class ActionPathModel {
  final DataModelType type;
  final String path;
  final ApiOperation operation;

  const ActionPathModel({
    required this.operation,
    required this.type,
    required this.path,
  });
}
