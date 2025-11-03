import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/digit_tab_bar_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tab.dart';
import 'package:flutter/material.dart';

import '../models/property_schema/property_schema.dart';
import 'widgets.dart';

/// A tab-based view for capturing the same form fields for multiple entities.
///
/// Example: If user selects 3 products, this shows 3 tabs (one per product)
/// where each tab contains the same form fields.
class MultiEntityTabView extends StatefulWidget {
  final PropertySchema schema;
  final String pageName;
  final String currentSchemaKey;
  final List<Map<String, Widget>>? customComponents;
  final Map<String, dynamic>? navigationParams;
  final List<dynamic> entities; // Selected products/beneficiaries/etc.

  const MultiEntityTabView({
    super.key,
    required this.schema,
    required this.pageName,
    required this.currentSchemaKey,
    required this.entities,
    this.customComponents,
    this.navigationParams,
  });

  @override
  State<MultiEntityTabView> createState() => _MultiEntityTabViewState();
}

class _MultiEntityTabViewState extends State<MultiEntityTabView> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  String _getEntityName(dynamic entity) {
    if (entity == null) return 'Item';

    // If entity is a Map (object with properties)
    if (entity is Map) {
      // Try common property names for entity name
      final name = entity['name']?.toString() ??
          entity['sku']?.toString() ??
          entity['label']?.toString() ??
          entity['code']?.toString() ??
          entity['value']?.toString();

      if (name != null && name.isNotEmpty) {
        return name;
      }
    }

    // If entity is a String, use it directly
    if (entity is String && entity.isNotEmpty) {
      return entity;
    }

    // Fallback
    return entity.toString().isNotEmpty ? entity.toString() : 'Item';
  }

  @override
  Widget build(BuildContext context) {
    // Create tab labels
    final tabs = widget.entities.asMap().entries.map((entry) {
      final entity = entry.value;
      final entityName = _getEntityName(entity);
      return entityName;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Scrollable DigitTabBar
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DigitTabBar(
            tabBarThemeData: const DigitTabBarThemeData(
              tabWidth: 220, // Fixed width for scrolling
            ),
            initialIndex: selectedIndex,
            tabs: tabs,
            onTabSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),

        const SizedBox(height: spacer2),

        // Tab Content with IndexedStack
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: widget.entities.asMap().entries.map((entry) {
              final index = entry.key;
              final entity = entry.value;

              return _buildEntityForm(index, entity);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEntityForm(int entityIndex, dynamic entity) {
    // Create a schema with renamed fields for this entity
    final entitySchema = _createSchemaForEntity(entityIndex);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(spacer2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: entitySchema.properties?.entries.where((entry) {
              final fieldSchema = entry.value;
              // Only render non-hidden fields
              return fieldSchema.hidden != true;
            }).map((entry) {
              final fieldName = entry.key;
              final fieldSchema = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: spacer2),
                child: JsonFormBuilder(
                  formControlName: fieldName,
                  schema: fieldSchema,
                  pageName: widget.pageName,
                  currentSchemaKey: widget.currentSchemaKey,
                  components: widget.customComponents,
                  navigationParams: {
                    ...?widget.navigationParams,
                    'currentEntityIndex': entityIndex,
                    'currentEntity': entity,
                    'currentEntityName': _getEntityName(entity),
                  },
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }

  /// Creates a modified schema where field names include the entity index suffix.
  ///
  /// Example: wayBillNumber -> wayBillNumber_item_0
  PropertySchema _createSchemaForEntity(int entityIndex) {
    final originalProperties = widget.schema.properties ?? {};
    final modifiedProperties = <String, PropertySchema>{};

    for (final entry in originalProperties.entries) {
      final fieldName = entry.key;
      final fieldSchema = entry.value;

      // Skip readonly/hidden fields from renaming
      final shouldRename = fieldSchema.readOnly != true &&
          fieldSchema.hidden != true &&
          !fieldName.startsWith('_') &&
          fieldName != 'id';

      if (shouldRename) {
        // Rename field for this entity
        final newFieldName = '${fieldName}_item_$entityIndex';
        modifiedProperties[newFieldName] = fieldSchema;
      } else {
        // Keep as-is
        modifiedProperties[fieldName] = fieldSchema;
      }
    }

    return widget.schema.copyWith(properties: modifiedProperties);
  }
}
