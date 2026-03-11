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
  State<MultiEntityTabView> createState() => MultiEntityTabViewState();
}

class MultiEntityTabViewState extends State<MultiEntityTabView> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  /// Navigate to a specific tab by index
  void goToTab(int index) {
    if (index >= 0 && index < widget.entities.length) {
      setState(() {
        selectedIndex = index;
      });
    }
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
            key: ValueKey('tab_bar_$selectedIndex'),
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

    debugPrint('MultiEntityTabView: Building form for entity $entityIndex');
    debugPrint('MultiEntityTabView: Navigation params: ${widget.navigationParams}');
    debugPrint('MultiEntityTabView: Entity schema properties: ${entitySchema.properties?.keys.toList()}');

    final nonHiddenFields = entitySchema.properties?.entries.where((entry) {
      final fieldSchema = entry.value;
      return fieldSchema.hidden != true;
    }).toList() ?? [];

    debugPrint('MultiEntityTabView: Non-hidden fields for entity $entityIndex: ${nonHiddenFields.map((e) => e.key).toList()}');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(spacer2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: nonHiddenFields.map((entry) {
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
            }).toList(),
      ),
    );
  }

  /// Creates a modified schema where field names include the entity index suffix.
  ///
  /// Example: wayBillNumber -> wayBillNumber_item_0
  PropertySchema _createSchemaForEntity(int entityIndex) {
    final originalProperties = widget.schema.properties ?? {};
    final modifiedProperties = <String, PropertySchema>{};
    final entitySuffix = '_item_$entityIndex';

    debugPrint('MultiEntityTabView: Creating schema for entity $entityIndex');
    debugPrint('MultiEntityTabView: Original properties: ${originalProperties.keys.toList()}');

    for (final entry in originalProperties.entries) {
      final fieldName = entry.key;
      final fieldSchema = entry.value;

      // Skip fields that have any entity suffix (e.g., _item_0, _item_1)
      // These are pre-created entity-specific fields handled separately
      if (RegExp(r'_item_\d+$').hasMatch(fieldName)) {
        // Only include if it matches THIS entity's suffix
        if (fieldName.endsWith(entitySuffix)) {
          modifiedProperties[fieldName] = fieldSchema;
          debugPrint('MultiEntityTabView: Added pre-created field: $fieldName');
        }
        continue;
      }

      // Skip readonly/hidden fields from renaming
      final shouldRename = fieldSchema.readOnly != true &&
          fieldSchema.hidden != true &&
          !fieldName.startsWith('_') &&
          fieldName != 'id';

      if (shouldRename) {
        // Check if a pre-created field with custom validation exists for this entity
        final targetFieldName = '$fieldName$entitySuffix';
        if (originalProperties.containsKey(targetFieldName)) {
          // Skip - the pre-created field will be added when we iterate to it
          debugPrint('MultiEntityTabView: Skipping $fieldName - pre-created $targetFieldName exists');
          continue;
        } else {
          // Rename field for this entity
          modifiedProperties[targetFieldName] = fieldSchema;
          debugPrint('MultiEntityTabView: Renamed $fieldName -> $targetFieldName');
        }
      } else {
        // Keep as-is
        modifiedProperties[fieldName] = fieldSchema;
        debugPrint('MultiEntityTabView: Kept as-is: $fieldName');
      }
    }

    debugPrint('MultiEntityTabView: Final properties for entity $entityIndex: ${modifiedProperties.keys.toList()}');
    return widget.schema.copyWith(properties: modifiedProperties);
  }
}
