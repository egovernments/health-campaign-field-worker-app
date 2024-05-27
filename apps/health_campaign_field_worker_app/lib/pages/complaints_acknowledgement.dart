import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';
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
      _ComplaintsAcknowledgementPageState();
}

class _ComplaintsAcknowledgementPageState
    extends LocalizedState<ComplaintsAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DigitAcknowledgement.success(
        action: () {
          context.router.maybePop();
        },
        actionLabel:
            localizations.translate(i18.complaints.acknowledgementAction),
        description: localizations.translate(
          i18.complaints.acknowledgementDescription,
        ),
        label: localizations.translate(i18.complaints.acknowledgementLabel),
        subLabel:
            "${localizations.translate(i18.complaints.acknowledgementSubLabelMain)}\n${localizations.translate(i18.complaints.acknowledgementSubLabelSub)}",
      ),
    );
  }
}
