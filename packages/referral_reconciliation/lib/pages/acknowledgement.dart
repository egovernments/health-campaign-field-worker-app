import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:referral_reconciliation/utils/utils.dart';

import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

@RoutePage()
class ReferralReconAcknowledgementPage extends LocalizedStatefulWidget {
  const ReferralReconAcknowledgementPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ReferralReconAcknowledgementPage> createState() =>
      _AcknowledgementPageState();
}

class _AcknowledgementPageState
    extends LocalizedState<ReferralReconAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    final pageKey =
        ReferralReconAcknowledgementRoute.name.replaceAll('Route', '');
    final searchTemplate = ReferralReconSingleton().templateConfigs?[pageKey];
    final theme = Theme.of(context);

    return Scaffold(
      body: PanelCard(
        type: PanelType.success,
        title: localizations.translate(
          searchTemplate?.properties?["AcknowledgementTitle"]?.label ?? "",
        ),
        description: (searchTemplate
                    ?.properties?["AcknowledgementDescription"]?.hidden ==
                true
            ? ""
            : localizations.translate(
                searchTemplate
                        ?.properties?["AcknowledgementDescription"]?.label ??
                    "",
              )),
        actions: _buildActionButtons(context, searchTemplate),
      ),
    );
  }

  List<DigitButton>? _buildActionButtons(
    BuildContext context,
    TemplateConfig? template,
  ) {
    final primaryProp = template?.properties?["PrimaryButton"];
    // final secondaryProp = template?.properties?["SecondaryButton"];

    final entries = <MapEntry<int, DigitButton>>[];

    if (primaryProp?.hidden != true) {
      final order = primaryProp?.order ?? 0;
      entries.add(MapEntry(
        order,
        DigitButton(
          label: localizations.translate(primaryProp?.label ?? ""),
          onPressed: () => context.router.popUntilRoot(),
          type: DigitButtonType.primary,
          size: DigitButtonSize.large,
        ),
      ));
    }

    if (entries.isEmpty) return null;

    entries.sort((a, b) => a.key.compareTo(b.key));
    return entries.map((e) => e.value).toList(growable: false);
  }
}
