import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/localization/app_localization.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../../../router/app_router.dart';

class ReferBeneficiaryReasonPage extends LocalizedStatefulWidget {
  final bool isEditing;

  const ReferBeneficiaryReasonPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
  });
  @override
  State<ReferBeneficiaryReasonPage> createState() =>
      _ReferBeneficiaryReasonState();
}

class _ReferBeneficiaryReasonState
    extends LocalizedState<ReferBeneficiaryReasonPage> {
  static const _referralCommentsKey = 'referralComments';
  static const _referralCheckBoxKey = 'referralCheckBox';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
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
                  router.push(ReferBeneficiarySuccessfulRoute());
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          localizations.translate(
                            i18.reasonReferral.reasonReferralLabel,
                          ),
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    DigitCheckbox(
                      label: localizations.translate(
                        i18.referBeneficiary.administrationUnitFormLabel,
                      ),
                      value: false,
                      onChanged: (changedValue) => {
                        setState(() {
                          form.control(_referralCheckBoxKey).value =
                              changedValue;
                        }),
                      },
                    ),
                    DigitTextFormField(
                      label: localizations.translate(
                        i18.reasonReferral.reasonReferralComments,
                      ),
                      formControlName: _referralCommentsKey,
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _referralCommentsKey: FormControl<String>(value: null),
      _referralCheckBoxKey: FormControl<String>(value: null),
    });
  }
}
