import 'package:auto_route/auto_route.dart';
import 'package:delivery/blocs/search_households/search_households.dart';
import 'package:delivery/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery/blocs/household_overview/household_overview.dart';

import 'package:delivery/data/repositories/local/individual_global_search.dart';
import 'package:registration/models/entities/household.dart';
import 'package:registration/models/entities/household_member.dart';
import 'package:registration/models/entities/project_beneficiary.dart';
import 'package:registration/utils/extensions/extensions.dart';

import 'package:survey_form/survey_form.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/referral_management/referral_management.dart';
import '../../blocs/side_effects/side_effects.dart';
import '../../models/entities/referral.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/task.dart';

@RoutePage()
class DeliveryBeneficiaryWrapperPage extends StatelessWidget {
  final HouseholdMemberDeliveryWrapper wrapper;
  final bool isEditing;

  const DeliveryBeneficiaryWrapperPage({
    super.key,
    required this.wrapper,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {
    final task = context.repository<TaskModel, TaskSearchModel>(context);
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
    final sideEffect =
        context.repository<SideEffectModel, SideEffectSearchModel>(context);
    final facilityRepository =
        context.read<LocalRepository<FacilityModel, FacilitySearchModel>>();

    final projectFacilityRepository = context.read<
        LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>();
    final referral =
        context.repository<ReferralModel, ReferralSearchModel>(context);

    final individualGlobalSearchRepository =
        context.read<IndividualGlobalDeliverySearchRepository>();

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
                projectId: DeliverySingleton().projectId!,
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
          create: (_) => HouseholdOverviewDeliveryBloc(
              HouseholdOverviewDeliveryState(
                householdMemberDeliveryWrapper: wrapper,
              ),
              individualRepository: individual,
              householdRepository: household,
              householdMemberRepository: householdMember,
              projectBeneficiaryRepository: projectBeneficiary,
              taskDataRepository: task,
              sideEffectDataRepository: sideEffect,
              referralDataRepository: referral,
              individualGlobalSearchRepository:
                  individualGlobalSearchRepository,
              beneficiaryType: DeliverySingleton().beneficiaryType!),
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
      child: BlocBuilder<HouseholdOverviewDeliveryBloc,
          HouseholdOverviewDeliveryState>(
        builder: (context, HouseholdOverviewDeliveryState) {
          return BlocProvider(
            lazy: false,
            create: (_) => DeliverInterventionBloc(
              DeliverInterventionState(
                isEditing: isEditing,
              ),
              taskRepository: task,
            )..add(DeliverInterventionSearchEvent(
                  taskSearch: TaskSearchModel(
                projectBeneficiaryClientReferenceId:
                    HouseholdOverviewDeliveryState
                        .householdMemberDeliveryWrapper.projectBeneficiaries
                        ?.where((element) =>
                            element.projectId == DeliverySingleton().projectId)
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
                  projectBeneficiaryClientReferenceId:
                      HouseholdOverviewDeliveryState
                          .householdMemberDeliveryWrapper.projectBeneficiaries
                          ?.map((e) => e.clientReferenceId)
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
                    taskClientReferenceId: HouseholdOverviewDeliveryState
                        .householdMemberDeliveryWrapper.tasks
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
