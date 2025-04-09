import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/data/repositories/local/individual_global_search.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:survey_form/blocs/service.dart';
import 'package:survey_form/blocs/service_definition.dart';
import 'package:survey_form/models/entities/service.dart';
import 'package:survey_form/models/entities/service_definition.dart';

import '../../utils/extensions/extensions.dart';

@RoutePage()
class BeneficiaryRegistrationWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  final BeneficiaryRegistrationState initialState;

  const BeneficiaryRegistrationWrapperPage({
    super.key,
    required this.initialState,
  });

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final beneficiaryType = RegistrationDeliverySingleton().beneficiaryType;
    final individual =
        context.repository<IndividualModel, IndividualSearchModel>(context);

    final household =
        context.repository<HouseholdModel, HouseholdSearchModel>(context);

    final householdMember = context
        .repository<HouseholdMemberModel, HouseholdMemberSearchModel>(context);

    final serviceDefinition = context.repository<ServiceDefinitionModel,
        ServiceDefinitionSearchModel>(context);
    final service =
    context.repository<ServiceModel, ServiceSearchModel>(context);

    final projectBeneficiary = context.repository<ProjectBeneficiaryModel,
        ProjectBeneficiarySearchModel>(context);
    final task = context.repository<TaskModel, TaskSearchModel>(context);
    final sideEffect =
        context.repository<SideEffectModel, SideEffectSearchModel>(context);
    final referral =
        context.repository<ReferralModel, ReferralSearchModel>(context);

    final individualGlobalSearch =
        context.read<IndividualGlobalSearchRepository>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ServiceBloc(
            const ServiceEmptyState(),
            serviceDataRepository: service,
          ),
        ),
        BlocProvider(
          create: (_) => ServiceDefinitionBloc(
            const ServiceDefinitionEmptyState(),
            serviceDefinitionDataRepository: serviceDefinition,
          )..add(const ServiceDefinitionFetchEvent()),
        ),
        BlocProvider(
          create: (_) => HouseholdOverviewBloc(
              HouseholdOverviewState(
                householdMemberWrapper: HouseholdMemberWrapper(
                  household: initialState.householdModel,
                  headOfHousehold: initialState.maybeWhen(
                      orElse: () => null,
                      editHousehold: (addressModel,
                          householdModel,
                          individualModel,
                          registrationDate,
                          projectBeneficiaryModel,
                          parentClientReferenceId,
                          loading,
                          headOfHousehold) =>
                      headOfHousehold),
                  members: initialState.maybeWhen(
                    orElse: () => null,
                    editHousehold: (addressModel,
                        householdModel,
                        individualModel,
                        registrationDate,
                        projectBeneficiaryModel,
                        parentClientReferenceId,
                        loading,
                        headOfHousehold) =>
                    individualModel,
                  ),
                  projectBeneficiaries: initialState.maybeWhen(
                    orElse: () => null,
                    editHousehold: (addressModel,
                        parentClientReferenceId,
                        householdModel,
                        individualModel,
                        registrationDate,
                        projectBeneficiaryModel,
                        loading,
                        headOfHousehold) =>
                    projectBeneficiaryModel != null
                        ? [projectBeneficiaryModel]
                        : [],
                  ),
                ),
              ),
              individualRepository: individual,
              householdRepository: household,
              householdMemberRepository: householdMember,
              projectBeneficiaryRepository: projectBeneficiary,
              beneficiaryType: RegistrationDeliverySingleton().beneficiaryType!,
              taskDataRepository: task,
              sideEffectDataRepository: sideEffect,
              individualGlobalSearchRepository: individualGlobalSearch,
              referralDataRepository: referral,
            serviceDataRepository: service,
          )
            ..add(HouseholdOverviewReloadEvent(
                projectId: RegistrationDeliverySingleton().selectedProject!.id,
                projectBeneficiaryType:
                RegistrationDeliverySingleton().beneficiaryType!)),
    )
      ],

      child: BlocProvider(
        create: (context) => BeneficiaryRegistrationBloc(
          initialState,
          individualRepository: individual,
          householdRepository: household,
          householdMemberRepository: householdMember,
          projectBeneficiaryRepository: projectBeneficiary,
          taskDataRepository: task,
          beneficiaryType: beneficiaryType!,
        ),
        child: this,
      ),
    );
  }
}
