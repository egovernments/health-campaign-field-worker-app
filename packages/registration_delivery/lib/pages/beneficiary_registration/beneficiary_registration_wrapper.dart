import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/utils.dart';

@RoutePage()
class BeneficiaryRegistrationWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  final BeneficiaryRegistrationState initialState;

  const BeneficiaryRegistrationWrapperPage({
    Key? key,
    required this.initialState,
  }) : super(key: key);

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

    final projectBeneficiary = context.repository<ProjectBeneficiaryModel,
        ProjectBeneficiarySearchModel>(context);

    return BlocProvider(
      create: (context) => BeneficiaryRegistrationBloc(
        initialState,
        individualRepository: individual,
        householdRepository: household,
        householdMemberRepository: householdMember,
        projectBeneficiaryRepository: projectBeneficiary,
        beneficiaryType: beneficiaryType!,
      ),
      child: this,
    );
  }
}
