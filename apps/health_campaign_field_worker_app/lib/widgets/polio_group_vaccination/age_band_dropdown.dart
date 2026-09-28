import 'dart:collection';

import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/helper/validation_message_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../localized.dart';

/// Reactive dropdown for the `ageBand` field on the polio group-vaccination
/// child form. Options are derived at build time from the currently active
/// cycle's `deliveries[].doseCriteria[].condition` expressions instead of
/// hardcoded config enums — so campaigns can ship their own age bands
/// without a config change.
///
/// Falls back to the schema's static `enums` list when no age constraint
/// can be parsed (older configs without dose criteria).
class AgeBandDropDown extends LocalizedStatefulWidget {
  final String schemaName;
  final String formControlName;

  const AgeBandDropDown({
    super.key,
    super.appLocalizations,
    required this.schemaName,
    this.formControlName = 'ageBand',
  });

  @override
  State<AgeBandDropDown> createState() => _AgeBandDropDownState();
}

class _AgeBandDropDownState extends LocalizedState<AgeBandDropDown> {
  @override
  Widget build(BuildContext context) {
    final pages = context
        .read<FormsBloc>()
        .state
        .cachedSchemas[widget.schemaName]
        ?.pages;

    bool isReadOnlyFromSchema = false;
    bool isRequiredFromSchema = false;
    String? labelFromSchema;
    List<Option> fallbackEnums = const [];
    dynamic validationMessages;

    void walk(Map<String, PropertySchema> node) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        if (key == widget.formControlName) {
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;
          fallbackEnums = schema.enums ?? const [];
          if (schema.validations != null) {
            validationMessages =
                buildValidationMessages(schema.validations, localizations);
            for (final validation in schema.validations!) {
              if (validation.type == 'required' && validation.value == true) {
                isRequiredFromSchema = true;
                break;
              }
            }
          }
          return;
        }

        if (schema.properties != null && schema.properties!.isNotEmpty) {
          walk(schema.properties!);
          if (labelFromSchema != null) return;
        }
      }
    }

    if (pages != null) {
      walk(pages);
    }

    final derivedItems = _buildAgeBandItems();
    // Fall back to whatever `enums` the config declared when the campaign
    // isn't tagged with age conditions — keeps older configs working.
    final items = derivedItems.isNotEmpty
        ? derivedItems
        : fallbackEnums
            .map(
              (o) => DropdownItem(
                name: localizations.translate(o.name ?? o.code ?? ''),
                code: o.code ?? '',
              ),
            )
            .toList();

    return ReactiveWrapperField<dynamic>(
      formControlName: widget.formControlName,
      validationMessages: validationMessages,
      showErrors: (control) => control.invalid && control.touched,
      builder: (field) {
        final form = ReactiveForm.of(context) as FormGroup;

        return LabeledField(
          isRequired: isRequiredFromSchema,
          label: labelFromSchema != null &&
                  localizations.translate(labelFromSchema!).isNotEmpty
              ? localizations.translate(labelFromSchema!)
              : '',
          child: Dropdown(
            readOnly: isReadOnlyFromSchema,
            selectedOption: items.firstWhere(
              (item) => item.code == form.control(widget.formControlName).value,
              orElse: () {
                final currentValue =
                    form.control(widget.formControlName).value;
                if (currentValue != null && currentValue.toString().isNotEmpty) {
                  return DropdownItem(
                    name: currentValue.toString(),
                    code: currentValue.toString(),
                  );
                }
                return const DropdownItem(name: '', code: '');
              },
            ),
            errorMessage: field.errorText,
            items: items,
            onSelect: (val) {
              form.control(widget.formControlName).markAsTouched();
              form.control(widget.formControlName).value = val.code;

              context.read<FormsBloc>().add(
                    FormsEvent.updateField(
                      context: context,
                      schemaKey: widget.schemaName,
                      key: widget.formControlName,
                      value: val.code,
                    ),
                  );
            },
          ),
        );
      },
    );
  }

  /// Derives ordered, deduplicated age-band [DropdownItem]s from the
  /// active cycle's `deliveries[].doseCriteria[].condition` expressions.
  ///
  /// Accepts age on either side of the operator so both authoring styles
  /// work — `age >= 0 && age < 12` and `0 <= age && age < 12`. Whitespace
  /// is stripped and the `and` conjunction is split even when it lacks
  /// word boundaries (e.g. `0<=ageandage<=59`), so tightly-packed
  /// condition strings from MDMS still parse. Strict `>`/`<` inflate/
  /// deflate the bound by one so the user-facing range is inclusive
  /// ("0-11 months" for `age >= 0 && age < 12`).
  List<DropdownItem> _buildAgeBandItems() {
    final projectType = FlowBuilderSingleton().projectType;
    final cycles = projectType?.cycles;
    if (cycles == null || cycles.isEmpty) return const [];

    final now = DateTime.now().millisecondsSinceEpoch;
    final activeCycle = cycles.firstWhere(
      (c) => (c.startDate ?? 0) < now && (c.endDate ?? 0) > now,
      orElse: () => cycles.first,
    );

    // age on the right of the comparison: `age >= X` / `age > X` etc.
    final ageRightMin = RegExp(r'age(>=?)(\d+)');
    final ageRightMax = RegExp(r'age(<=?)(\d+)');
    // age on the left (number-first): `X <= age` (min) / `X >= age` (max).
    final ageLeftMin = RegExp(r'(\d+)(<=?)age');
    final ageLeftMax = RegExp(r'(\d+)(>=?)age');

    final ranges = SplayTreeMap<String, Map<String, int>>();
    for (final delivery in activeCycle.deliveries ?? []) {
      for (final dc in delivery.doseCriteria ?? []) {
        final raw = dc.condition ?? '';
        if (raw.isEmpty) continue;
        // Strip whitespace before parsing so authoring styles with or
        // without spaces around operators land on the same regex.
        final normalized = raw.replaceAll(RegExp(r'\s+'), '');
        // `&&` OR any `and` (case-insensitive) — plain `and` (no word
        // boundary) is intentional to survive tightly-packed strings like
        // `0<=ageandage<=59` that MDMS can emit.
        final parts = normalized.split(RegExp(r'&&|and', caseSensitive: false));
        int? min;
        int? max;
        for (final part in parts) {
          final rMin = ageRightMin.firstMatch(part);
          if (rMin != null) {
            final n = int.tryParse(rMin.group(2)!) ?? 0;
            min = rMin.group(1) == '>' ? n + 1 : n;
            continue;
          }
          final rMax = ageRightMax.firstMatch(part);
          if (rMax != null) {
            final n = int.tryParse(rMax.group(2)!) ?? 0;
            max = rMax.group(1) == '<' ? n - 1 : n;
            continue;
          }
          final lMin = ageLeftMin.firstMatch(part);
          if (lMin != null) {
            final n = int.tryParse(lMin.group(1)!) ?? 0;
            // `X < age` means age > X → inclusive min is X+1.
            min = lMin.group(2) == '<' ? n + 1 : n;
            continue;
          }
          final lMax = ageLeftMax.firstMatch(part);
          if (lMax != null) {
            final n = int.tryParse(lMax.group(1)!) ?? 0;
            // `X > age` means age < X → inclusive max is X-1.
            max = lMax.group(2) == '>' ? n - 1 : n;
            continue;
          }
        }
        if (min == null || max == null || max < min) continue;
        ranges.putIfAbsent('${min}_$max', () => {'min': min!, 'max': max!});
      }
    }

    return ranges.entries
        .map((e) => DropdownItem(
              name: '${e.value['min']}-${e.value['max']} months',
              code: '${e.value['min']}_${e.value['max']}_MONTHS',
            ))
        .toList();
  }
}
