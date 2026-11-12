import 'package:collection/collection.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/helper/validation_message_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/dropdown_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';

/// A form dropdown whose options are read from the local database.
///
/// Form dropdowns normally take a fixed `enums` list. This one reads its
/// options with the same local search that `SEARCH_EVENT` uses
/// (`CrudService.searchEntities`), configured on the field itself under
/// `conditions.localDataSource`:
///
/// ```json
/// "conditions": {
///   "localDataSource": {
///     "select": ["facility", "address"],
///     "primary": "facility",
///     "resultModel": "facility",
///     "filters": [
///       {"root": "facility", "key": "usage", "operation": "equals",
///        "value": "{{form.locationType}}"},
///       {"root": "address", "key": "localityBoundaryCode", "operation": "in",
///        "value": "{{singleton.boundaryAndParentCodes}}"}
///     ],
///     "displayKey": ["name"],
///     "valueKey": "clientReferenceId",
///     "labelControl": "locationNameLabel"
///   }
/// }
/// ```
///
/// - `{{form.<field>}}` is the current value of another field on the same
///   page. Until it has a value the dropdown has no options, and when it
///   changes the options are searched again and a selection that no longer
///   fits is cleared.
/// - `{{singleton.<path>}}` resolves from the flow-builder singleton.
/// - `displayKey` is one key or a list of keys; the first non-empty value
///   is shown.
/// - `labelControl` (optional) is a hidden field on the same page that gets
///   the selected option's label, so the transformer and summary can use it.
class LocalDataDropdown extends LocalizedStatefulWidget {
  final String schemaName;
  final String formControlName;

  const LocalDataDropdown({
    super.key,
    super.appLocalizations,
    required this.schemaName,
    required this.formControlName,
  });

  @override
  State<LocalDataDropdown> createState() => _LocalDataDropdownState();
}

class _LocalDataDropdownState extends LocalizedState<LocalDataDropdown> {
  static final _formRef = RegExp(r'^\{\{\s*form\.([^}\s]+)\s*\}\}$');

  /// True while a filter value is unresolved (e.g. a `{{form.<field>}}` it
  /// depends on is still empty), so there is nothing to search yet and the
  /// dropdown stays disabled.
  bool _dependencyMissing = true;

  /// Filters (resolved) used for the last search, to search again only when
  /// a dependency changes.
  String? _searchedSignature;
  List<DropdownItem> _items = const [];
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final pages =
        context.read<FormsBloc>().state.cachedSchemas[widget.schemaName]?.pages;

    PropertySchema? fieldSchema;
    void walk(Map<String, PropertySchema> node) {
      for (final entry in node.entries) {
        if (fieldSchema != null) return;
        if (entry.key == widget.formControlName) {
          fieldSchema = entry.value;
          return;
        }
        final children = entry.value.properties;
        if (children != null && children.isNotEmpty) walk(children);
      }
    }

    if (pages != null) walk(pages);

    final schema = fieldSchema;
    final source = schema?.conditions?['localDataSource'];
    final isReadOnly =
        (schema?.readOnly == true) || (schema?.displayOnly == true);
    final isRequired = schema?.validations
            ?.any((v) => v.type == 'required' && v.value == true) ??
        false;
    final label = schema?.label ?? schema?.innerLabel;
    final validationMessages = schema?.validations != null
        ? buildValidationMessages(schema!.validations, localizations)
        : null;

    return ReactiveFormConsumer(
      builder: (context, form, _) {
        if (source is Map) {
          _maybeSearch(form, Map<String, dynamic>.from(source));
        }

        return ReactiveWrapperField<dynamic>(
          formControlName: widget.formControlName,
          validationMessages: validationMessages,
          showErrors: (control) => control.invalid && control.touched,
          builder: (field) {
            final current = form.control(widget.formControlName).value;
            return LabeledField(
              isRequired: isRequired,
              label: label != null ? localizations.translate(label) : '',
              child: Dropdown(
                // Enabled once its filters are known, even with no results,
                // so the user can open it and see "No options available".
                readOnly: isReadOnly ||
                    _dependencyMissing ||
                    (_loading && _items.isEmpty),
                emptyItemText:
                    localizations.translate(i18.common.noOptionsAvailable),
                // A new copy on every build: DigitDropdown.didUpdateWidget
                // clears its text when it gets the same option object as
                // last build, so a later change elsewhere on the page (e.g.
                // a date) blanked the shown name. Same approach as
                // evaluation_facility.dart.
                selectedOption: () {
                  final match = _items.firstWhereOrNull(
                    (item) => item.code == current?.toString(),
                  );
                  return match == null
                      ? const DropdownItem(name: '', code: '')
                      : DropdownItem(name: match.name, code: match.code);
                }(),
                errorMessage: field.errorText,
                items: _items,
                onSelect: (val) {
                  form.control(widget.formControlName).markAsTouched();
                  _write(form, widget.formControlName, val.code);
                  final labelControl =
                      source is Map ? source['labelControl']?.toString() : null;
                  if (labelControl != null) {
                    _write(form, labelControl, val.name);
                  }
                },
              ),
            );
          },
        );
      },
    );
  }

  /// Resolves the filters and searches when they differ from the last search.
  void _maybeSearch(FormGroup form, Map<String, dynamic> source) {
    final rawFilters = (source['filters'] as List?) ?? const [];
    final filters = <SearchFilter>[];
    var dependencyMissing = false;

    for (final raw in rawFilters) {
      if (raw is! Map) continue;
      final value = _resolve(raw['value'], form);
      if (value == null || value.toString().isEmpty) {
        dependencyMissing = true;
        break;
      }
      filters.add(SearchFilter(
        root: raw['root']?.toString() ?? source['primary']?.toString() ?? '',
        field: raw['key']?.toString() ?? '',
        operator: raw['operation']?.toString() ?? 'equals',
        value: value,
      ));
    }

    _dependencyMissing = dependencyMissing;

    final signature = dependencyMissing
        ? '__missing__'
        : filters
            .map((f) => '${f.root}.${f.field}${f.operator}${f.value}')
            .join('|');
    if (signature == _searchedSignature) return;
    // A search is running; the rebuild after it finishes checks again.
    if (_loading) return;
    _searchedSignature = signature;

    if (dependencyMissing) {
      _setItems(form, const [], duringBuild: true);
      return;
    }
    _search(form, source, filters, signature);
  }

  Future<void> _search(
    FormGroup form,
    Map<String, dynamic> source,
    List<SearchFilter> filters,
    String signature,
  ) async {
    if (_loading) return;
    _loading = true;
    try {
      final select = ((source['select'] as List?) ?? const [])
          .map((e) => e.toString())
          .toList();
      final resultModel =
          source['resultModel']?.toString() ?? source['primary']?.toString();
      final (results, _) = await CrudBlocSingleton().crudService.searchEntities(
            query: GlobalSearchParameters(
              filters: filters,
              select: select,
              primaryModel: source['primary']?.toString(),
            ),
          );
      if (!mounted || signature != _searchedSignature) return;

      final displayKeys = source['displayKey'] is List
          ? (source['displayKey'] as List).map((e) => e.toString()).toList()
          : [source['displayKey']?.toString() ?? 'name'];
      final valueKey = source['valueKey']?.toString() ?? 'id';

      final items = <DropdownItem>[];
      final seen = <String>{};
      for (final entity in results[resultModel] ?? const <EntityModel>[]) {
        final map = entity.toMap();
        final code = _readPath(map, valueKey)?.toString();
        if (code == null || code.isEmpty || !seen.add(code)) continue;
        final name = displayKeys
                .map((k) => _readPath(map, k)?.toString())
                .firstWhereOrNull((v) => v != null && v.isNotEmpty) ??
            code;
        items
            .add(DropdownItem(name: localizations.translate(name), code: code));
      }
      _setItems(form, items);
    } catch (e) {
      debugPrint('LocalDataDropdown(${widget.formControlName}) search: $e');
      if (mounted) _setItems(form, const []);
    } finally {
      _loading = false;
      // A dependency may have changed while this search ran.
      if (mounted) setState(() {});
    }
  }

  /// Stores the options and clears a selection that is no longer an option.
  /// During build the change is deferred to after the frame.
  void _setItems(FormGroup form, List<DropdownItem> items,
      {bool duringBuild = false}) {
    void apply() {
      if (!mounted) return;
      setState(() => _items = items);
      final current = form.control(widget.formControlName).value?.toString();
      if (current != null &&
          current.isNotEmpty &&
          !items.any((i) => i.code == current)) {
        _write(form, widget.formControlName, null);
      }
    }

    if (duringBuild) {
      WidgetsBinding.instance.addPostFrameCallback((_) => apply());
    } else {
      apply();
    }
  }

  dynamic _resolve(dynamic value, FormGroup form) {
    if (value is! String) return value;
    final formMatch = _formRef.firstMatch(value.trim());
    if (formMatch != null) {
      final name = formMatch.group(1)!;
      return form.contains(name) ? form.control(name).value : null;
    }
    if (value.contains('{{')) {
      final resolved = resolveValueRaw(value, null);
      return resolved == value ? null : resolved;
    }
    return value;
  }

  dynamic _readPath(Map<String, dynamic> map, String path) {
    dynamic current = map;
    for (final part in path.split('.')) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else {
        return null;
      }
    }
    return current;
  }

  void _write(FormGroup form, String name, dynamic value) {
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
}
