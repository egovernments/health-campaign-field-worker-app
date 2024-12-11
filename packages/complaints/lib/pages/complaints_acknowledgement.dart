import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';

import 'package:flutter/material.dart';


import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

@RoutePage()
class ComplaintsAcknowledgementPage extends LocalizedStatefulWidget {
  const ComplaintsAcknowledgementPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsAcknowledgementPage> createState() =>
      ComplaintsAcknowledgementPageState();
}

class ComplaintsAcknowledgementPageState
    extends LocalizedState<ComplaintsAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    final theme= Theme.of(context);
    final textTheme =theme.digitTextTheme(context);
    return Scaffold(
      body: PanelCard(
          title: localizations.translate(i18.complaints.acknowledgementLabel),
          type: PanelType.success,
          additionalDetails: [
            Text(localizations.translate(
                i18.complaints.acknowledgementSubLabelMain)
                ,
              style: textTheme.bodyS.copyWith(
                color: theme.colorTheme.paper.primary
              ),
            ),
            Text(localizations.translate(
                i18.complaints.acknowledgementSubLabelSub),
              style: textTheme.bodyS.copyWith(
                  color: theme.colorTheme.paper.primary
              ),
            ),
          ],
          description: localizations.translate(
            i18.complaints.acknowledgementDescription,
          ),
          actions: [
            DigitButton(
              label: localizations.translate(
                  i18.complaints.acknowledgementAction),
              onPressed: () => context.router.maybePop(),
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
            )
          ],
      ),
    );
  }
}
