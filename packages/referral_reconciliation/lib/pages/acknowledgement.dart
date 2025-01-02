import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

@RoutePage()
class ReferralReconAcknowledgementPage extends LocalizedStatefulWidget {
  final bool isDataRecordSuccess;
  final String? label;
  final String? description;
  final Map<String, dynamic>? descriptionTableData;
  const ReferralReconAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  @override
  State<ReferralReconAcknowledgementPage> createState() =>
      _AcknowledgementPageState();
}

class _AcknowledgementPageState
    extends LocalizedState<ReferralReconAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: PanelCard(
          type: PanelType.success,
          title: widget.label ??
              localizations.translate(
                i18.acknowledgementSuccess.acknowledgementLabelText,
              ),
          description: widget.description ??
              localizations.translate(
                i18.acknowledgementSuccess.acknowledgementDescriptionText,
              ),
          actions: [
            DigitButton(
              label: localizations
                  .translate(i18.acknowledgementSuccess.actionLabelText),
              onPressed: () {
                context.router.popUntilRoot();
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
            )
          ]),
      bottomNavigationBar: Offstage(
        offstage: !widget.isDataRecordSuccess,
        // Show the bottom navigation bar if `isDataRecordSuccess` is true
        child: SizedBox(
          height: 150,
          child: Column(
            children: [
              DigitButton(
                size: DigitButtonSize.large,
                type: DigitButtonType.primary,
                mainAxisSize: MainAxisSize.max,
                label: localizations
                    .translate(i18.acknowledgementSuccess.goToHome),
                onPressed: () {
                  context.router.popUntilRoot();
                },
              ),
              const SizedBox(
                height: 12,
              ),
              DigitButton(
                size: DigitButtonSize.large,
                type: DigitButtonType.secondary,
                mainAxisSize: MainAxisSize.max,
                onPressed: () {
                  context.router.popUntilRoot();
                },
                label: localizations
                    .translate(i18.acknowledgementSuccess.downloadmoredata),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
