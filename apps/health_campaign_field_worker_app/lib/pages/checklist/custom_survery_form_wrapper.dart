import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:survey_form/survey_form.dart';
import 'package:survey_form/utils/extensions/context_utility.dart';

@RoutePage()
class CustomSurveyFormWrapperPage extends StatelessWidget {
  final bool isEditing;

  const CustomSurveyFormWrapperPage({
    super.key,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {
    final serviceDefinition = context.repository<ServiceDefinitionModel,
        ServiceDefinitionSearchModel>(context);

    final service =
        context.repository<ServiceModel, ServiceSearchModel>(context);

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
        BlocProvider(create: (_) => LocationBloc(location: Location()))
      ],
      child: const AutoRouter(),
    );
  }
}
