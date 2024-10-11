import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/household_overview/household_overview.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

class SchoolAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewSchool;

  const SchoolAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewSchool,
  });

  @override
  State<SchoolAcknowledgementPage> createState() =>
      _HouseholdAcknowledgementPageState();
}

class _HouseholdAcknowledgementPageState
    extends LocalizedState<SchoolAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
          builder: (context, householdState) {
            return DigitAcknowledgement.success(
              action: () {
                final parent = context.router.parent() as StackRouter;
                // Pop twice to navigate back to the previous screen
                parent.popUntilRouteWithName(SelectBeneficiaryRoute.name);
                parent.push(const SchoolSelectionRoute());
              },
              secondaryAction: () {
                final wrapper = context
                    .read<HouseholdOverviewBloc>()
                    .state
                    .householdMemberWrapper;

                context.router.popAndPush(
                  BeneficiaryWrapperRoute(
                    wrapper: wrapper,
                    children: [SchoolOverviewRoute()],
                  ),
                );
              },
              enableViewHousehold: widget.enableViewSchool ?? false,
              secondaryLabel: localizations.translate(
                i18.schoolDetails.viewSchoolDetailsAction,
              ),
              actionLabel: localizations.translate(
                i18.schoolDetails.schoolActionLabelText,
              ),
              description: localizations.translate(
                i18.acknowledgementSuccess.acknowledgementDescriptionText,
              ),
              label: localizations.translate(
                i18.acknowledgementSuccess.acknowledgementLabelText,
              ),
            );
          },
        ),
      ),
    );
  }
}
