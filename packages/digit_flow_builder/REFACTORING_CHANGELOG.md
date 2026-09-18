# Refactoring Changelog — digit_flow_builder

## 1. StateWrapperBuilder Decomposition (SRP + Abstraction)

### Problem

`state_wrapper_builder.dart` was a **1,584-line monolith** containing entity field access, value resolution, grouping, filtering, condition evaluation, computed field processing, field transformations, and the orchestrating builder — all in a single file with tightly coupled methods.

### Solution

Decomposed into **12 focused modules** under `lib/blocs/wrapper/`, each with a single responsibility. Introduced an `IValueResolver` abstract interface for dependency injection and testability.

The original `state_wrapper_builder.dart` is now a **barrel file** that re-exports all modules, preserving backward compatibility — zero changes needed in consumer files.

### New Files

| File | Responsibility |
|------|---------------|
| `wrapper/entity_field_accessor.dart` | Entity field access with caching and case conversion (`EntityFieldAccessor`, `EnhancedEntityFieldAccessor`) |
| `wrapper/value_resolver.dart` | `IValueResolver` interface + `ValueResolver` implementation — path-based value resolution, list resolution, object traversal |
| `wrapper/entity_grouper.dart` | `EntityGrouper` — groups entities by type or custom field. Accepts `IValueResolver` via constructor |
| `wrapper/entity_filter.dart` | `EntityFilter` — filter evaluation and related entity lookup. Accepts `IValueResolver` via constructor |
| `wrapper/field_evaluator.dart` | `FieldEvaluator` — from/where/select/map pipeline and condition evaluation. Accepts `IValueResolver` via constructor |
| `wrapper/field_transformations.dart` | `FieldTransformations` — static utilities: flatten context, apply transformations, date/age calculations, expression evaluation |
| `wrapper/condition_evaluator.dart` | `ConditionEvaluator` — if-then-else logic and comparison operators |
| `wrapper/computed_evaluator.dart` | `ComputedEvaluator` — reduce operations (max/min) |
| `wrapper/computed_list_evaluator.dart` | `ComputedListEvaluator` — formula-based filtering, transformations, context building |
| `wrapper/computed_field_processor.dart` | `ComputedFieldProcessor` — applies computed fields with condition evaluation. Accepts `FieldEvaluator` as parameter |
| `wrapper/computed_list_processor.dart` | `ComputedListProcessor` — applies computed list operations |
| `wrapper/wrapper_builder.dart` | `WrapperBuilder` — slim orchestrator that creates internal instances and delegates. Same public API: `WrapperBuilder(entities, config, {screenKey}).build()` |

### Modified Files

| File | Change |
|------|--------|
| `lib/blocs/state_wrapper_builder.dart` | Replaced 1,584-line monolith with barrel file (12 export statements) |

### Key Design Decisions

- **`IValueResolver` abstract interface** enables dependency injection and testability for `EntityGrouper`, `EntityFilter`, and `FieldEvaluator`
- **Barrel file pattern** ensures all existing imports (`import 'state_wrapper_builder.dart'`) continue to work without changes
- **`ComputedFieldProcessor` accepts `FieldEvaluator`** as a parameter, eliminating the original hack of creating `WrapperBuilder([], {})` just to call `_evaluateFieldMap()`
- **Consumer files unchanged**: `flow_crud_bloc.dart`, `search_executor.dart`, `navigation_executor.dart` required zero modifications

---

## 2. Widget Abstraction with ResolvedFlowWidget

### Problem

All **26 flow widgets** manually duplicated the same boilerplate:
- `WidgetStateContext.of(context)` — state context setup
- `ConditionalEvaluator.evaluate(json['visible'], ...)` — visibility check
- `ConditionalEvaluator.evaluate(json['disabled'], ...)` — disabled check
- `resolveTemplate(json['label'], ...)` / `interpolateWithCrudStates(...)` — label resolution
- Navigation data resolution in actions
- Condition expression resolution in actions
- Fresh evalContext reading from registry at action time

This violated DRY and SRP — widgets mixed resolution/evaluation plumbing with their UI responsibilities.

### Solution

Created a **`ResolvedFlowWidget`** abstract base class (template method pattern) and **`ResolvedWidgetContext`** that auto-resolve visibility, disabled state, templates, and provide action resolution helpers. Widgets now only implement `buildResolved()` — focused purely on building their UI.

### New File

**`lib/widgets/resolved_flow_widget.dart`** containing:

#### `ResolvedWidgetContext` — Pre-resolved context with helpers

```
Convenience accessors:
  .evalContext, .stateData, .screenKey, .compositeKey, .formData, .widgetData

Template resolution:
  .resolveText(template)              — resolve with evalContext + localization
  .resolveTextWithCrudStates(template) — resolve with list index support
  .resolveField(value)                — type-preserving resolution
  .resolveFieldRaw(value)             — raw resolution via resolveValueRaw
  .evaluateCondition(value)           — conditional evaluation

Action resolution:
  .getFreshEvalContext()              — latest widgetData/formData from registry
  .resolveActionNavData(actionJson, evalContext)    — resolves nav data values
  .resolveActionCondition(actionJson, evalContext)  — resolves condition expressions
  .resolveAction(actionJson, evalContext)           — resolves single action → ActionConfig
  .executeActions(actionsJson, context)             — full resolution + execution pipeline
```

#### `ResolvedFlowWidget` — Abstract base class

```dart
abstract class ResolvedFlowWidget implements FlowWidget {
  @override
  Widget build(json, context, onAction) {
    // 1. Auto-get state via WidgetStateContext.of(context)
    // 2. Auto-get localization via LocalizationContext.maybeOf(context)
    // 3. Auto-check visibility → SizedBox.shrink() if not visible
    // 4. Auto-check disabled state
    // 5. Auto-resolve label + description templates
    // 6. Package into ResolvedWidgetContext
    // 7. Call buildResolved()
  }

  Widget buildResolved(json, context, onAction, resolved);  // ← widgets implement this
}
```

### Migrated Widgets (26 total)

| Widget | Format | Key Changes |
|--------|--------|-------------|
| `text_widget.dart` | `textTemplate` | Uses `resolved.resolveText()` for value |
| `icon_widget.dart` | `icon` | Benefits from auto visibility check |
| `tag_widget.dart` | `tag` | Uses `resolved.resolvedLabel` directly |
| `button_widget.dart` | `button` | Uses `resolved.executeActions()`, `resolved.isDisabled`, `resolved.resolvedLabel` |
| `card_widget.dart` | `card` | Uses `resolved.resolveAction()`, `resolved.getFreshEvalContext()` |
| `menu_card_widget.dart` | `menuCard` | Uses `resolved.resolveAction()`, `resolved.getFreshEvalContext()` for conditional blocks |
| `panel_card_widget.dart` | `panelCard` | Uses `resolved.resolveText()`, `resolved.resolveAction()` |
| `dropdown_widget.dart` | `dropdownTemplate` | Keeps reactive `ValueListenableBuilder` in `buildResolved()`, uses pre-resolved label |
| `text_input_widget.dart` | `textInput` | Keeps `_ReactiveTextInput` stateful widget, uses pre-resolved label |
| `radio.dart` | `radioList` | Keeps reactive state handling in `buildResolved()` |
| `switch_widget.dart` | `switch` | Uses `resolved.resolvedLabel` directly |
| `column_widget.dart` | `column` | Uses `resolved.stateData`, `resolved.state.*` for child rendering |
| `row_widget.dart` | `row` | Uses `resolved.stateData`, `resolved.state.*` for child rendering |
| `expandable_widget.dart` | `expandable` | Visibility handled by base; delegates to `_ExpandableStateful` |
| `list_view_widget.dart` | `listView` | Uses `resolved.state.*` for data source and child processing |
| `table_widget.dart` | `table` | Uses `resolved.*` accessors, keeps complex source resolution |
| `info_card_widget.dart` | `infoCard` | Uses `resolved.resolvedLabel`, `resolved.resolvedDescription`; keeps reactive `ValueListenableBuilder` for hidden check |
| `label_pair_list_widget.dart` | `labelPairList` | Uses `resolved.evalContext` and `resolved.localization` |
| `search_bar_widget.dart` | `searchBar` | Uses `resolved.compositeKey`, `resolved.screenKey` |
| `filter_widget.dart` | `filter` | Uses `resolved.resolvedLabel` |
| `selection_card.dart` | `selectionCard` | Uses `resolved.compositeKey`; keeps reactive `ValueListenableBuilder` |
| `back_link.dart` | `backLink` | Uses `resolved.resolvedLabel`, `resolved.evalContext` for nav data |
| `action_popup_widget.dart` | `actionPopup` | Uses `resolved.localization`, `resolved.stateData`, `resolved.state.*` |
| `qr_scanner_widget.dart` | `qrScanner` | Visibility/disabled via base; uses `resolved.resolvedLabel`, `resolved.isDisabled`, `resolved.evalContext` |
| `qr_view_widget.dart` | `qr_view` | Uses `resolved.evalContext` for QR data template resolution |
| `proximitySearch_widget.dart` | `proximitySearch` | Visibility via base; delegates to `_ProximitySearchStateful` |

### Before / After Example

**Before (ButtonWidget — 224 lines):**
```dart
class ButtonWidget implements FlowWidget {
  Widget build(json, context, onAction) {
    final flowState = WidgetStateContext.of(context);       // manual
    final crudStateData = flowState.stateData;
    if (json['visible'] != null) { ... check visibility }   // manual
    bool isDisabled = false;
    if (json['disabled'] != null) { ... check disabled }    // manual
    final resolvedLabel = resolveTemplate(json['label']...) // manual
    // ... 200+ lines of nav data resolution, condition resolution,
    //     fresh evalContext reading, ActionHandler.executeActions ...
  }
}
```

**After (ButtonWidget — ~50 lines):**
```dart
class ButtonWidget extends ResolvedFlowWidget {
  @override
  String get format => 'button';

  @override
  Widget buildResolved(json, context, onAction, resolved) {
    return DigitButton(
      label: resolved.resolvedLabel ?? '',
      isDisabled: resolved.isDisabled,
      onPressed: () async {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);
          await resolved.executeActions(actionsList, context);
        }
      },
      // ... button props
    );
  }
}
```

### Key Design Decisions

1. **Abstract class, not mixin** — `ResolvedFlowWidget` provides a concrete `build()` implementation (template method pattern). Widgets override `buildResolved()` only.

2. **`FlowWidget` interface unchanged** — `ResolvedFlowWidget implements FlowWidget`. Existing direct `FlowWidget` implementations can co-exist during gradual migration.

3. **`FlowWidgetFactory` keeps its visibility check** — The factory already checks `hidden`/`visible` at the factory level. The base class's check handles widget-level `visible` conditions.

4. **Action resolution is opt-in via helper methods** — Simple display widgets (TextWidget) just use `resolved.resolvedLabel`. Complex widgets use `resolved.executeActions()` or `resolved.resolveAction()`.

5. **Reactive widgets manage their own `ValueListenableBuilder`** — The base class handles the initial build. Reactive state binding (dropdown, text_input, radio, selection_card, info_card) is widget-specific and stays in `buildResolved()`.

6. **Layout containers (column, row, listView) access state via `resolved.state.*`** — They need specific state properties (listIndex, itemData, contextData) for child rendering with `preprocessConfigWithState` and `LayoutMapper.map`.
