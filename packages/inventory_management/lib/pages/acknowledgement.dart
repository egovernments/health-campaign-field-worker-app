import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

@RoutePage()
class InventoryAcknowledgementPage extends LocalizedStatefulWidget {
  bool isDataRecordSuccess;
  String? label;
  String? description;
  Map<String, dynamic>? descriptionTableData;
  InventoryAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.isDataRecordSuccess = false,
    this.label,
    this.description,
    this.descriptionTableData,
  });

  @override
  State<InventoryAcknowledgementPage> createState() =>
      AcknowledgementPageState();
}

class AcknowledgementPageState
    extends LocalizedState<InventoryAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: DigitAcknowledgement.success(
        description: widget.description ??
            localizations.translate(
              i18.acknowledgementSuccess.acknowledgementDescriptionText,
            ),
        descriptionWidget: widget.isDataRecordSuccess
            ? DigitTableCard(
                element: widget.descriptionTableData ?? {},
              )
            : null,
        label: widget.label ??
            localizations.translate(
              i18.acknowledgementSuccess.acknowledgementLabelText,
            ),
        action: () {
          context.router.maybePop();
        },
        enableBackToSearch: widget.isDataRecordSuccess ? false : true,
        actionLabel:
            localizations.translate(i18.acknowledgementSuccess.actionLabelText),
      ),
      bottomNavigationBar: Offstage(
        offstage: !widget.isDataRecordSuccess,
        // Show the bottom navigation bar if `isDataRecordSuccess` is true
        child: SizedBox(
          height: 150,
          child: DigitCard(
            margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
            padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
            child: Column(
              children: [
                DigitElevatedButton(
                  child: Text(localizations
                      .translate(i18.acknowledgementSuccess.goToHome)),
                  onPressed: () {
                    context.router.popUntilRoot();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                DigitOutLineButton(
                  onPressed: () {
                    context.router.popUntilRoot();
                  },
                  label: localizations
                      .translate(i18.acknowledgementSuccess.downloadmoredata),
                  buttonStyle: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    side: BorderSide(
                      width: 1.0,
                      color: theme.colorScheme.secondary,
                    ),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
