import 'package:collection/collection.dart';
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

  /// Companion control written alongside [formControlName] so the summary
  /// page can show the vaccine the band's dose criteria carries. Optional —
  /// a config that doesn't declare it is left alone.
  final String vaccineControlName;

  const AgeBandDropDown({
    super.key,
    super.appLocalizations,
    required this.schemaName,
    this.formControlName = 'ageBand',
    this.vaccineControlName = 'ageBandVaccine',
  });

  @override
  State<AgeBandDropDown> createState() => _AgeBandDropDownState();
}

/// A single derived age band: the persisted [code], the human-readable
/// [label], and the localized vaccine name(s) from the dose criteria that
/// produced it.
class _AgeBand {
  final String code;
  final String label;
  final String vaccines;
  final int min;
  final int max;

  const _AgeBand({
    required this.code,
    required this.label,
    required this.vaccines,
    required this.min,
    required this.max,
  });
}

class _AgeBandDropDownState extends LocalizedState<AgeBandDropDown> {
  /// Guards the one-shot backfill of the companion controls for a band that
  /// was already selected before this widget mounted (edit / back-nav).
  bool _backfilled = false;
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

    final bands = _buildAgeBands();
    // Fall back to whatever `enums` the config declared when the campaign
    // isn't tagged with age conditions — keeps older configs working.
    final items = bands.isNotEmpty
        ? bands
            .map((b) => DropdownItem(name: b.label, code: b.code))
            .toList()
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

        // A band selected on a previous visit only lives in `ageBand`; the
        // summary reads the companion controls, so seed them once from the
        // persisted code. Deferred because it dispatches onto FormsBloc.
        if (!_backfilled) {
          _backfilled = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final current = form.control(widget.formControlName).value;
            if (current == null || current.toString().isEmpty) return;
            _syncCompanions(
              form,
              bands.firstWhereOrNull((b) => b.code == current.toString()),
            );
          });
        }

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

              _syncCompanions(
                form,
                bands.firstWhereOrNull((b) => b.code == val.code),
              );
            },
          ),
        );
      },
    );
  }

  /// Mirrors the selected band into the companion controls the summary page
  /// reads. No-ops for controls the config doesn't declare, so this stays
  /// safe for campaigns that don't want the extra summary rows.
  void _syncCompanions(FormGroup form, _AgeBand? band) {
    void write(String name, String? value) {
      if (!form.contains(name)) return;
      if (form.control(name).value == value) return;
      form.control(name).value = value;
      context.read<FormsBloc>().add(
            FormsEvent.updateField(
              context: context,
              schemaKey: widget.schemaName,
              key: name,
              value: value,
            ),
          );
    }

    write(widget.vaccineControlName, band?.vaccines);
  }

  /// Label for a band code.
  ///
  /// The code is itself the localization code, so a campaign that adds a
  /// `0_59_MONTHS` entry gets a translated band in both this dropdown and
  /// the summary page — the summary translates the persisted value directly
  /// (`forms_render._renderSummaryLabelValueItems`), so no engine hook is
  /// needed for the two to agree.
  ///
  /// `translate` echoes unknown codes back, so fall through to the English
  /// composition when the campaign hasn't added the entry. Untranslated
  /// campaigns keep today's behaviour instead of showing a raw code here.
  String _bandLabel(String code, int min, int max) {
    final translated = localizations.translate(code);
    if (translated != code) return translated;
    return '$min-$max';
  }

  /// Derives ordered, deduplicated age bands from the
  /// active cycle's `deliveries[].doseCriteria[].condition` expressions.
  ///
  /// Accepts age on either side of the operator so both authoring styles
  /// work — `age >= 0 && age < 12` and `0 <= age && age < 12`. Whitespace
  /// is stripped and the `and` conjunction is split even when it lacks
  /// word boundaries (e.g. `0<=ageandage<=59`), so tightly-packed
  /// condition strings from MDMS still parse. Strict `>`/`<` inflate/
  /// deflate the bound by one so the user-facing range is inclusive
  /// ("0-11 months" for `age >= 0 && age < 12`).
  List<_AgeBand> _buildAgeBands() {
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

    // Keyed by band code so repeated criteria collapse; vaccine names from
    // every dose criteria sharing a band are merged.
    final bands = <String, _AgeBand>{};
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

        final code = '${min} - ${max}';
        // `dc` is dynamic (the cycle/delivery chain isn't statically typed
        // here), so collect imperatively into a typed list. A `.map().where()`
        // chain off a dynamic receiver builds `(dynamic) => dynamic` closures
        // and `where` throws at runtime for not being `(dynamic) => bool`.
        final names = <String>[];
        for (final v in (dc.productVariants as List?) ?? const []) {
          final raw = (v as dynamic).name;
          if (raw == null) continue;
          final translated = localizations.translate(raw.toString());
          if (translated.isNotEmpty) names.add(translated);
        }

        final existing = bands[code];
        final merged = <String>{
          if (existing != null && existing.vaccines.isNotEmpty)
            ...existing.vaccines.split(', '),
          ...names,
        }.join(', ');

        bands[code] = _AgeBand(
          code: code,
          label: _bandLabel(code, min, max),
          vaccines: merged,
          min: min,
          max: max,
        );
      }
    }

    // Numeric order. The previous SplayTreeMap sorted the `min_max` keys as
    // strings, which put "5_11" after "12_59".
    final ordered = bands.values.toList()
      ..sort((a, b) => a.min != b.min
          ? a.min.compareTo(b.min)
          : a.max.compareTo(b.max));
    return ordered;
  }
}
