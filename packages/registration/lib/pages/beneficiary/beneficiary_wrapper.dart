import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/household_overview/household_overview.dart';
import 'package:registration/blocs/search_households/search_households.dart';
import 'package:registration/data/repositories/local/individual_global_search.dart';
import 'package:registration/models/entities/household.dart';
import 'package:registration/models/entities/household_member.dart';
import 'package:registration/utils/extensions/extensions.dart';
import 'package:registration/utils/utils.dart';
import 'package:survey_form/survey_form.dart';
import '../../models/entities/project_beneficiary.dart';

@RoutePage()
class BeneficiaryWrapperPage extends StatelessWidget {
  final HouseholdMemberWrapper wrapper;
  final bool isEditing;

  const BeneficiaryWrapperPage({
    super.key,
    required this.wrapper,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {
    final individual =
        context.repository<IndividualModel, IndividualSearchModel>(context);

    final household =
        context.repository<HouseholdModel, HouseholdSearchModel>(context);

    final householdMember = context
        .repository<HouseholdMemberModel, HouseholdMemberSearchModel>(context);

    final projectBeneficiary = context.repository<ProjectBeneficiaryModel,
        ProjectBeneficiarySearchModel>(context);
    final serviceDefinition = context.repository<ServiceDefinitionModel,
        ServiceDefinitionSearchModel>(context);
    final service =
        context.repository<ServiceModel, ServiceSearchModel>(context);

    final facilityRepository =
        context.read<LocalRepository<FacilityModel, FacilitySearchModel>>();

    final projectFacilityRepository = context.read<
        LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>();

    final individualGlobalSearchRepository =
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
          create: (_) => FacilityBloc(
              facilityDataRepository: facilityRepository,
              projectFacilityDataRepository: projectFacilityRepository)
            ..add(
              FacilityLoadForProjectEvent(
                projectId: RegistrationSingleton().projectId!,
              ),
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
                householdMemberWrapper: wrapper,
              ),
              individualRepository: individual,
              householdRepository: household,
              householdMemberRepository: householdMember,
              projectBeneficiaryRepository: projectBeneficiary,
              individualGlobalSearchRepository:
                  individualGlobalSearchRepository,
              beneficiaryType:
                  RegistrationSingleton().beneficiaryType!),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
