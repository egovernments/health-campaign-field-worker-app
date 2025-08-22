import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
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
  static const _cycleKey = 'referralCycle';
  static const _schemaKey = 'HFREFERALFLOW';
  static const _pageKey = 'referralDetails';

  @override
  Widget build(BuildContext context) {
    final cycles = ReferralReconSingleton().cycles;
    final pages =
        context.read<FormsBloc>().state.cachedSchemas['HFREFERALFLOW']?.pages;
    bool isReadOnlyFromSchema = false;
    String? labelFromSchema;

    void walk(Map<String, PropertySchema> node, List<String> pathSoFar) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        final currentPath = [...pathSoFar, key];

        if (key == 'referralCycle') {
          // Found it; pull values
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;
          return; // stop once found
        }

        if (schema.properties != null && schema.properties!.isNotEmpty) {
          walk(schema.properties!, currentPath);
          if (labelFromSchema != null || isReadOnlyFromSchema)
            return; // early exit
        }
      }
    }

// Kick off the recursive search
    walk(pages!, []);

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
                label: labelFromSchema != null &&
                        localizations.translate(labelFromSchema!).isNotEmpty
                    ? localizations.translate(labelFromSchema!)
                    : localizations.translate(
                        i18.referralReconciliation.selectCycle,
                      ),
                child: Dropdown(
                  readOnly: isReadOnlyFromSchema,
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
