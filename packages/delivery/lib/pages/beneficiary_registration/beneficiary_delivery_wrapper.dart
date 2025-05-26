import 'package:auto_route/auto_route.dart';

import 'package:digit_data_model/models/entities/individual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/beneficiary_registration/beneficiary_registration.dart';

import 'package:registration/models/entities/household.dart';
import 'package:registration/models/entities/household_member.dart';
import 'package:registration/models/entities/project_beneficiary.dart';

import 'package:registration/utils/extensions/extensions.dart';

import '../../delivery.dart';

@RoutePage()
class BeneficiaryDeliveryWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  final BeneficiaryRegistrationState initialState;

  const BeneficiaryDeliveryWrapperPage({
    super.key,
    required this.initialState,
  });

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final beneficiaryType = DeliverySingleton().beneficiaryType;
    final individual =
        context.repository<IndividualModel, IndividualSearchModel>(context);

    final household =
        context.repository<HouseholdModel, HouseholdSearchModel>(context);

    final householdMember = context
        .repository<HouseholdMemberModel, HouseholdMemberSearchModel>(context);

    final projectBeneficiary = context.repository<ProjectBeneficiaryModel,
        ProjectBeneficiarySearchModel>(context);
    final task = context.repository<TaskModel, TaskSearchModel>(context);
    final sideEffect =
        context.repository<SideEffectModel, SideEffectSearchModel>(context);
    final referral =
        context.repository<ReferralModel, ReferralSearchModel>(context);

    final individualGlobalSearch =
        context.read<IndividualGlobalDeliverySearchRepository>();

    return BlocProvider(
      create: (_) => HouseholdOverviewDeliveryBloc(
          HouseholdOverviewDeliveryState(
            householdMemberDeliveryWrapper: HouseholdMemberDeliveryWrapper(
              household: initialState.householdModel,
              headOfHousehold: initialState.maybeWhen(
                  orElse: () => null,
                  editHousehold: (addressModel,
                          householdModel,
                          individualModel,
                          registrationDate,
                          projectBeneficiaryModel,
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
                        loading,
                        headOfHousehold) =>
                    individualModel,
              ),
              projectBeneficiaries: initialState.maybeWhen(
                orElse: () => null,
                editHousehold: (addressModel,
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
          beneficiaryType: DeliverySingleton().beneficiaryType!,
          taskDataRepository: task,
          sideEffectDataRepository: sideEffect,
          individualGlobalSearchRepository: individualGlobalSearch,
          referralDataRepository: referral)
        ..add(HouseholdOverviewReloadEvent(
            projectId: DeliverySingleton().selectedProject!.id,
            projectBeneficiaryType: DeliverySingleton().beneficiaryType!)),
      child: BlocProvider(
        create: (context) => BeneficiaryRegistrationBloc(
          initialState,
          individualRepository: individual,
          householdRepository: household,
          householdMemberRepository: householdMember,
          projectBeneficiaryRepository: projectBeneficiary,
          // taskDataRepository: task,
          beneficiaryType: beneficiaryType!,
        ),
        child: this,
      ),
    );
  }
}
