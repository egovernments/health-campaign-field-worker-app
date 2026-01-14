import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/helper/validation_message_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/utils.dart';
import '../localized.dart';

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
  static const _schemaKey = 'REFERRAL_CREATE';

  @override
  Widget build(BuildContext context) {
    final cycles = context.cycles;
    final pages =
        context.read<FormsBloc>().state.cachedSchemas[_schemaKey]?.pages;

    bool isReadOnlyFromSchema = false;
    bool isRequiredFromSchema = false;
    String? labelFromSchema;
    dynamic validationMessages;

    void walk(Map<String, PropertySchema> node, List<String> pathSoFar) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        if (key == _cycleKey) {
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;
          if (schema.validations != null) {
            validationMessages = buildValidationMessages(schema.validations, localizations);
            for (final validation in schema.validations!) {
              if (validation.type == "required" && validation.value == true) {
                isRequiredFromSchema = true;
                break;
              }
            }
          }
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
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        final form = ReactiveForm.of(context) as FormGroup;

        return LabeledField(
          isRequired: isRequiredFromSchema,
          label: labelFromSchema != null &&
                  localizations.translate(labelFromSchema!).isNotEmpty
              ? localizations.translate(labelFromSchema!): "",
          child: Dropdown(
            readOnly: isReadOnlyFromSchema,
            selectedOption: cycles
                .map((cycle) => DropdownItem(
                      name:
                          '${localizations.translate("CYCLE")} $cycle',
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
                        '${localizations.translate("CYCLE")} $cycle',
                    code: cycle,
                  ),
                )
                .toList(),
            onSelect: (val) {
              form.control(_cycleKey).markAsTouched();
              form.control(_cycleKey).value = val.code;

              context.read<FormsBloc>().add(
                    FormsEvent.updateField(
                      context: context,
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
