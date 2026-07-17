import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/digit_tab_bar_theme.dart';
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
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  /// Current tab index — kept for backwards compatibility with any
  /// external caller that used to read the old `selectedIndex` field.
  int get selectedIndex => _selectedIndex.value;

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  /// Navigate to a specific tab by index
  void goToTab(int index) {
    if (index >= 0 && index < widget.entities.length) {
      _selectedIndex.value = index;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (context, selected, _) => _buildTabBar(context, selected),
        ),
        const SizedBox(height: spacer2),
        Expanded(
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, selected, _) => IndexedStack(
              index: selected,
              children: widget.entities.asMap().entries.map((entry) {
                final index = entry.key;
                final entity = entry.value;
                return _buildEntityForm(index, entity);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  /// Horizontally-scrollable tab bar where the selected tab expands to fit
  /// its full entity name and the others collapse to a compact ellipsized
  /// preview. Keeps four+ product tabs readable on narrow screens where the
  /// default equal-width layout truncates every label.
  ///
  /// All colors, text styles, heights, and padding come from
  /// [DigitTabBarThemeData] so the tabs remain visually identical to the
  /// shared `DigitTabBar`; only the per-tab width behavior is customised.
  Widget _buildTabBar(BuildContext context, int selected) {
    final defaults = DigitTabBarThemeData.defaultTheme(context);
    final tabBarTheme =
        Theme.of(context).extension<DigitTabBarThemeData>() ?? defaults;

    final selectedPadding = tabBarTheme.padding ?? defaults.padding!;
    const unselectedPadding =
        EdgeInsets.symmetric(horizontal: 12, vertical: 8);
    final selectedTabHeight =
        tabBarTheme.selectedTabHeight ?? defaults.selectedTabHeight!;
    final tabHeight = tabBarTheme.tabHeight ?? defaults.tabHeight!;
    final selectedTextStyle =
        tabBarTheme.selectedTextStyle ?? defaults.selectedTextStyle!;
    final unselectedTextStyle =
        tabBarTheme.unselectedTextStyle ?? defaults.unselectedTextStyle!;
    final maxLine = tabBarTheme.maxLine ?? defaults.maxLine!;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: widget.entities.asMap().entries.map((entry) {
          final index = entry.key;
          final name = _getEntityName(entry.value);
          final isSelected = index == selected;

          return GestureDetector(
            onTap: () => _selectedIndex.value = index,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              height: isSelected ? selectedTabHeight : tabHeight,
              padding: isSelected ? selectedPadding : unselectedPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? const DigitColors().light.paperPrimary
                    : const DigitColors().light.paperSecondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                border: Border(
                  top: BorderSide(
                    color: isSelected
                        ? const DigitColors().light.primary1
                        : const DigitColors().light.genericInputBorder,
                    width: isSelected ? 2 : 1,
                  ),
                  left: BorderSide(
                    color: isSelected
                        ? const DigitColors().light.primary1
                        : const DigitColors().light.genericInputBorder,
                    width: isSelected ? 2 : 1,
                  ),
                  right: BorderSide(
                    color: isSelected
                        ? const DigitColors().light.primary1
                        : const DigitColors().light.genericInputBorder,
                    width: isSelected ? 2 : 1,
                  ),
                  bottom: BorderSide(
                    color: isSelected
                        ? const DigitColors().light.primary1
                        : const DigitColors().light.genericInputBorder,
                    width: isSelected ? 4 : 1,
                  ),
                ),
              ),
              child: Text(
                name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: maxLine,
                style: isSelected ? selectedTextStyle : unselectedTextStyle,
              ),
            ),
          );
        }).toList(),
      ),
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
