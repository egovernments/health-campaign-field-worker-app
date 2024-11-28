import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
import '../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/utils.dart';

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
    return Scaffold(
      body: PanelCard(
        type: PanelType.success,
        title: localizations
            .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
        actions: [
          Button(
              label: localizations.translate(
                i18.householdDetails.viewHouseHoldDetailsAction,
              ),
              onPressed: (){
                final bloc = context.read<SearchBlocWrapper>();

                context.router.popAndPush(
                  BeneficiaryWrapperRoute(
                    wrapper: bloc.state.householdMembers.first,
                  ),
                );
              },
              type: ButtonType.primary,
              size: ButtonSize.large
          ),
          Button(
              label: localizations.translate(i18.acknowledgementSuccess.actionLabelText),
              onPressed: ()=>context.router.maybePop(),
              type: ButtonType.secondary,
              size: ButtonSize.large
          ),
        ],
        description: localizations.translate(
          i18.acknowledgementSuccess.acknowledgementDescriptionText,
        ),
      ),
    );
  }
}
