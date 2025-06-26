import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/registration_component_keys.dart' as registration_keys;
import '../../../widgets/localized.dart';
import '../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../router/registration_delivery_router.gm.dart';

@RoutePage()
class BeneficiaryAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const BeneficiaryAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<BeneficiaryAcknowledgementPage> createState() =>
      BeneficiaryAcknowledgementPageState();
}

class BeneficiaryAcknowledgementPageState
    extends LocalizedState<BeneficiaryAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    final pageKey =
        BeneficiaryAcknowledgementRoute.name.replaceAll('Route', '');
    final beneficiaryAcknowledgementTemplate =
        RegistrationDeliverySingleton().templateConfigs?[pageKey];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(spacer2),
        child: PanelCard(
          type: PanelType.success,
          title: localizations.translate(beneficiaryAcknowledgementTemplate
                  ?.properties?[registration_keys
                      .acknowledgementKeys.acknowledgmentTitleKey]
                  ?.label ??
              i18.acknowledgementSuccess.acknowledgementLabelText),
          actions: [
            if ((widget.enableViewHousehold ?? false) &&
                (beneficiaryAcknowledgementTemplate
                        ?.properties?[
                            registration_keys.commonKeys.primaryButtonKey]
                        ?.hidden !=
                    true))
              DigitButton(
                  label: localizations.translate(
                    beneficiaryAcknowledgementTemplate
                            ?.properties?[
                                registration_keys.commonKeys.primaryButtonKey]
                            ?.label ??
                        i18.householdDetails.viewHouseHoldDetailsAction,
                  ),
                  onPressed: () {
                    // [TODO: Need to come back, View Household Details on Pressed failing due to no data in SearchBlocWrapper

                    context.router.popAndPush(
                      HouseholdOverviewRoute()
                    );
                  },
                  type: DigitButtonType.primary,
                  size: DigitButtonSize.large),
            if ((beneficiaryAcknowledgementTemplate
                    ?.properties?[
                        registration_keys.commonKeys.secondaryButtonKey]
                    ?.hidden !=
                true))
              DigitButton(
                  label: localizations.translate(
                      beneficiaryAcknowledgementTemplate
                              ?.properties?[registration_keys
                                  .commonKeys.secondaryButtonKey]
                              ?.label ??
                          i18.acknowledgementSuccess.actionLabelText),
                  onPressed: () => context.router.maybePop(),
                  type: DigitButtonType.secondary,
                  size: DigitButtonSize.large),
          ],
          description: beneficiaryAcknowledgementTemplate
                      ?.properties?[registration_keys
                          .acknowledgementKeys.acknowledgmentDescriptionKey]
                      ?.hidden ==
                  true
              ? ""
              : localizations.translate(
                  beneficiaryAcknowledgementTemplate
                          ?.properties?[registration_keys
                              .acknowledgementKeys.acknowledgmentDescriptionKey]
                          ?.label ??
                      i18.acknowledgementSuccess.acknowledgementDescriptionText,
                ),
        ),
      ),
    );
  }
}
