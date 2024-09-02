import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
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
    return Scaffold(
      body: PanelCard(
          title: localizations.translate(i18.complaints.acknowledgementLabel),
          type: PanelType.success,
          additionalDetails: [
            Text("${localizations.translate(
                i18.complaints.acknowledgementSubLabelMain)}"
                "\n${localizations.translate(
                i18.complaints.acknowledgementSubLabelSub)}"),
          ],
          description: localizations.translate(
            i18.complaints.acknowledgementDescription,
          ),
          actions: [
            Button(
              label: localizations.translate(
                  i18.complaints.acknowledgementAction),
              onPressed: () => context.router.maybePop(),
              type: ButtonType.primary,
              size: ButtonSize.large,
            )
          ],
      ),
    );
  }
}
