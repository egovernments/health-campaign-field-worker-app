import 'dart:async';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/household_overview/household_overview.dart';
import '../../../blocs/search_households/search_households.dart';
import '../../../models/entities/task.dart';
import '../../../router/app_router.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;

class HouseholdAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const HouseholdAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<HouseholdAcknowledgementPage> createState() =>
      _HouseholdAcknowledgementPageState();
}

class _HouseholdAcknowledgementPageState
    extends LocalizedState<HouseholdAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (context, householdState) {
          return DigitAcknowledgement.success(
            action: () {
              final parent = context.router.parent() as StackRouter;
              // Pop twice to navigate back to the previous screen
              parent
                ..pop()
                ..pop();
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
            label: localizations
                .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
          );
        },
      ),
    );
  }
}
