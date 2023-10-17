import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/search_households/search_households.dart';
import '../../blocs/service/service.dart';
import '../../blocs/service_definition/service_definition.dart';
import '../../blocs/side_effects/side_effects.dart';
import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/individual.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/service.dart';
import '../../models/entities/service_definition.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/task.dart';
import '../../utils/extensions/extensions.dart';

class BeneficiaryWrapperPage extends StatelessWidget {
  final HouseholdMemberWrapper wrapper;
  final bool isEditing;

  const BeneficiaryWrapperPage({
    Key? key,
    required this.wrapper,
    this.isEditing = false,
  }) : super(key: key);

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
              householdMemberWrapper: wrapper,
            ),
            individualRepository: individual,
            householdRepository: household,
            householdMemberRepository: householdMember,
            projectBeneficiaryRepository: projectBeneficiary,
            taskDataRepository: task,
            sideEffectDataRepository: sideEffect,
          ),
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
          );
        },
      ),
    );
  }
}
