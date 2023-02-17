import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/search_households/search_households.dart';
import '../../data/network_manager.dart';
import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/individual.dart';
import '../../models/entities/project_beneficiary.dart';

class BeneficiaryWrapperPage extends StatelessWidget {
  final HouseholdMemberWrapper wrapper;

  const BeneficiaryWrapperPage({
    Key? key,
    required this.wrapper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkManager = context.read<NetworkManager>();
    final individual = networkManager
        .repository<IndividualModel, IndividualSearchModel>(context);

    final household = networkManager
        .repository<HouseholdModel, HouseholdSearchModel>(context);

    final householdMember = networkManager
        .repository<HouseholdMemberModel, HouseholdMemberSearchModel>(context);

    final projectBeneficiary = networkManager.repository<
        ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>(context);

    return BlocProvider(
      create: (_) => HouseholdOverviewBloc(
        HouseholdOverviewState(
          householdMemberWrapper: wrapper,
        ),
        individualRepository: individual,
        householdRepository: household,
        householdMemberRepository: householdMember,
        projectBeneficiaryRepository: projectBeneficiary,
      ),
      child: const AutoRouter(),
    );
  }
}
