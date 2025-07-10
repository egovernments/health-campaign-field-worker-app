import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/registration_wrapper/registration_wrapper_bloc.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../../router/registration_delivery_router.gm.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/registration_component_keys.dart' as registration_keys;
import '../../../widgets/localized.dart';

@RoutePage()
class HouseholdAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewHousehold;

  const HouseholdAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewHousehold,
  });

  @override
  State<HouseholdAcknowledgementPage> createState() =>
      HouseholdAcknowledgementPageState();
}

class HouseholdAcknowledgementPageState
    extends LocalizedState<HouseholdAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    final pageKey = HouseholdAcknowledgementRoute.name.replaceAll('Route', '');
    final householdAcknowledgementTemplate =
        RegistrationDeliverySingleton().templateConfigs?[pageKey];
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<RegistrationWrapperBloc, RegistrationWrapperState>(
          builder: (context, householdState) {
            return Padding(
              padding: const EdgeInsets.all(spacer2),
              child: PanelCard(
                type: PanelType.success,
                description: householdAcknowledgementTemplate
                            ?.properties?[registration_keys.acknowledgementKeys
                                .acknowledgmentDescriptionKey]
                            ?.hidden ==
                        true
                    ? ""
                    : localizations.translate(
                        householdAcknowledgementTemplate
                                ?.properties?[registration_keys
                                    .acknowledgementKeys
                                    .acknowledgmentDescriptionKey]
                                ?.label ??
                            i18.acknowledgementSuccess
                                .acknowledgementDescriptionText,
                      ),
                title: householdAcknowledgementTemplate
                            ?.properties?[registration_keys
                                .acknowledgementKeys.acknowledgmentTitleKey]
                            ?.hidden ==
                        true
                    ? ""
                    : householdAcknowledgementTemplate
                                ?.properties?[registration_keys
                                    .acknowledgementKeys.acknowledgmentTitleKey]
                                ?.label !=
                            null
                        ? localizations.translate(
                            householdAcknowledgementTemplate
                                    ?.properties?[registration_keys
                                        .acknowledgementKeys
                                        .acknowledgmentTitleKey]
                                    ?.label ??
                                "")
                        : "",
                actions: _buildActionButtons(
                    context, householdAcknowledgementTemplate),
              ),
            );
          },
        ),
      ),
    );
  }

  List<DigitButton>? _buildActionButtons(
    BuildContext context,
    TemplateConfig? template,
  ) {
    final primaryProp =
        template?.properties?[registration_keys.commonKeys.primaryButtonKey];
    final secondaryProp =
        template?.properties?[registration_keys.commonKeys.secondaryButtonKey];

    final entries = <MapEntry<int, DigitButton>>[];

    if ((widget.enableViewHousehold ?? false) && primaryProp?.hidden != true) {
      final order = primaryProp?.order ?? 0;
      entries.add(MapEntry(
        order,
        DigitButton(
          label: localizations.translate(primaryProp?.label ??
              i18.householdDetails.viewHouseHoldDetailsAction),
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
          label: localizations.translate(secondaryProp?.label ??
              i18.acknowledgementSuccess.actionLabelText),
          onPressed: () =>
              context.router.popUntilRouteWithName(SearchBeneficiaryRoute.name),
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
