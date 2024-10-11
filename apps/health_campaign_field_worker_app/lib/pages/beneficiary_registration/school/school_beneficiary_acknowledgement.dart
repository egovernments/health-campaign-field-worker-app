import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

class SchoolBeneficiaryAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableViewSchool;

  const SchoolBeneficiaryAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableViewSchool,
  });

  @override
  State<SchoolBeneficiaryAcknowledgementPage> createState() =>
      _BeneficiaryAcknowledgementPageState();
}

class _BeneficiaryAcknowledgementPageState
    extends LocalizedState<SchoolBeneficiaryAcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DigitAcknowledgement.success(
        action: () {
          context.router.pop();
        },
        secondaryAction: () {
          final bloc = context.read<SearchBlocWrapper>();

          context.router.popAndPush(
            BeneficiaryWrapperRoute(
              wrapper: bloc.state.householdMembers.first,
              children: [
                SchoolDetailsRoute(),
              ],
            ),
          );
        },
        enableViewHousehold: widget.enableViewSchool ?? false,
        secondaryLabel: localizations.translate(
          i18.schoolDetails.viewSchoolDetailsAction,
        ),
        actionLabel:
            localizations.translate(i18.schoolDetails.schoolActionLabelText),
        description: localizations.translate(
          i18.acknowledgementSuccess.acknowledgementDescriptionText,
        ),
        label: localizations
            .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
      ),
    );
  }
}
