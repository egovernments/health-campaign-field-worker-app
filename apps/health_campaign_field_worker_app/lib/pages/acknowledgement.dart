import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';
import '../router/app_router.dart';

class AcknowledgementPage extends LocalizedStatefulWidget {
  const AcknowledgementPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<AcknowledgementPage> createState() => _AcknowledgementPageState();
}

class _AcknowledgementPageState extends LocalizedState<AcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DigitAcknowledgement.success(
        action: () => context.router.pop(),
        actionLabel:
            localizations.translate(i18.acknowledgementSuccess.actionLabelText),
        description: localizations.translate(
          i18.acknowledgementSuccess.acknowledgementDescriptionText,
        ),
        label: localizations
            .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
      ),
    );
  }
}
