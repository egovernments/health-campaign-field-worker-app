import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
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

  @override
  Widget build(BuildContext context) {
    final cycles = ReferralReconSingleton().cycles;
    final pages =
        context.read<FormsBloc>().state.cachedSchemas[_schemaKey]?.pages;

    bool isReadOnlyFromSchema = false;
    String? labelFromSchema;

    /// 👇 Check page-level flag from FormsRenderRoute
    final isView =
        context.findAncestorWidgetOfExactType<FormsRenderPage>()?.isView ??
            false;

    void walk(Map<String, PropertySchema> node, List<String> pathSoFar) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        if (key == _cycleKey) {
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;
          return;
        }

        if (schema.properties != null && schema.properties!.isNotEmpty) {
          walk(schema.properties!, [...pathSoFar, key]);
          if (labelFromSchema != null || isReadOnlyFromSchema) return;
        }
      }
    }

    if (pages != null) {
      walk(pages, []);
    }

    return ReactiveWrapperField<dynamic>(
      formControlName: _cycleKey,
      validationMessages: {
        'required': (_) =>
            localizations.translate(i18.common.corecommonRequired),
      },
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        final form = ReactiveForm.of(context) as FormGroup;

        return LabeledField(
          isRequired: isReadOnlyFromSchema,
          label: labelFromSchema != null &&
                  localizations.translate(labelFromSchema!).isNotEmpty
              ? localizations.translate(labelFromSchema!)
              : localizations.translate(
                  i18.referralReconciliation.selectCycle,
                ),
          child: Dropdown(
            readOnly: isReadOnlyFromSchema || isView,
            selectedOption: cycles
                .map((cycle) => DropdownItem(
                      name:
                          '${localizations.translate(i18.referralReconciliation.cycle)} $cycle',
                      code: cycle,
                    ))
                .firstWhere(
              (item) => item.code == form.control(_cycleKey).value,
              orElse: () {
                final currentValue = form.control(_cycleKey).value;
                if (currentValue != null) {
                  // fallback to showing whatever value BE/schema provided
                  return DropdownItem(
                    name: currentValue.toString(),
                    code: currentValue,
                  );
                }
                return const DropdownItem(name: '', code: '');
              },
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
  }
}
