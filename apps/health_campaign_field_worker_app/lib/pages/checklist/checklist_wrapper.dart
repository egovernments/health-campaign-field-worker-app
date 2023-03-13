import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/service/service.dart';
import '../../blocs/service_definition/service_definition.dart';
import '../../data/network_manager.dart';

import '../../models/entities/service.dart';
import '../../models/entities/service_definition.dart';

class ChecklistWrapperPage extends StatelessWidget {
  final bool isEditing;

  const ChecklistWrapperPage({
    Key? key,
    this.isEditing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkManager = context.read<NetworkManager>();

    final serviceDefinition = networkManager
        .repository<ServiceDefinitionModel, ServiceDefinitionSearchModel>(
      context,
    );

    final service =
        networkManager.repository<ServiceModel, ServiceSearchModel>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ServiceDefinitionBloc(
            const ServiceDefinitionEmptyState(),
            serviceDefinitionDataRepository: serviceDefinition,
          )..add(const ServiceDefinitionFetchEvent()),
        ),
        BlocProvider(
          create: (_) => ServiceBloc(
            const ServiceEmptyState(),
            serviceDataRepository: service,
          ),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
