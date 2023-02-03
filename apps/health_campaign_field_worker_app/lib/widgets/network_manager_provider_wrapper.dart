import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

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

  final NetworkManagerConfiguration configuration;

  const NetworkManagerProviderWrapper({
    super.key,
    required this.configuration,
    required this.dio,
    required this.sql,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitializationBloc, AppInitializationState>(
      builder: (context, state) {
        if (state is! AppInitialized) {
          return const Offstage();
        }

        final registries = state.serviceRegistryList;
        final registryMap = registries
            .map((e) {
              return e.actions.map((e) {
                ApiOperation? operation;
                DataModelType? type;

                operation = ApiOperation.values.firstWhereOrNull((element) {
                  return e.action == element.name;
                });

                type = DataModelType.values.firstWhereOrNull((element) {
                  return e.entityName.camelCase == element.name;
                });

                if (operation == null || type == null) return null;

                return ActionPathModel(
                  operation: operation,
                  type: type,
                  path: e.path,
                );
              });
            })
            .expand((element) => element)
            .whereNotNull()
            .fold(<DataModelType, Map<ApiOperation, String>>{}, (o, element) {
              if (o.containsKey(element.type)) {
                o[element.type]?.addEntries(
                  [MapEntry(element.operation, element.path)],
                );
              } else {
                o[element.type] = Map.fromEntries([
                  MapEntry(element.operation, element.path),
                ]);
              }

              return o;
            });

        return Provider(
          create: (ctx) => NetworkManager(
            configuration: configuration,
            localRepositories: [
              IndividualLocalRepository(
                sql,
                ctx.read<OpLogManager<IndividualModel>>(),
              ),
              HouseholdLocalRepository(
                sql,
                ctx.read<OpLogManager<HouseholdModel>>(),
              ),
              HouseholdMemberLocalRepository(
                sql,
                ctx.read<OpLogManager<HouseholdMemberModel>>(),
              ),
            ],
            remoteRepositories: [
              ..._getRemoteRepositories(dio, registryMap),
            ],
          ),
          child: child,
        );
      },
    );
  }

  List<RemoteRepository> _getRemoteRepositories(
    Dio dio,
    Map<DataModelType, Map<ApiOperation, String>> actionMap,
  ) {
    final remoteRepositories = <RemoteRepository>[];
    for (final value in DataModelType.values) {
      switch (value) {
        case DataModelType.facility:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              FacilityRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.household:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              HouseholdRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.householdMember:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              HouseholdMemberRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.individual:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              IndividualRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.product:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProductRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.productVariant:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProductVariantRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.project:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProjectRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.projectBeneficiary:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProjectBeneficiaryRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.projectFacility:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProjectFacilityRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.projectProductVariant:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProjectProductVariantRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.projectStaff:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProjectStaffRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.projectResource:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProjectResourceRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.projectType:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              ProjectTypeRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
        case DataModelType.task:
          if (actionMap.containsKey(value)) {
            final actions = actionMap[value]!;
            remoteRepositories.add(
              TaskRemoteRepository(
                dio,
                searchPath: actions[ApiOperation.search] ?? '',
                createPath: actions[ApiOperation.create] ?? '',
                updatePath: actions[ApiOperation.update] ?? '',
              ),
            );
          }
          break;
      }
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
