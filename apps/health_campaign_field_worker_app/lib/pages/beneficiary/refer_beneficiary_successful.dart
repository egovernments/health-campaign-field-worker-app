import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../widgets/header/back_navigation_help_header.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';

class ReferBeneficiarySuccessfulPage extends LocalizedStatefulWidget {
  const ReferBeneficiarySuccessfulPage({
    super.key,
    super.appLocalizations,
  });
  @override
  State<ReferBeneficiarySuccessfulPage> createState() =>
      _ReferBeneficiarySuccessfulState();
}

class _ReferBeneficiarySuccessfulState
    extends LocalizedState<ReferBeneficiarySuccessfulPage> {
  static const _successTypeKey = "sucessType";
  static const _reasonForNotDeliveringKey = "reasonForNotDelivering";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final complainantRaisedFor = [
      i18.deliverySuccess.deliveryReasonOptionsYes,
      i18.deliverySuccess.deliveryReasonOptionsNo,
    ];

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
                onPressed: () {},
                child: Center(
                  child: Text(
                    localizations.translate(i18.common.coreCommonSubmit),
                  ),
                ),
              ),
            ),
          ),
          children: [
            DigitCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    localizations.translate(
                      i18.deliverySuccess.deliverySuccessTypeHeadingText,
                    ),
                    style: theme.textTheme.displayMedium,
                  ),
                  LabeledField(
                    label: localizations.translate(
                      i18.deliverySuccess.deliveryDescriptionText,
                    ),
                    child: Column(
                      children: [
                        RadioGroup<String>.builder(
                          groupValue: form.control(_successTypeKey).value ?? "",
                          onChanged: (changedValue) => {
                            setState(() {
                              form.control(_successTypeKey).value =
                                  changedValue;
                            }),
                          },
                          items: complainantRaisedFor,
                          itemBuilder: (item) => RadioButtonBuilder(
                            localizations.translate(item.trim()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (form.control(_successTypeKey).value ==
                      "DELIVERY_REASON_OPTIONS_NO") ...[
                    DigitReactiveDropdown(
                      label: localizations.translate(
                        i18.deliverySuccess.deliveryReasonForNotDelivering,
                      ),
                      menuItems: [
                        "Reason 1",
                        "Reason 2",
                        "Reason 3",
                      ],
                      formControlName: _reasonForNotDeliveringKey,
                      valueMapper: (value) => value,
                    ),
                  ],
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
      _successTypeKey: FormControl<String>(value: null),
      _reasonForNotDeliveringKey: FormControl<String>(),
    });
  }
}
