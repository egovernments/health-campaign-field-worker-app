import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

import '../flow_crud_bloc.dart';
import 'entity_field_accessor.dart';
import 'value_resolver.dart';

/// Handles entity filtering and relation matching logic.
class EntityFilter {
  final IValueResolver _resolver;
  final String? screenKey;

  EntityFilter(this._resolver, {this.screenKey});

  /// Checks whether a root entity passes all configured filters.
  bool passesFilters(
    dynamic root,
    Map<String, List<dynamic>> entityMap,
    Map<String, dynamic> config,
  ) {
    final filters = config['filters'] as List<dynamic>?;
    if (filters == null || filters.isEmpty) return true;

    // Get navigation params from registry for template resolution
    final navigationParams = screenKey != null
        ? FlowCrudStateRegistry().getNavigationParams(screenKey!) ?? {}
        : <String, dynamic>{};

    // Build context for resolving equalsFrom templates
    final resolveContext = <String, dynamic>{
      'navigation': navigationParams,
    };

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
        } else if (equals != null && value != equals) return false;
      } else {
        final entityType = filter['entity'];
        final condition = filter['condition'];
        final join = filter['join'];
        final filterEntities = entityMap[entityType] ?? [];
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
        if (!hasMatchingEntity) return false;
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
      if (root is EntityModel) root.runtimeType.toString(): root,
    };

    final equalsValue = equalsFrom != null
        ? _resolver.resolveValue(equalsFrom, root, localContext)
        : null;
    final inValues = inFrom != null
        ? _resolver.resolveList(inFrom, localContext).toSet()
        : null;

    debugPrint('DEBUG_FILTER: findRelatedEntities for "${relation['name']}" '
        '(entity=$entityType): candidates=${candidates.length}, '
        'targetField=$targetField, equalsFrom=$equalsFrom, equalsValue=$equalsValue');

    var related = candidates.where((e) {
      if (targetField == null) return false;
      final candidateValue =
          _resolver.resolveValue(targetField, e, localContext);
      final matches = equalsValue != null ? candidateValue == equalsValue :
          (inValues != null ? inValues.contains(candidateValue) : false);
      if (relation['name'] == 'headOfHousehold' || relation['name'] == 'headIndividual') {
        debugPrint('DEBUG_FILTER:   candidate ${e.runtimeType}: '
            '$targetField=$candidateValue vs equalsValue=$equalsValue → matches=$matches');
      }
      return matches;
    }).toList();

    final filters = relation['filters'] as List<dynamic>? ?? [];

    // Get widgetData from registry using screenKey
    final widgetData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey!)?.widgetData
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
