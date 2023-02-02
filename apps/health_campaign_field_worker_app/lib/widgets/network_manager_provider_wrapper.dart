import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/data/network_manager.dart';
import 'package:provider/provider.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../data/local_store/sql_store/sql_store.dart';
import '../data/repositories/local/household.dart';
import '../data/repositories/local/houshold_member.dart';
import '../data/repositories/local/individual.dart';
import '../data/repositories/oplog/oplog.dart';
import '../data/repositories/remote/individual.dart';

class NetworkManagerProviderWrapper extends StatelessWidget {
  final LocalSqlDataStore sql;
  final Dio dio;
  final OpLogManager opLogManager;

  final NetworkManagerConfiguration configuration;

  const NetworkManagerProviderWrapper({
    super.key,
    required this.configuration,
    required this.opLogManager,
    required this.dio,
    required this.sql,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitializationBloc, AppInitializationState>(
      builder: (context, state) {
        if (state is! AppInitialized) {
          return const Offstage();
        }

        final registries = state.serviceRegistryList;
        registries.forEach((element) {
          element.service;
        });

        return MultiProvider(
          providers: [
            // Local Repositories
            Provider(create: (_) => IndividualLocalRepository(sql, opLogManager)),
            Provider(create: (_) => HouseholdLocalRepository(sql, opLogManager)),
            Provider(create: (_) => HouseholdMemberLocalRepository(sql, opLogManager)),
            // Remote Repositories
            Provider(create: (_) => IndividualRemoteRepository(dio, path: '')),
          ],
          child: Provider(
            create: (ctx) => NetworkManager(
              configuration: configuration,
            ),
          ),
        );
      },
    );
  }
}
