import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/data/repositories/local/individual_global_search.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../blocs/unique_id/unique_id.dart';
import '../../models/entities/unique_id_pool.dart';
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

    final uniqueIdRepo = context
        .read<LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>>();

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
        context.read<IndividualGlobalSearchRepository>();

    return BlocProvider(
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
          beneficiaryType: RegistrationDeliverySingleton().beneficiaryType!,
          taskDataRepository: task,
          sideEffectDataRepository: sideEffect,
          individualGlobalSearchRepository: individualGlobalSearch,
          referralDataRepository: referral)
        ..add(HouseholdOverviewReloadEvent(
            projectId: RegistrationDeliverySingleton().selectedProject!.id,
            projectBeneficiaryType:
                RegistrationDeliverySingleton().beneficiaryType!)),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UniqueIdBloc(uniqueIdPoolLocalRepository: uniqueIdRepo),
          ),
          BlocProvider(
            create: (context) => BeneficiaryRegistrationBloc(initialState,
                individualRepository: individual,
                householdRepository: household,
                householdMemberRepository: householdMember,
                projectBeneficiaryRepository: projectBeneficiary,
                taskDataRepository: task,
                beneficiaryType: beneficiaryType!,
                uniqueIdPoolLocalRepository: uniqueIdRepo),
            child: this,
          ),
        ],
        child: this,
      ),
    );
  }
}
