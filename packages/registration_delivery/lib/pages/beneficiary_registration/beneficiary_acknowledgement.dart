import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/registration_component_keys.dart' as registration_keys;
import '../../../widgets/localized.dart';
import '../../blocs/app_localization.dart';
import '../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../router/registration_delivery_router.gm.dart';

@RoutePage()
class BeneficiaryAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const BeneficiaryAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<BeneficiaryAcknowledgementPage> createState() =>
      BeneficiaryAcknowledgementPageState();
}

class BeneficiaryAcknowledgementPageState
    extends LocalizedState<BeneficiaryAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    final pageKey =
        BeneficiaryAcknowledgementRoute.name.replaceAll('Route', '');
    final beneficiaryAcknowledgementTemplate =
        RegistrationDeliverySingleton().templateConfigs?[pageKey];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(spacer2),
        child: PanelCard(
          type: PanelType.success,
          title: localizations.translate(beneficiaryAcknowledgementTemplate
                  ?.properties?[registration_keys
                      .acknowledgementKeys.acknowledgmentTitleKey]
                  ?.label ??
              i18.acknowledgementSuccess.acknowledgementLabelText),
          actions: _buildActionButtons(context, beneficiaryAcknowledgementTemplate),
          description: beneficiaryAcknowledgementTemplate
                      ?.properties?[registration_keys
                          .acknowledgementKeys.acknowledgmentDescriptionKey]
                      ?.hidden ==
                  true
              ? ""
              : localizations.translate(
                  beneficiaryAcknowledgementTemplate
                          ?.properties?[registration_keys
                              .acknowledgementKeys.acknowledgmentDescriptionKey]
                          ?.label ??
                      i18.acknowledgementSuccess.acknowledgementDescriptionText,
                ),
        ),
      ),
    );
  }

  List<DigitButton>? _buildActionButtons(
      BuildContext context,
      TemplateConfig? template,
      ) {
    final primaryProp = template?.properties?[registration_keys.commonKeys.primaryButtonKey];
    final secondaryProp = template?.properties?[registration_keys.commonKeys.secondaryButtonKey];

    final entries = <MapEntry<int, DigitButton>>[];

    if ((widget.enableViewHousehold ?? false) && primaryProp?.hidden != true) {
      final order = primaryProp?.order ?? 0;
      entries.add(MapEntry(
        order,
        DigitButton(
          label: localizations.translate(
              primaryProp?.label ?? i18.householdDetails.viewHouseHoldDetailsAction),
          onPressed: () => context.router.popAndPush(HouseholdOverviewRoute()),
          type: DigitButtonType.primary,
          size: DigitButtonSize.large,
        ),
      ));
    }

    if (secondaryProp?.hidden != true) {
      final order = secondaryProp?.order ?? 1;
      entries.add(MapEntry(
        order,
        DigitButton(
          label: localizations.translate(
              secondaryProp?.label ?? i18.acknowledgementSuccess.actionLabelText),
          onPressed: () => context.router.maybePop(),
          type: DigitButtonType.secondary,
          size: DigitButtonSize.large,
        ),
      ));
    }

    if (entries.isEmpty) return null;

    entries.sort((a, b) => a.key.compareTo(b.key));
    return entries.map((e) => e.value).toList(growable: false);
  }


}
