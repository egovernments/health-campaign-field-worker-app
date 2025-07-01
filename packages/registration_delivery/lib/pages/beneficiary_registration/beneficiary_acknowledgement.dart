import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
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
  late final HouseholdMemberWrapper? wrapper;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<SearchHouseholdsBloc>();
    wrapper = bloc.state.householdMembers.lastOrNull;
  }

  @override
  Widget build(BuildContext context) {
    final pageKey =
        BeneficiaryAcknowledgementRoute.name.replaceAll('Route', '');
    final beneficiaryAcknowledgementTemplate =
        RegistrationDeliverySingleton().templateConfigs?[pageKey];
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(spacer2),
        child: PanelCard(
          type: PanelType.success,
          title: localizations
              .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
          additionalDetails: [
            if (wrapper?.members?.lastOrNull!.identifiers!
                    .lastWhereOrNull(
                      (e) =>
                          e.identifierType ==
                          IdentifierTypes.uniqueBeneficiaryID.toValue(),
                    )
                    ?.identifierId !=
                null)
              Text(
                getSubText(wrapper),
                textAlign: TextAlign.center,
                style: textTheme.headingM
                    .copyWith(color: const DigitColors().light.paperPrimary),
              )
          ],
          actions: [
            DigitButton(
                label: localizations.translate(
                  i18.householdDetails.viewHouseHoldDetailsAction,
                ),
                onPressed: () {
                  final bloc = context.read<SearchBlocWrapper>();

                  context.router.popAndPush(
                    BeneficiaryWrapperRoute(
                      wrapper: bloc.state.householdMembers.first,
                    ),
                  );
                },
                type: DigitButtonType.primary,
                size: DigitButtonSize.large),
            DigitButton(
                label: localizations
                    .translate(i18.acknowledgementSuccess.actionLabelText),
                onPressed: () => context.router.maybePop(),
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large),
          ],
          description: localizations.translate(
            i18.acknowledgementSuccess.acknowledgementDescriptionText,
          ),
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

  getSubText(HouseholdMemberWrapper? wrapper) {
    return wrapper != null
        ? '${localizations.translate(i18.beneficiaryDetails.beneficiaryId)}\n'
            '${wrapper.members?.lastOrNull!.name!.givenName} - '
            '${wrapper.members?.lastOrNull!.identifiers!.lastWhereOrNull(
                  (e) =>
                      e.identifierType ==
                      IdentifierTypes.uniqueBeneficiaryID.toValue(),
                )?.identifierId ?? localizations.translate(i18.common.noResultsFound)}'
        : '';
  }


}
