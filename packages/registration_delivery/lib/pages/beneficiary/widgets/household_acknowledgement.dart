import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../../router/registration_delivery_router.gm.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

@RoutePage()
class HouseholdAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const HouseholdAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<HouseholdAcknowledgementPage> createState() =>
      HouseholdAcknowledgementPageState();
}

class HouseholdAcknowledgementPageState
    extends LocalizedState<HouseholdAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
          builder: (context, householdState) {
            return DigitAcknowledgement.success(
              action: () {
                context
                    .read<SearchHouseholdsBloc>().add(const SearchHouseholdsEvent.clear());
                final parent = context.router.parent() as StackRouter;
                // Pop twice to navigate back to the previous screen
                parent.popUntilRoot();
              },
              secondaryAction: () {
                final wrapper = context
                    .read<HouseholdOverviewBloc>()
                    .state
                    .householdMemberWrapper;

                context.router.popAndPush(
                  BeneficiaryWrapperRoute(wrapper: wrapper),
                );
              },
              enableViewHousehold: widget.enableViewHousehold ?? false,
              secondaryLabel: localizations.translate(
                i18.householdDetails.viewHouseHoldDetailsAction,
              ),
              actionLabel: localizations
                  .translate(i18.acknowledgementSuccess.actionLabelText),
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
