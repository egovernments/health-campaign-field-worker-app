import 'package:auto_route/auto_route.dart';
import 'package:closed_household/blocs/closed_household.dart';
import 'package:closed_household/models/entities/user_action.dart';
import 'package:closed_household/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@RoutePage()
class ClosedHouseholdWrapperPage extends StatelessWidget {
  final bool isEditing;

  const ClosedHouseholdWrapperPage({
    super.key,
    this.isEditing = false,
  });

  @override
  Widget build(BuildContext context) {

    final closedHouseholdRepo =
    context.repository<UserActionModel, UserActionSearchModel>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ClosedHouseholdBloc(
            ClosedHouseholdState(
              isEditing: isEditing,
            ),
            closedHouseholdRepository: closedHouseholdRepo,
          ),
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
