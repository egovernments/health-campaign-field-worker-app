import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/registration_delivery.dart';

import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:registration_delivery/utils/i18_key_constants.dart' as i18;
import 'package:registration_delivery/widgets/localized.dart';

@RoutePage()
class CustomHouseholdAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const CustomHouseholdAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<CustomHouseholdAcknowledgementPage> createState() =>
      CustomHouseholdAcknowledgementPageState();
}

class CustomHouseholdAcknowledgementPageState
    extends LocalizedState<CustomHouseholdAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
          builder: (context, householdState) {
            return PanelCard(
              type: PanelType.success,
              description: localizations.translate(
                i18.acknowledgementSuccess.acknowledgementDescriptionText,
              ),
              title: localizations.translate(
                i18.acknowledgementSuccess.acknowledgementLabelText,
              ),
              actions: [
                if ((widget.enableViewHousehold ?? false))
                  DigitButton(
                      label: localizations.translate(
                        i18.householdDetails.viewHouseHoldDetailsAction,
                      ),
                      isDisabled: !(widget.enableViewHousehold ?? false),
                      onPressed: () {
                        final wrapper = context
                            .read<HouseholdOverviewBloc>()
                            .state
                            .householdMemberWrapper;

                        context.router.popAndPush(
                          BeneficiaryWrapperRoute(wrapper: wrapper),
                        );
                      },
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large),
                DigitButton(
                    label: localizations
                        .translate(i18.acknowledgementSuccess.actionLabelText),
                    onPressed: () {
                      context
                          .read<SearchHouseholdsBloc>()
                          .add(const SearchHouseholdsEvent.clear());
                      final parent = context.router.parent() as StackRouter;
                      // Pop twice to navigate back to the previous screen
                      parent.popUntilRoot();
                    },
                    type: DigitButtonType.secondary,
                    size: DigitButtonSize.large),
              ],
            );
          },
        ),
      ),
    );
  }
}
