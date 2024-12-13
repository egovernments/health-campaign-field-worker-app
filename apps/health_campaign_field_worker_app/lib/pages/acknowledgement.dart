import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/digit_table_card.dart';
import '../widgets/localized.dart';

@RoutePage()
class AcknowledgementPage extends LocalizedStatefulWidget {
  bool isDataRecordSuccess;
  String? label;
  String? description;
  Map<String, dynamic>? descriptionTableData;
  AcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  @override
  State<AcknowledgementPage> createState() => _AcknowledgementPageState();
}

class _AcknowledgementPageState extends LocalizedState<AcknowledgementPage> {
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
        additionWidgets: widget.isDataRecordSuccess
            ? [
                DigitTableCard(
                  element: widget.descriptionTableData ?? {},
                )
              ]
            : null,
        actions: [
          DigitButton(
              label: localizations
                  .translate(i18.acknowledgementSuccess.actionLabelText),
              onPressed: () {
                context.router.maybePop();
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.large),
        ],
      ),
      bottomNavigationBar: Offstage(
        offstage: !widget.isDataRecordSuccess,
        // Show the bottom navigation bar if `isDataRecordSuccess` is true
        child: SizedBox(
          height: 150,
          child: DigitCard(
            margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
            children: [
              DigitButton(
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                label: localizations
                    .translate(i18.acknowledgementSuccess.goToHome),
                onPressed: () {
                  context.router.popUntilRouteWithName(HomeRoute.name);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              DigitButton(
                  label: localizations
                      .translate(i18.acknowledgementSuccess.downloadmoredata),
                  onPressed: () {
                    context.router.popAndPush(BoundarySelectionRoute());
                  },
                  type: DigitButtonType.primary,
                  size: DigitButtonSize.large)
            ],
          ),
        ),
      ),
    );
  }
}
