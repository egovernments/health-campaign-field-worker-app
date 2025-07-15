import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

@RoutePage()
class BeneficiaryErrorPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const BeneficiaryErrorPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<BeneficiaryErrorPage> createState() => BeneficiaryErrorPageState();
}

class BeneficiaryErrorPageState extends LocalizedState<BeneficiaryErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(spacer2),
        child: PanelCard(
          type: PanelType.error,
          title: localizations.translate(i18.common.failedToRegister),
          description: localizations.translate(i18.common.failedToRegisterDesc),
          actions: [
            DigitButton(
                label: localizations
                    .translate(i18.acknowledgementSuccess.actionLabelText),
                onPressed: () => context.router.maybePop(),
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large),
          ],
        ),
      ),
    );
  }
}
