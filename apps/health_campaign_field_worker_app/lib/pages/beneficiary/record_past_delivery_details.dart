import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;

class RecordPastDeliveryDetailsPage extends LocalizedStatefulWidget {
  const RecordPastDeliveryDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<RecordPastDeliveryDetailsPage> createState() =>
      _RecordPastDeliveryDetailsPageState();
}

class _RecordPastDeliveryDetailsPageState
    extends LocalizedState<RecordPastDeliveryDetailsPage> {
  static const _recordDoseAdministeredKey = 'recordDoseAdministered';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final router = context.router;
    int doseNumber = 2; // todo to be removed

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(context),
        builder: (context, form, child) => ScrollableContent(
          header: const Column(children: [
            BackNavigationHelpHeaderWidget(),
          ]),
          footer: SizedBox(
            height: 85,
            child: DigitCard(
              margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
              child: DigitElevatedButton(
                onPressed: () {
                  router.push(DeliverInterventionRoute());
                },
                child: Center(
                  child: Text(
                    localizations.translate(i18.common.coreCommonNext),
                  ),
                ),
              ),
            ),
          ),
          children: [
            DigitCard(
              child: Column(
                children: [
                  Text(
                    localizations.translate(
                      i18.deliverIntervention.recordPastDeliveryDeatils,
                    ),
                    style: theme.textTheme.displayMedium,
                  ),
                  DigitRadioButtonList<KeyValue>(
                    labelText: "${localizations.translate(
                      i18.deliverIntervention.wasDosePastDeliveryDetails,
                    )} $doseNumber ${localizations.translate(
                      i18.deliverIntervention.wasDosePast24DeliveryDetails,
                    )} ",
                    labelStyle:
                        DigitTheme.instance.mobileTheme.textTheme.displayMedium,
                    formControlName: _recordDoseAdministeredKey,
                    valueMapper: (val) => localizations.translate(val.label),
                    options: Constants.yesNo,
                    isRequired: true,
                    onValueChange: (val) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FormGroup buildForm(BuildContext context) {
    return fb.group(<String, Object>{
      _recordDoseAdministeredKey: FormControl<KeyValue>(value: null),
    });
  }
}
