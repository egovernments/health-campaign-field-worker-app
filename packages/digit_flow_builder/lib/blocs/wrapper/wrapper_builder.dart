import 'package:digit_data_model/data_model.dart';
import 'package:flutter/cupertino.dart';

import 'computed_field_processor.dart';
import 'computed_list_processor.dart';
import 'entity_field_accessor.dart';
import 'entity_filter.dart';
import 'entity_grouper.dart';
import 'field_evaluator.dart';
import 'value_resolver.dart';

/// Orchestrates the wrapper building process by delegating to
/// specialized single-responsibility classes.
class WrapperBuilder {
  final List<EntityModel> entities;
  final Map<String, dynamic> config;
  final String? screenKey;

  WrapperBuilder(this.entities, this.config, {this.screenKey});

  List<dynamic> build() {
    final List<dynamic> wrappers = [];
    // Clear entity toMap() cache at start of build
    EnhancedEntityFieldAccessor.clearCache();

    // Create specialized delegates
    final resolver = ValueResolver();
    final grouper = EntityGrouper(resolver);
    final filter = EntityFilter(resolver, screenKey: screenKey);
    final fieldEvaluator = FieldEvaluator(resolver);

    try {
      final entityMap = grouper.groupEntitiesByType(entities);
      final rootEntityType = config['rootEntity'];
      final groupByType = config['groupByType'] == true;
      final groupByField = config['groupBy'] as String?;

      if (groupByType) {
        // Return all entities grouped by type
        final Map<String, List<dynamic>> groupedEntities = {};
        for (final type in entityMap.keys) {
          final typeEntities = entityMap[type]!;

          // If groupBy field is specified, further group entities by that field
          if (groupByField != null) {
            groupedEntities[type] =
                grouper.groupEntitiesByCustomField(typeEntities, groupByField);
          } else {
            groupedEntities[type] = typeEntities;
          }
        }
        return groupedEntities.entries.map((e) => {e.key: e.value}).toList();
      }

      // Fallback: old behavior, return flat list for rootEntity
      final roots = entityMap[rootEntityType] ?? [];

      for (final root in roots) {
        if (!filter.passesFilters(root, entityMap, config)) continue;

        final wrapperData = <String, dynamic>{rootEntityType: root};

        // 1. Build relations
        _buildRelations(root, wrapperData, entityMap, filter, resolver);

        // 2. Apply normal fields
        _applyFields(root, wrapperData, resolver);

        // 3. Computed fields
        try {
          final computed = ComputedFieldProcessor.applyComputed(
            wrapperData,
            config,
            fieldEvaluator,
            resolver,
          );
          wrapperData.addAll(computed);
        } catch (e) {
          print(e.toString());
        }

        // 4. Computed list fields
        try {
          final computedList = ComputedListProcessor.applyComputedList(
            wrapperData,
            config,
          );
          wrapperData.addAll(computedList);
        } catch (e) {
          print(e.toString());
        }

        wrappers.add(wrapperData);
      }
    } catch (e, st) {
      debugPrint('WrapperBuilder.build error: $e\n$st');
    } finally {
      // Clear cache after build to free memory
      EnhancedEntityFieldAccessor.clearCache();
    }

    debugPrint(wrappers.toString());

    return wrappers;
  }

  /// Builds entity relations (including nested) for a root entity.
  void _buildRelations(
    dynamic root,
    Map<String, dynamic> wrapperData,
    Map<String, List<dynamic>> entityMap,
    EntityFilter filter,
    IValueResolver resolver,
  ) {
    for (final relation in config['relations'] ?? []) {
      final relatedEntities = filter.findRelatedEntities(
        root,
        relation,
        wrapperData,
        entityMap,
      );
      wrapperData[relation['name']] = relatedEntities;

      // Handle nested relations
      if (relation['relations'] != null) {
        for (int i = 0; i < relatedEntities.length; i++) {
          final entity = relatedEntities[i];
          final nestedData = <String, dynamic>{};

          for (final nestedRelation in relation['relations']) {
            final nestedEntities = filter.findRelatedEntities(
              entity,
              nestedRelation,
              {...wrapperData, ...nestedData},
              entityMap,
            );
            nestedData[nestedRelation['name']] = nestedEntities;
          }

          if (entity is Map) {
            entity.addAll(nestedData);
          } else {
            relatedEntities[i] = {'entity': entity, ...nestedData};
          }
        }
      }
    }
  }

  /// Applies normal field configurations to wrapperData.
  void _applyFields(
    dynamic root,
    Map<String, dynamic> wrapperData,
    IValueResolver resolver,
  ) {
    final fields = config['fields'] as Map<String, dynamic>? ?? {};
    for (final entry in fields.entries) {
      final valueConfig = entry.value;
      if (valueConfig is String) {
        wrapperData[entry.key] =
            resolver.resolveValue(valueConfig, root, wrapperData);
      } else if (valueConfig is Map<String, dynamic>) {
        final fieldEvaluator = FieldEvaluator(resolver);
        wrapperData[entry.key] =
            fieldEvaluator.evaluateFieldMap(valueConfig, root, wrapperData);
      } else {
        wrapperData[entry.key] = valueConfig;
      }
    }
  }
}
