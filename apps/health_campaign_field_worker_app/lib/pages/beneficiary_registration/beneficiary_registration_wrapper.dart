import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../data/network_manager.dart';
import '../../models/data_model.dart';

class BeneficiaryRegistrationWrapperPage extends StatelessWidget {
  const BeneficiaryRegistrationWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkManager = context.read<NetworkManager>();
    final individual = networkManager
        .repository<IndividualModel, IndividualSearchModel>(context);

    final household = networkManager
        .repository<HouseholdModel, HouseholdSearchModel>(context);

    final householdMember = networkManager
        .repository<HouseholdMemberModel, HouseholdMemberSearchModel>(context);

    return BlocProvider(
      create: (context) => BeneficiaryRegistrationBloc(
        const BeneficiaryRegistrationState(),
        individualRepository: individual,
        householdRepository: household,
        householdMemberSearchRepository: householdMember,
      ),
      child: const AutoRouter(),
    );
  }
}
