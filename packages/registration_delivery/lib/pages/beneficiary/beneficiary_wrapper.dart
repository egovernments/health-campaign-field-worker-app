import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/household_overview/household_overview.dart';
import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/individual.dart';
import '../../models/entities/referral.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/task.dart';
import '../../utils/extensions/extensions.dart';

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
    final task = context.repository<TaskModel, TaskSearchModel>();
    final individual =
        context.repository<IndividualModel, IndividualSearchModel>();

    final household =
        context.repository<HouseholdModel, HouseholdSearchModel>();

    final householdMember =
        context.repository<HouseholdMemberModel, HouseholdMemberSearchModel>();

    final projectBeneficiary = context
        .repository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>();
    final serviceDefinition = context
        .repository<ServiceDefinitionModel, ServiceDefinitionSearchModel>();
    final service = context.repository<ServiceModel, ServiceSearchModel>();
    final sideEffect =
        context.repository<SideEffectModel, SideEffectSearchModel>();
    final facilityRepository =
        context.read<LocalRepository<FacilityModel, FacilitySearchModel>>();

    final projectFacilityRepository = context.read<
        LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>();
    final referral = context.repository<ReferralModel, ReferralSearchModel>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ServiceBloc(
            const ServiceEmptyState(),
            serviceDataRepository: service,
          ),
        ),
        BlocProvider(
          create: (_) => FacilityBloc(
            facilityLocalRepository: facilityRepository,
            projectFacilityLocalRepository: projectFacilityRepository,
          )..add(
              FacilityLoadForProjectEvent(
                projectId: context.selectedProject.id,
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
              taskDataRepository: task,
              sideEffectDataRepository: sideEffect,
              referralDataRepository: referral,
              beneficiaryType: context.beneficiaryType),
        ),
        BlocProvider(
          create: (_) => DeliverInterventionBloc(
            DeliverInterventionState(
              isEditing: isEditing,
            ),
            taskRepository: task,
          ),
        ),
        BlocProvider(
          create: (_) => ReferralBloc(
            ReferralState(
              isEditing: isEditing,
            ),
            referralRepository: referral,
          ),
        ),
        BlocProvider(
          create: (_) => SideEffectsBloc(
            SideEffectsState(
              isEditing: isEditing,
            ),
            sideEffectRepository: sideEffect,
          ),
        ),
      ],
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (context, houseHoldOverviewState) {
          return BlocProvider(
            lazy: false,
            create: (_) => DeliverInterventionBloc(
              DeliverInterventionState(
                isEditing: isEditing,
              ),
              taskRepository: task,
            )..add(DeliverInterventionSearchEvent(TaskSearchModel(
                projectBeneficiaryClientReferenceId: houseHoldOverviewState
                    .householdMemberWrapper.projectBeneficiaries
                    .map((e) => e.clientReferenceId)
                    .toList(),
              ))),
            child: BlocProvider(
              lazy: false,
              create: (_) => ReferralBloc(
                ReferralState(
                  isEditing: isEditing,
                ),
                referralRepository: referral,
              )..add(ReferralSearchEvent(ReferralSearchModel(
                  projectBeneficiaryClientReferenceId: houseHoldOverviewState
                      .householdMemberWrapper.projectBeneficiaries
                      .map((e) => e.clientReferenceId)
                      .toList(),
                ))),
              child: BlocProvider(
                lazy: false,
                create: (_) => SideEffectsBloc(
                  SideEffectsState(
                    isEditing: isEditing,
                  ),
                  sideEffectRepository: sideEffect,
                )..add(SideEffectsSearchEvent(SideEffectSearchModel(
                    taskClientReferenceId: houseHoldOverviewState
                        .householdMemberWrapper.tasks
                        ?.map((e) => e.clientReferenceId)
                        .toList(),
                  ))),
                child: const AutoRouter(),
              ),
            ),
          );
        },
      ),
    );
  }
}
