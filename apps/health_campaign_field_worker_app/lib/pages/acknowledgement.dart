import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';
import '../widgets/table_card/digit_table_card.dart';

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
        additionWidgets: widget.isDataRecordSuccess
            ? [
                DigitTableCard(
                  element: widget.descriptionTableData ?? {},
                )
              ]
            : null,
        actions: (!widget.isDataRecordSuccess)
            ? [
                DigitButton(
                  isDisabled: widget.isDataRecordSuccess,
                  type: DigitButtonType.primary,
                  size: DigitButtonSize.large,
                  label: localizations
                      .translate(i18.acknowledgementSuccess.actionLabelText),
                  onPressed: () {
                    context.router.maybePop();
                  },
                ),
              ]
            : null,
      ),
      bottomNavigationBar: Offstage(
        offstage: !widget.isDataRecordSuccess,
        // Show the bottom navigation bar if `isDataRecordSuccess` is true
        child: DigitCard(
            margin: const EdgeInsets.only(top: spacer2),
            padding: const EdgeInsets.all(spacer2),
            children: [
              DigitButton(
                mainAxisSize: MainAxisSize.max,
                label: localizations
                    .translate(i18.acknowledgementSuccess.goToHome),
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                onPressed: () {
                  context.router.popUntilRouteWithName(HomeRoute.name);
                },
              ),
              DigitButton(
                type: DigitButtonType.secondary,
                mainAxisSize: MainAxisSize.max,
                size: DigitButtonSize.large,
                onPressed: () {
                  context.router.popAndPush(BoundarySelectionRoute());
                },
                label: localizations
                    .translate(i18.acknowledgementSuccess.downloadmoredata),
              ),
            ]),
      ),
    );
  }
}
