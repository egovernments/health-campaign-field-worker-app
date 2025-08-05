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
    final pageKey =
        ReferralReconAcknowledgementRoute.name.replaceAll('Route', '');
    final searchTemplate = ReferralReconSingleton().templateConfigs?[pageKey];
    final theme = Theme.of(context);

    return Scaffold(
      body: PanelCard(
        type: PanelType.success,
        title: widget.label ??
            localizations.translate(
              searchTemplate?.properties?["AcknowledgementTitle"]?.label ??
                  i18.acknowledgementSuccess.acknowledgementLabelText,
            ),
        description: widget.description ??
            (searchTemplate
                        ?.properties?["AcknowledgementDescription"]?.hidden ==
                    true
                ? ""
                : localizations.translate(
                    searchTemplate?.properties?["AcknowledgementDescription"]
                            ?.label ??
                        i18.acknowledgementSuccess
                            .acknowledgementDescriptionText,
                  )),
        // actions: [
        //   DigitButton(
        //     label: localizations
        //         .translate(i18.acknowledgementSuccess.actionLabelText),
        //     onPressed: () {
        //       context.router.popUntilRoot();
        //     },
        //     type: DigitButtonType.primary,
        //     size: DigitButtonSize.large,
        //     mainAxisSize: MainAxisSize.max,
        //   )
        // ],

        actions: _buildActionButtons(context, searchTemplate),
      ),
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

  List<DigitButton>? _buildActionButtons(
    BuildContext context,
    TemplateConfig? template,
  ) {
    final primaryProp = template?.properties?["PrimaryButton"];
    final secondaryProp = template?.properties?["SecondaryButton"];

    final entries = <MapEntry<int, DigitButton>>[];

    if (primaryProp?.hidden != true) {
      final order = primaryProp?.order ?? 0;
      entries.add(MapEntry(
        order,
        DigitButton(
          label: localizations.translate(
              primaryProp?.label ?? i18.acknowledgementSuccess.actionLabelText),
          onPressed: () => context.router.popUntilRoot(),
          type: DigitButtonType.primary,
          size: DigitButtonSize.large,
        ),
      ));
    }

// TODO : in future
    // if (secondaryProp?.hidden != true) {
    //   final order = secondaryProp?.order ?? 1;
    //   entries.add(MapEntry(
    //     order,
    //     DigitButton(
    //       label: localizations.translate(secondaryProp?.label ??
    //           i18.acknowledgementSuccess.actionLabelText),
    //       onPressed: () => context.router.maybePop(),
    //       type: DigitButtonType.secondary,
    //       size: DigitButtonSize.large,
    //     ),
    //   ));
    // }

    if (entries.isEmpty) return null;

    entries.sort((a, b) => a.key.compareTo(b.key));
    return entries.map((e) => e.value).toList(growable: false);
  }
}
