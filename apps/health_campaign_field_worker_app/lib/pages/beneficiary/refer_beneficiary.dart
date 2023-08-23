import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/localization/app_localization.dart';
import '../../models/entities/facility.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../inventory/facility_selection.dart';
import '../../../router/app_router.dart';

class ReferBeneficiaryPage extends LocalizedStatefulWidget {
  final bool isEditing;

  const ReferBeneficiaryPage({
    super.key,
    super.appLocalizations,
    this.isEditing = false,
  });
  @override
  State<ReferBeneficiaryPage> createState() => _ReferBeneficiaryPageState();
}

class _ReferBeneficiaryPageState extends LocalizedState<ReferBeneficiaryPage> {
  static const _dateOfReferralKey = 'dateOfReferral';
  static const _administrativeUnitKey = 'administrativeUnit';
  static const _referredByKey = 'referredBy';
  static const _referredToKey = 'referredTo';

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
                  router.push(ReferBeneficiaryReasonRoute());
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
                            i18.referBeneficiary.referBeneficiaryLabel,
                          ),
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    DigitDateFormPicker(
                      isEnabled: false,
                      formControlName: _dateOfReferralKey,
                      label: localizations.translate(
                        i18.referBeneficiary.dateOfReferralLabel,
                      ),
                      isRequired: false,
                      initialDate: DateTime.now(),
                    ),
                    DigitTextFormField(
                      formControlName: _administrativeUnitKey,
                      label: localizations.translate(
                        i18.referBeneficiary.administrationUnitFormLabel,
                      ),
                      isRequired: true,
                    ),
                    DigitTextFormField(
                      formControlName: _referredByKey,
                      label: localizations.translate(
                        i18.referBeneficiary.referredByLabel,
                      ),
                      isRequired: false,
                    ),
                    DigitTextFormField(
                      valueAccessor: FacilityValueAccessor([]),
                      label: localizations.translate(
                        i18.referBeneficiary.referredToLabel,
                      ),
                      formControlName: _referredToKey,
                      suffix: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      onTap: () async {},
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
      _dateOfReferralKey: FormControl<DateTime>(value: null),
      _administrativeUnitKey: FormControl<String>(value: null),
      _referredByKey: FormControl<String>(value: null),
      _referredToKey: FormControl<FacilityModel>(validators: []),
    });
  }
}
