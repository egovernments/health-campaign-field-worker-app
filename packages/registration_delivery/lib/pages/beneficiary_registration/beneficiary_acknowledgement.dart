import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final pageKey = BeneficiaryAcknowledgementRoute.name.replaceAll('Route', '');
    final beneficiaryAcknowledgementTemplate = RegistrationDeliverySingleton().templateConfigs?[pageKey];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(spacer2),
        child: PanelCard(
          type: PanelType.success,
          title: localizations
              .translate(beneficiaryAcknowledgementTemplate
              ?.properties?[registration_keys.acknowledgementKeys.acknowledgmentTitleKey]?.label
              ?? i18.acknowledgementSuccess.acknowledgementLabelText),
          actions: [
            if((widget.enableViewHousehold ?? false) && (beneficiaryAcknowledgementTemplate
                ?.properties?[registration_keys.commonKeys.primaryButtonKey]?.hidden ?? false == false))
              DigitButton(
                label: localizations.translate(
                  beneficiaryAcknowledgementTemplate
                      ?.properties?[registration_keys.commonKeys.primaryButtonKey]?.label ??
                  i18.householdDetails.viewHouseHoldDetailsAction,
                ),
                onPressed: () {
                  final bloc = context.read<SearchBlocWrapper>();

                  context.router.popAndPush(
                    BeneficiaryWrapperRoute(
                      wrapper: bloc.state.householdMembers.first,
                    ),
                  );
                },
                type: DigitButtonType.primary,
                size: DigitButtonSize.large),
            if((beneficiaryAcknowledgementTemplate
                ?.properties?[registration_keys.commonKeys.secondaryButtonKey]?.hidden ?? false == false))
              DigitButton(
                label: localizations
                    .translate(beneficiaryAcknowledgementTemplate
                    ?.properties?[registration_keys.commonKeys.secondaryButtonKey]?.label ?? i18.acknowledgementSuccess.actionLabelText),
                onPressed: () => context.router.maybePop(),
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large),
          ],
          description: beneficiaryAcknowledgementTemplate
              ?.properties?[registration_keys.acknowledgementKeys.acknowledgmentTitleKey]?.hidden == true ?
          "" : localizations.translate(
            beneficiaryAcknowledgementTemplate
                ?.properties?[registration_keys.acknowledgementKeys.acknowledgmentDescriptionKey]?.label ??
            i18.acknowledgementSuccess.acknowledgementDescriptionText,
          ),
        ),
      ),
    );
  }
}
