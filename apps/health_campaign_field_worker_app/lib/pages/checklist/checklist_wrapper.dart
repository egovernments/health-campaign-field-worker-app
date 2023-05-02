import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/service/service.dart';
import '../../blocs/service_definition/service_definition.dart';
import '../../models/entities/service.dart';
import '../../models/entities/service_definition.dart';
import '../../utils/extensions/extensions.dart';
import '../../widgets/boundary_selection_wrapper.dart';

class ChecklistWrapperPage extends StatelessWidget with AutoRouteWrapper {
  final bool isEditing;

  const ChecklistWrapperPage({
    Key? key,
    this.isEditing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoundarySelectionWrapper(
      child: AutoRouter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final serviceDefinition = context
        .repository<ServiceDefinitionModel, ServiceDefinitionSearchModel>();

    final service = context.repository<ServiceModel, ServiceSearchModel>();

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
      child: this,
    );
  }
}
