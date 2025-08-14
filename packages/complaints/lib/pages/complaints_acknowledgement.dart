import 'package:auto_route/auto_route.dart';
import 'package:complaints/complaints.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:complaints/utils/constants.dart';
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
    final pageKey = ComplaintsAcknowledgementRoute.name.replaceAll('Route', '');
    final complaintAcknowlegdementTemplate =
        ComplaintsSingleton().templateConfigs?[pageKey];
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: PanelCard(
        title: localizations.translate(complaintAcknowlegdementTemplate
                ?.properties?[complaintKeys.acknowledgementTitle]?.label ??
            " "),
        type: PanelType.success,
        additionalDetails: [
          Text(
            localizations.translate(i18.complaints.acknowledgementSubLabelMain),
            style:
                textTheme.bodyS.copyWith(color: theme.colorTheme.paper.primary),
          ),
          Text(
            localizations.translate(i18.complaints.acknowledgementSubLabelSub),
            style:
                textTheme.bodyS.copyWith(color: theme.colorTheme.paper.primary),
          ),
        ],
        description: complaintAcknowlegdementTemplate
                        ?.properties?[complaintKeys.acknowledgementDescription]
                        ?.label !=
                    null &&
                localizations
                    .translate(complaintAcknowlegdementTemplate
                            ?.properties?[
                                complaintKeys.acknowledgementDescription]
                            ?.label ??
                        "")
                    .isNotEmpty
            ? localizations.translate(complaintAcknowlegdementTemplate
                    ?.properties?[complaintKeys.acknowledgementDescription]
                    ?.label ??
                " ")
            : null,
        actions: [
          DigitButton(
            label: localizations.translate(complaintAcknowlegdementTemplate
                    ?.properties?[complaintKeys.secondaryActionLabel]?.label ??
                ""),
            onPressed: () => context.router.maybePop(),
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          )
        ],
      ),
    );
  }
}
