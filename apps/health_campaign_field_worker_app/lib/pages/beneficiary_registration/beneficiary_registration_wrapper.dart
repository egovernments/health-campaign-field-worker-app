import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../blocs/search_households/search_households.dart';
import '../../data/network_manager.dart';
import '../../models/data_model.dart';

class BeneficiaryRegistrationWrapperPage extends StatelessWidget {
  final String? searchQuery;
  final bool isEditing;
  final HouseholdMemberWrapper? householdMemberWrapper;

  const BeneficiaryRegistrationWrapperPage({
    Key? key,
    this.searchQuery,
    this.isEditing = false,
    this.householdMemberWrapper,
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
      create: (context) => BeneficiaryRegistrationBloc(
        BeneficiaryRegistrationState(
          searchQuery: searchQuery,
          householdModel: householdMemberWrapper?.household,
          individualModel: householdMemberWrapper?.headOfHousehold,
          isEditing: isEditing,
          registrationDate:
              householdMemberWrapper?.projectBeneficiary.dateOfRegistrationTime,
          addressModel: householdMemberWrapper?.household.address,
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
