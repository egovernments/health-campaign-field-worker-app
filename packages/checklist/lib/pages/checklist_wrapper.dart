import 'package:auto_route/auto_route.dart';
import 'package:checklist/utils/extensions/context_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checklist/checklist.dart';

@RoutePage()
class ChecklistWrapperPage extends StatelessWidget {
  final bool isEditing;

  const ChecklistWrapperPage({
    super.key,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {
    final serviceDefinition = context
        .repository<ServiceDefinitionModel, ServiceDefinitionSearchModel>(context);

    final service = context.repository<ServiceModel, ServiceSearchModel>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ServiceDefinitionBloc(
            const ServiceDefinitionEmptyState(),
            serviceDefinitionDataRepository: serviceDefinition,
          )..add(const ServiceDefinitionFetchEvent()),
          lazy: false,
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
