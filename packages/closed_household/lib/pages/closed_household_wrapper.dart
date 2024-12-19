import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/closed_household.dart';
import 'package:closed_household/closed_household.dart';
import 'package:closed_household/utils/extensions/extensions.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/task.dart';

@RoutePage()
class ClosedHouseholdWrapperPage extends StatelessWidget {
  const ClosedHouseholdWrapperPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return LocationBloc(location: Location())
              ..add(const LoadLocationEvent());
          },
          lazy: false,
        ),
        BlocProvider(
          create: (_) {
            return ClosedHouseholdBloc(
              const ClosedHouseholdState(),
              householdMemberRepository: context.repository<
                  HouseholdMemberModel, HouseholdMemberSearchModel>(context),
              householdRepository: context
                  .repository<HouseholdModel, HouseholdSearchModel>(context),
              individualRepository: context
                  .repository<IndividualModel, IndividualSearchModel>(context),
              projectBeneficiaryRepository: context.repository<
                  ProjectBeneficiaryModel,
                  ProjectBeneficiarySearchModel>(context),
              taskRepository:
                  context.repository<TaskModel, TaskSearchModel>(context),
            );
          },
          lazy: false,
        ),
      ],
      child: BlocBuilder<ClosedHouseholdBloc, ClosedHouseholdState>(
        builder: (context, houseHoldOverviewState) {
          return const AutoRouter();
        },
      ),
    );
  }
}
