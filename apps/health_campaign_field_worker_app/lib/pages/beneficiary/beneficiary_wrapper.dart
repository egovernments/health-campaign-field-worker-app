import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/search_households/search_households.dart';
import '../../data/network_manager.dart';
import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/individual.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/task.dart';

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
    final networkManager = context.read<NetworkManager>();
    final task = networkManager.repository<TaskModel, TaskSearchModel>(context);
    final individual = networkManager
        .repository<IndividualModel, IndividualSearchModel>(context);

    final household = networkManager
        .repository<HouseholdModel, HouseholdSearchModel>(context);

    final householdMember = networkManager
        .repository<HouseholdMemberModel, HouseholdMemberSearchModel>(context);

    final projectBeneficiary = networkManager.repository<
        ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HouseholdOverviewBloc(
            HouseholdOverviewState(
              householdMemberWrapper: wrapper,
            ),
            individualRepository: individual,
            householdRepository: household,
            householdMemberRepository: householdMember,
            projectBeneficiaryRepository: projectBeneficiary,
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
      ],
      child: const AutoRouter(),
    );
    ;
  }
}
