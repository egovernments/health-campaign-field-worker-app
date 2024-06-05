import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digit_data_model/data_model.dart';

import '../../utils/extensions/extensions.dart';
import '../../widgets/boundary_selection_wrapper.dart';

@RoutePage()
class ChecklistWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  final bool isEditing;

  const ChecklistWrapperPage({
    super.key,
    this.isEditing = false,
  });

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
