import 'package:digit_data_model/data_model.dart';

import '../flow_crud_bloc.dart';
import '../../utils/utils.dart' show getEntityTypeName;
import 'entity_field_accessor.dart';
import 'value_resolver.dart';

/// Handles entity filtering and relation matching logic.
class EntityFilter {
  final IValueResolver _resolver;
  final String? screenKey;

  EntityFilter(this._resolver, {this.screenKey});

  /// Resolves a filter value that may be a `{{fieldName}}` template pointing
  /// at a `searchBar`'s entry in widgetData. Non-template values pass through
  /// unchanged.
  dynamic _resolveWidgetDataTemplate(
    dynamic raw,
    Map<String, dynamic>? widgetData,
  ) {
    if (raw is String && raw.contains('{{')) {
      final key = raw.replaceAll('{{', '').replaceAll('}}', '').trim();
      return widgetData?[key];
    }
    return raw;
  }

  /// Checks whether a root entity passes all configured filters.
  bool passesFilters(
    dynamic root,
    Map<String, List<dynamic>> entityMap,
    Map<String, dynamic> config,
  ) {
    final filters = config['filters'] as List<dynamic>?;
    if (filters == null || filters.isEmpty) return true;

    // Get navigation params from registry for template resolution
    final stateKey = screenKey;
    final navigationParams = stateKey != null
        ? FlowCrudStateRegistry().getNavigationParams(stateKey) ?? {}
        : <String, dynamic>{};

    // Build context for resolving equalsFrom templates
    final resolveContext = <String, dynamic>{
      'navigation': navigationParams,
    };

    // Search terms typed into a `searchBar` live in widgetData, keyed by the
    // widget's fieldName — the same source [findRelatedEntities] reads for
    // relation-level search.
    final widgetData =
        stateKey != null ? FlowCrudStateRegistry().get(stateKey)?.widgetData : null;

    for (final filter in filters) {
      final field = filter['field'];
      final equals = filter['equals'];
      final equalsFrom = filter['equalsFrom'] as String?;

      if (!filter.containsKey('entity')) {
        final value = EnhancedEntityFieldAccessor.getFieldValue(root, field);

        // Handle equalsFrom with template resolution
        if (equalsFrom != null) {
          final resolvedEquals =
              _resolver.resolveValue(equalsFrom, root, resolveContext);
          if (resolvedEquals != null && value != resolvedEquals) return false;
        } else if (filter.containsKey('contains')) {
          // Case-insensitive substring match, mirroring the relation-level
          // `contains` filter. An unset or empty term passes everything, so a
          // cleared search box restores the full list.
          final term = _resolveWidgetDataTemplate(filter['contains'], widgetData);
          final termText = term?.toString() ?? '';
          if (termText.isEmpty) continue;

          // Optional. Set it to the search bar's `minSearchChars` when this
          // filter refines one. Below that threshold the bar drops its own
          // query filter and re-runs the base search, but deliberately keeps
          // the term in widgetData so the visible text isn't erased — so this
          // filter is what has to stand down, or the list stays narrowed by a
          // term the bar already treats as inactive.
          final minChars = (filter['minChars'] as num?)?.toInt();
          if (minChars != null && termText.length < minChars) continue;

          final actual = value?.toString().toLowerCase() ?? '';
          if (!actual.contains(termText.toLowerCase())) return false;
        } else if (filter.containsKey('notEquals')) {
          // Drop the root when the field DOES hold the value. Used to keep
          // outside-household site links out of stock/facility lists.
          if (value == filter['notEquals']) return false;
        } else if (filter.containsKey('notIn')) {
          final excluded = filter['notIn'];
          if (excluded is List && excluded.contains(value)) return false;
        } else if (equals != null && value != equals) {
          return false;
        }
      } else {
        final entityType = filter['entity'];
        final condition = filter['condition'];
        final join = filter['join'];
        final filterEntities = entityMap[entityType] ?? [];
        final notExists = filter['notExists'] == true;
        bool hasMatchingEntity = false;

        for (final entity in filterEntities) {
          bool conditionMatches = false;
          if (condition['equals'] != null) {
            final fieldValue = EnhancedEntityFieldAccessor.getFieldValue(
                entity, condition['field']);
            conditionMatches = fieldValue == condition['equals'];
          }

          if (conditionMatches && join != null) {
            final sourceValue = EnhancedEntityFieldAccessor.getFieldValue(
                entity, join['sourceField']);
            final targetValue = EnhancedEntityFieldAccessor.getFieldValue(
                root, join['targetField']);
            hasMatchingEntity = sourceValue == targetValue;
          } else if (conditionMatches) {
            hasMatchingEntity = true;
          }
          if (hasMatchingEntity) break;
        }
        // notExists=false (default): drop root when no matching entity exists
        // notExists=true:             drop root when a matching entity DOES exist
        if (notExists ? hasMatchingEntity : !hasMatchingEntity) return false;
      }
    }
    return true;
  }

  /// Finds entities related to a root entity based on relation configuration.
  List<dynamic> findRelatedEntities(
    dynamic root,
    Map<String, dynamic> relation,
    Map<String, dynamic> wrapperData,
    Map<String, List<dynamic>> entityMap,
  ) {
    final entityType = relation['entity'];
    final candidates = entityMap[entityType] ?? [];
    final match = relation['match'] as Map<String, dynamic>?;
    if (match == null) return [];

    final targetField = match['field'] as String?;
    final equalsFrom = match['equalsFrom'] as String?;
    final inFrom = match['inFrom'] as String?;

    // Create a local context that includes both the current entity and wrapper data
    final localContext = <String, dynamic>{
      ...wrapperData,
      if (root is EntityModel) getEntityTypeName(root): root,
    };

    final equalsValue = equalsFrom != null
        ? _resolver.resolveValue(equalsFrom, root, localContext)
        : null;
    final inValues = inFrom != null
        ? _resolver.resolveList(inFrom, localContext).toSet()
        : null;

    var related = candidates.where((e) {
      if (targetField == null) return false;
      final candidateValue =
          _resolver.resolveValue(targetField, e, localContext);
      if (equalsValue != null) return candidateValue == equalsValue;
      if (inValues != null) return inValues.contains(candidateValue);
      return false;
    }).toList();

    final filters = relation['filters'] as List<dynamic>? ?? [];

    // Get widgetData from registry using screenKey
    final stateKey = screenKey;
    final widgetData = stateKey != null
        ? FlowCrudStateRegistry().get(stateKey)?.widgetData
        : null;

    related = related.where((entity) {
      return filters.every((filter) {
        final field = filter['field'];
        final actual = _resolver.resolveValue(field, entity, localContext);

        // Handle 'equals' filter
        if (filter.containsKey('equals')) {
          final expectedRaw = filter['equals'];
          // Resolve template variables like {{searchBar}} from widgetData
          dynamic expected;
          if (expectedRaw is String && expectedRaw.contains('{{')) {
            // For template variables, look in widgetData
            final key =
                expectedRaw.replaceAll('{{', '').replaceAll('}}', '').trim();
            expected = widgetData?[key];
          } else {
            expected = expectedRaw;
          }
          // Skip filter if expected value is null or empty (no search term entered)
          if (expected == null || (expected is String && expected.isEmpty)) {
            return true;
          }
          return actual == expected;
        }

        // Handle 'contains' filter (useful for search functionality)
        if (filter.containsKey('contains')) {
          final containsRaw = filter['contains'];
          // Resolve template variables like {{searchBar}} from widgetData
          dynamic containsValue;
          if (containsRaw is String && containsRaw.contains('{{')) {
            // For template variables, look in widgetData
            final key =
                containsRaw.replaceAll('{{', '').replaceAll('}}', '').trim();
            containsValue = widgetData?[key];
          } else {
            containsValue = containsRaw;
          }
          // Skip filter if contains value is null or empty (no search term entered)
          if (containsValue == null ||
              (containsValue is String && containsValue.isEmpty)) {
            return true;
          }
          final actualStr = actual?.toString().toLowerCase() ?? '';
          final containsStr = containsValue.toString().toLowerCase();
          return actualStr.contains(containsStr);
        }

        return true;
      });
    }).toList();

    return related;
  }
}
