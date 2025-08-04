import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:referral_reconciliation/utils/i18_key_constants.dart' as i18;
import 'package:referral_reconciliation/utils/utils.dart';
import 'package:referral_reconciliation/widgets/localized.dart';

class CycleDropDown extends LocalizedStatefulWidget {
  const CycleDropDown({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CycleDropDown> createState() => _CycleDropDownState();
}

class _CycleDropDownState extends LocalizedState<CycleDropDown> {
  static const _cycleKey = 'cycle';
  static const _schemaKey = 'HFREFERALFLOW';
  static const _pageKey = 'referralDetails';

  @override
  Widget build(BuildContext context) {
    final cycles = ReferralReconSingleton().cycles;

    return ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ReactiveWrapperField<String>(
            formControlName: _cycleKey,
            validationMessages: {
              'required': (_) =>
                  localizations.translate(i18.common.corecommonRequired),
            },
            showErrors: (control) => control.invalid && control.touched,
            builder: (field) {
              return LabeledField(
                isRequired: true,
                label: localizations.translate(
                  i18.referralReconciliation.selectCycle,
                ),
                child: Dropdown(
                  readOnly: false,
                  selectedOption: cycles
                      .map((cycle) => DropdownItem(
                            name:
                                '${localizations.translate(i18.referralReconciliation.cycle)} $cycle',
                            code: cycle,
                          ))
                      .firstWhere(
                        (item) => item.code == form.control(_cycleKey).value,
                        orElse: () => const DropdownItem(name: '', code: ''),
                      ),
                  errorMessage: field.errorText,
                  items: cycles
                      .map(
                        (cycle) => DropdownItem(
                          name:
                              '${localizations.translate(i18.referralReconciliation.cycle)} $cycle',
                          code: cycle,
                        ),
                      )
                      .toList(),
                  onSelect: (val) {
                    form.control(_cycleKey).markAsTouched();
                    form.control(_cycleKey).value = val.code;

                    context.read<FormsBloc>().add(
                          FormsEvent.updateField(
                            schemaKey: _schemaKey,
                            key: _cycleKey,
                            value: val.code,
                          ),
                        );
                  },
                ),
              );
            },
          );
        });
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _cycleKey: FormControl<String>(
        value: '',
        validators: [
          Validators.required,
        ],
      )
    });
  }
}
