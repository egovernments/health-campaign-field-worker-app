# CLAUDE.md - digit_flow_builder

## Project Overview
A Flutter/Dart package that provides a JSON-driven dynamic UI rendering framework for health campaign field worker apps. It enables configurable forms and templates without code changes through declarative JSON configurations.

**Package**: `digit_flow_builder` v0.0.1
**SDK**: Dart >=3.4.3 <4.0.0, Flutter >=1.17.0
**Branch**: `console_v.2.0` (main branch: `master`)

## Common Commands

```bash
# Get dependencies
flutter pub get

# Run code generation (auto_route, freezed, json_serializable)
dart run build_runner build --delete-conflicting-outputs

# Watch for changes during development
dart run build_runner watch --delete-conflicting-outputs

# Run tests
flutter test

# Analyze code
flutter analyze
```

## Architecture

### Core Data Flow
```
FlowRegistry.setConfig(jsonConfigs)
  → FlowBuilderHomePage (entry point, receives pageName + navigationParams)
    → ScreenBuilder (renders by screenType)
      → FORM → FormsRenderPage (digit_forms_engine)
      → TEMPLATE → LayoutRendererPage (custom widget tree)
    → ActionHandler (processes action chains)
      → FlowCrudBloc / FlowCrudStateRegistry (state management)
```

### Key Components

| Directory | Purpose |
|---|---|
| `lib/action_handler/` | Action executor pattern - 12+ executors (NAVIGATION, CRUD, SEARCH, TRANSFORM, etc.) |
| `lib/blocs/` | State management: FlowCrudBloc, FlowCrudStateRegistry, SearchStateManager, FormSubmissionRegistry, StateWrapperBuilder |
| `lib/data/` | DigitCrudService, DataConverter, TransformerConfig |
| `lib/widgets/` | 26+ FlowWidget implementations registered via FlowWidgetFactory |
| `lib/utils/` | Interpolation (`{{...}}`), ConditionalEvaluator, FunctionRegistry |
| `lib/router/` | Auto-route configuration |

### Entry Points
- **`FlowRegistry`** (`flow_builder.dart`) - Static registry storing all flow/page JSON configs
- **`FlowBuilderHomePage`** (`flow_builder_home_page.dart`) - Main page widget
- **`ScreenBuilder`** (`screen_builder.dart`) - Routes to FORM or TEMPLATE screens
- **`LayoutRendererPage`** (`layout_renderer.dart`) - Renders TEMPLATE screens with bidirectional scroll pagination

## Key Patterns

### Adding a New Widget
1. Create a class in `lib/widgets/implementations/` implementing `FlowWidget`
2. Define the `format` string identifier
3. Implement the `build()` method: `Widget build(Map<String, dynamic> json, BuildContext context, void Function(ActionConfig) onAction)`
4. Register it in `lib/widgets/widget_registration.dart`

### Adding a New Action Executor
1. Create a class in `lib/action_handler/executors/` implementing `ActionExecutor`
2. Implement `canHandle(String actionType)` and `execute(ActionConfig, BuildContext, Map<String, dynamic> contextData)`
3. Register it in `lib/action_handler/action_executor_registry.dart`

### State Management (Deep Dive)

State is managed through three singleton registries and one BLoC, all keyed by **composite keys** (`screenKey::instanceId`) to support multiple instances of the same page.

#### 1. FlowCrudBloc (`blocs/flow_crud_bloc.dart`)
Extends `CrudBloc` (from `digit_crud_bloc`). One instance per page, created in `FlowBuilderHomePage`.

- Listens to `CrudState` transitions via `onTransition()` (not stream listeners)
- Converts raw `CrudStateLoaded` entities into **wrapped state** via `WrapperBuilder`
- Handles three data loading modes:
  - **Normal mode**: Replaces state with new entities
  - **Legacy append mode**: Appends new entities to existing wrapper (deprecated)
  - **Bidirectional pagination**: Appends/prepends with window trimming (`maxItems` limit)
- On `close()`, disposes both `FlowCrudStateRegistry` and `SearchStateManager` entries for its composite key

#### 2. FlowCrudStateRegistry (`blocs/flow_crud_bloc.dart`)
Singleton that stores and notifies UI of state changes. The central state store.

```
FlowCrudStateRegistry()
  ._map:             Map<compositeKey, ValueNotifier<FlowCrudState?>>  // core state
  ._navParams:       Map<compositeKey, Map<String, dynamic>?>          // navigation params
  ._scrollDirection: Map<compositeKey, String>                         // 'up' | 'down'
  ._paginationInfo:  Map<compositeKey, {limit, maxItems}>              // pagination config
  ._instanceIds:     Map<screenKey, instanceId>                        // current instance tracking
  ._appendMode:      Map<compositeKey, bool>                           // deprecated
```

**FlowCrudState** holds:
- `base` - The underlying `CrudState` from `digit_crud_bloc`
- `stateWrapper` - `List<dynamic>` of wrapped entity data (built by `WrapperBuilder`)
- `formData` - `Map<String, dynamic>` for form prefill data (set by REVERSE_TRANSFORM action)
- `widgetData` - `Map<String, dynamic>` for widget-specific data (e.g., selected filters, search terms)
- `isLoading` - Loading indicator flag

**Key API patterns**:
- `update(screenKey, state)` / `updateByCompositeKey(compositeKey, state)` - Write state
- `get(screenKey)` / `getByCompositeKey(compositeKey)` - Read state
- `listen(screenKey)` / `listenByCompositeKey(compositeKey)` - Returns `ValueNotifier` for `ValueListenableBuilder`
- `setScrollDirection(key, 'up'|'down')` + `consumeScrollDirection(key)` - One-shot flags consumed during state update
- `setPaginationInfo(key, limit, maxItems)` + `consumePaginationInfo(key)` - One-shot pagination config
- `registerInstance(screenKey, instanceId)` - Maps screenKey to current instanceId
- Methods exist in both screenKey (auto-resolves composite key) and direct compositeKey variants

**UI Listening**: Widgets use `ValueListenableBuilder` with `FlowCrudStateRegistry().listen(compositeKey)` to rebuild on state changes (NOT BlocBuilder).

#### 3. SearchStateManager (`blocs/search_state_manager.dart`)
Singleton managing search filters, ordering, and pagination per screen + search name.

```
SearchStateManager()
  ._state:           Map<compositeKey::searchName, {filters, orderBy, paginationWindow}>
  ._notifiers:       Map<compositeKey::searchName, ValueNotifier<int>>   // increment to notify
  ._searchCallbacks: Map<compositeKey::searchName, void Function()>      // triggers search
  ._instanceIds:     Map<screenKey, instanceId>
```

**Composite key format**: `screenKey::instanceId::searchName`

**Filter management**:
- `updateFilters(screenKey, searchName, newFilters)` - Merges by filter `key` field (replaces existing with same key)
- `removeFiltersByKeys(screenKey, searchName, filterKeys)` - Removes specific filters
- `removeFiltersByKeysForScreen(screenKey, filterKeys)` - Removes across ALL searchNames
- `getAllFilters(screenKey)` - Gets deduplicated filters across all searchNames
- `updateOrderBy(screenKey, searchName, orderBy)` - Sets sort order (last one wins)

**Bidirectional Pagination Window**:
- `initPaginationWindow(screenKey, searchName, limit, maxItems)` - Creates window state
- `getPaginationWindow()` returns `PaginationWindow` with: `startOffset`, `endOffset`, `limit`, `maxItems`, `hasMoreUp`, `hasMoreDown`, `totalInWindow`
- `prepareLoadDown()` / `prepareLoadUp()` - Returns offset to fetch, or null if no more data
- `onDataLoaded(direction, loadedCount, totalInWindow)` - Updates window after data arrives
- Window auto-trims when `totalInWindow > maxItems` (removes from opposite end of scroll direction)
- `resetPaginationWindow()` - Called when filters change

**Notification flow**: `updateFilters()` → `_notifyChange()` → increments `ValueNotifier` + calls registered `_searchCallbacks[compositeKey]`

#### 4. FormSubmissionRegistry (`blocs/form_submission_registry.dart`)
Singleton coordinating form submissions for FORM screens. Prevents duplicate handling.

- Initialized once with `FormsBloc` reference: `initialize(formsBloc)` - listens to `FormsSubmittedState`
- `register(schemaKey, instanceId, handler)` - Only one handler per schemaKey; returns false if already registered by different instance
- `unregister(schemaKey, instanceId)` - Only unregisters if instanceId matches
- `clearForm(schemaKey)` - Dispatches `FormsEvent.clearForm` to FormsBloc
- Provides `FormSubmissionRegistrationMixin` for StatefulWidgets

#### 5. WrapperBuilder / StateWrapperBuilder (`blocs/state_wrapper_builder.dart`)
Transforms raw `EntityModel` lists into structured wrapper data for UI consumption.

**WrapperBuilder** processes `wrapperConfig` from JSON:
- Groups entities by type (`_groupEntitiesByType`)
- Finds root entities and applies `filters` (with `equalsFrom` template resolution)
- Builds `relations` (parent-child entity joins via `match.field`/`match.equalsFrom`/`match.inFrom`)
- Supports nested relations
- Applies `fields` (computed field mappings with `from`, `where`, `map`, `select`, `takeFirst`, `takeLast`)
- Applies `computed` fields (sorted by `order`, supports conditions, reduce operations, formula evaluation)
- Applies `computedList` fields (list filtering with `where`, `takeWhile`, `evaluateCondition`)

**Field resolution** (`_resolveValue`):
- Traverses dot-notation paths (`entity.field.nestedField`)
- Resolves `{{template}}` variables
- Handles `EntityModel` (via `EnhancedEntityFieldAccessor`), Maps, Lists, `AdditionalField`
- Special values: `now` (epoch ms), `singleton.*` (app-wide singletons), `.length`
- `EnhancedEntityFieldAccessor` caches `toMap()` calls per build cycle for performance

**Condition evaluators**:
- `ConditionEvaluator` - Handles `if/then/else`, comparison operators (`equals`, `lt`, `gt`, etc.), `increment` operations
- `ComputedEvaluator` - Handles `reduce` operations (`max`, `min`) on lists
- `ComputedListEvaluator` - Filters lists using `FormulaParser` with configurable `transformations` (ageInMonths, type casting, etc.)

#### State Lifecycle
```
Page opens:
  FlowBuilderHomePage.initState()
    → Creates FlowCrudBloc(flowConfig, service, instanceId)
    → FlowCrudStateRegistry().registerInstance(screenKey, instanceId)
    → SearchStateManager().registerInstance(screenKey, instanceId)

  ScreenBuilder.initState()
    → Creates compositeKey = screenKey::instanceId
    → Registers form handler (FORM screens)
    → Executes initActions (SEARCH, TRANSFORM, etc.)

Actions modify state:
  ActionHandler.execute(action, context, contextData)
    → CrudExecutor → FlowCrudBloc.add(CrudEvent) → onTransition → FlowCrudStateRegistry.update()
    → SearchExecutor → SearchStateManager.updateFilters() → triggers search callback → CrudBloc
    → TransformExecutor → Updates FlowCrudStateRegistry with transformed data

Page closes:
  FlowBuilderHomePage.dispose()
    → FlowCrudBloc.close()
      → FlowCrudStateRegistry().disposeByCompositeKey(compositeKey)
      → SearchStateManager().disposeByCompositeKey(compositeKey)
    → FormSubmissionRegistry().unregister(schemaKey, instanceId)
```

### contextData (Deep Dive)

`contextData` is the **mutable data bag** that flows through action chains. Every action executor receives it, can read from it, and returns an updated version. It accumulates results as actions execute sequentially.

#### Structure
```dart
Map<String, dynamic> contextData = {
  'formData':        Map<String, dynamic>,  // Form field values (from FormsSubmittedState)
  'navigation':      Map<String, dynamic>,  // Navigation params passed to this page
  'entities':        List<EntityModel>,      // Entity models (set by TRANSFORM, consumed by CRUD/NAVIGATION)
  'existingModels':  List<EntityModel>,      // Original entities for edit mode change detection
  'searchResults':   Map<String, List>,      // Raw search results (when awaitResults=true)
  'item':            Map<String, dynamic>,   // Current item from template iteration (list view row)
  'wrappers':        List<dynamic>,          // Wrapper config (passed from ScreenBuilder)
  'parentScreenKey': String,                 // Injected by popup actions for screen key resolution
  '_compositeKey':   String,                 // Pre-computed composite key (from layout renderer)
  '_instanceId':     String,                 // Instance ID for state isolation
  'errorType':       String,                 // Set on error (e.g., 'searchError', 'reverseTransformError')
  'errorMessage':    String,                 // Error details
  'reverseTransformResult': Map,             // Form data from REVERSE_TRANSFORM
};
```

#### How contextData flows through action chains
```
Form submitted → ScreenBuilder._handleFormSubmission()
  contextData = { formData: {...}, navigation: {...} }

  → FETCH_TRANSFORMER_CONFIG executor
    reads: contextData['formData'], contextData['navigation'] (isEdit flag)
    writes: contextData['entities'] = List<EntityModel>
    writes: contextData['existingModels'] (edit mode)
    returns updated contextData

  → CREATE_EVENT / UPDATE_EVENT executor
    reads: contextData['entities']
    dispatches CrudBloc event
    returns contextData unchanged

  → NAVIGATION executor
    reads: contextData['entities'] (builds wrapper for target page)
    reads: contextData['formData'] (passes to target page's FlowCrudState.formData)
    reads: contextData['existingModels'] (stores in registry for edit mode)
    resolves action.properties['data'] templates from contextData
    returns contextData unchanged
```

#### contextData in conditional actions
`ActionHandler.executeActions()` builds an `evaluationData` map for condition evaluation by merging:
1. `contextData['formData']` - form field values
2. `contextData['navigation']` - navigation params
3. `FlowCrudState.widgetData` - widget selections (dropdown, filter values)
4. `FlowCrudState.stateWrapper` - for resolving entity paths in expressions

Conditions use `FormulaParser` with expressions like `"selectedStatus == CLOSED_HOUSEHOLD"`.

#### Where contextData originates
- **FORM screens**: Created in `ScreenBuilder._handleFormSubmission()` with `formData` + `navigation`
- **TEMPLATE screens**: Created in widget `onAction` callbacks with `item` (current list item), `_compositeKey`, `parentScreenKey`
- **initActions**: Created in `ScreenBuilder.initState()` with `{ wrappers: [] }`

### stateWrapper (Deep Dive)

`stateWrapper` is the **processed, UI-ready data** stored in `FlowCrudState.stateWrapper`. It's a `List<dynamic>` where each item is typically a `Map<String, dynamic>` containing grouped, related, and computed entity data.

#### How stateWrapper is built

```
Raw EntityModel list (from CrudStateLoaded)
  → FlowCrudBloc.onTransition()
    → WrapperBuilder(entities, flowConfig['wrapperConfig']).build()
      → Groups entities by runtimeType
      → Iterates root entities (config.rootEntity)
      → For each root: applies filters, builds relations, resolves fields, computes values
      → Returns List<Map<String, dynamic>>
    → Stored in FlowCrudStateRegistry as FlowCrudState.stateWrapper
```

#### wrapperConfig JSON structure
```json
{
  "wrapperConfig": {
    "rootEntity": "HouseholdModel",
    "groupByType": false,
    "groupBy": "additionalFields.fields.mrnNumber",
    "searchConfig": {
      "primary": "HouseholdModel",
      "select": ["HouseholdModel", "IndividualModel", "TaskModel"],
      "orderBy": { "field": "createdTime", "order": "DESC" },
      "pagination": { "limit": 10, "maxItems": 30 }
    },
    "filters": [
      { "field": "status", "equals": "ACTIVE" },
      { "field": "boundaryCode", "equalsFrom": "{{navigation.boundary}}" },
      { "entity": "TaskModel", "condition": { "field": "status", "equals": "DELIVERED" }, "join": { "sourceField": "projectBeneficiaryClientReferenceId", "targetField": "clientReferenceId" } }
    ],
    "relations": [
      {
        "name": "individuals",
        "entity": "IndividualModel",
        "match": { "field": "clientReferenceId", "equalsFrom": "memberIds" },
        "filters": [{ "field": "isDeleted", "equals": false }],
        "relations": [
          { "name": "tasks", "entity": "TaskModel", "match": { "field": "projectBeneficiaryClientReferenceId", "inFrom": "projectBeneficiaries.clientReferenceId" } }
        ]
      }
    ],
    "fields": {
      "headName": "individuals.0.name.givenName",
      "latestTask": { "from": "tasks", "where": { "left": "status", "operator": "equals", "right": "DELIVERED" }, "takeLast": true }
    },
    "computed": {
      "doseCount": { "order": 1, "from": "tasks.length" },
      "isComplete": { "order": 2, "condition": { "if": { "left": "doseCount", "operator": "gte", "right": 3 }, "then": true, "else": false } }
    },
    "computedList": {
      "eligibleMembers": { "from": "individuals", "where": { "left": "age", "operator": "gte", "right": 6 } }
    }
  }
}
```

#### stateWrapper item structure (after WrapperBuilder)
```dart
// Each item in stateWrapper is a Map like:
{
  'HouseholdModel': EntityModel,       // Root entity
  'individuals': [EntityModel, ...],   // Related entities from relations
  'tasks': [EntityModel, ...],         // Nested relations
  'headName': 'John Doe',             // Resolved field
  'latestTask': EntityModel,          // Computed query result
  'doseCount': 3,                     // Computed value
  'isComplete': true,                 // Computed condition
  'eligibleMembers': [EntityModel],   // Computed list
}
```

#### How stateWrapper is consumed by UI

1. **CrudItemContext InheritedWidget** - Passes `CrudStateData` (containing stateWrapper modelMap) down the widget tree
2. **LayoutRendererPage** - Extracts `CrudStateData` via `extractCrudStateData(compositeKey)`, which converts stateWrapper into `modelMap` (Map<entityType, List<Map>>)
3. **Template interpolation** - `interpolateWithCrudStates()` resolves `{{context.ModelName.field}}` from modelMap, `{{item.field}}` from current list item
4. **ListView widgets** - Iterate over stateWrapper items, passing each as `item` to child widgets
5. **FlowWidgetFactory.build()** - Reads stateWrapper for visibility/hidden condition evaluation

#### stateWrapper modification paths
- **SEARCH_EVENT** → CrudBloc search → CrudStateLoaded → WrapperBuilder → replaces stateWrapper
- **REFRESH_SEARCH** → Sets scrollDirection flag → CrudBloc search → appends/prepends to stateWrapper (pagination)
- **NAVIGATION executor** → Builds wrapper from contextData['entities'] → pre-populates target page's stateWrapper
- **REVERSE_TRANSFORM** → Reads stateWrapper entities → converts to formData (does not modify stateWrapper)

### Navigation Data (Deep Dive)

Navigation data flows through multiple layers and is stored in multiple places for different purposes.

#### Navigation data lifecycle
```
Source Page (NAVIGATION action)
  ├── action.properties['data'] defines key-value pairs to pass
  │   Each value can be a template: {{formData.fieldName}}, {{item.entityField}}
  │
  ├── NavigationExecutor resolves templates from:
  │   1. FlowCrudState.formData (current page's form data)
  │   2. FlowCrudState.stateWrapper first item
  │   3. contextData (action chain accumulated data)
  │
  ├── Generates target instanceId + compositeKey BEFORE navigation
  │
  ├── Stores resolved data via NavigationRegistry.navigateTo():
  │   FlowCrudStateRegistry._navParams[pageName] = resolvedData
  │   FlowCrudStateRegistry._navParams[compositeKey] = resolvedData
  │
  ├── Pre-populates target page state:
  │   FlowCrudStateRegistry.update(targetCompositeKey, FlowCrudState(
  │     stateWrapper: wrapperFromEntities,  // if entities in contextData
  │     formData: mergedFormData,            // from contextData + formDataConfig
  │   ))
  │
  └── FlowBuilderNavigationService.navigateTo() pushes route with data as navigationParams

Target Page (FlowBuilderHomePage)
  ├── Receives: pageName + navigationParams (Map<String, dynamic>)
  │   navigationParams includes: _instanceId, plus all resolved key-value pairs
  │
  ├── Passes navigationParams to ScreenBuilder
  │
  ├── ScreenBuilder.initState()
  │   resolves {{navigation.paramKey}} in initActions via resolveTemplates()
  │
  ├── For FORM screens (_FormScreenWrapper):
  │   Merges into defaultValues:
  │     1. widget.defaultValues (from config)
  │     2. mergedNavParams (widget.navigationParams + registry params)
  │     3. registryFormData (from REVERSE_TRANSFORM, highest priority for prefill)
  │     4. System values (administrativeArea, availableIDs, loggedInUser*)
  │
  └── For TEMPLATE screens (LayoutRendererPage):
      Available via FlowCrudStateRegistry.getNavigationParams(compositeKey)
```

#### Navigation data storage locations

| Storage | Key Format | What's Stored | Used By |
|---|---|---|---|
| Route arguments | `FlowBuilderHomeRouteArgs` | `pageName`, `navigationParams` | `getScreenKeyFromArgs()`, `getInstanceIdFromArgs()` |
| `FlowCrudStateRegistry._navParams` | `pageName` or `compositeKey` | Resolved navigation key-values | `getNavigationParams()`, SearchExecutor, TransformerExecutor |
| `FlowCrudState.formData` | Via compositeKey | Form prefill data (merged from formData + navigation) | `_FormScreenWrapper`, FormsRenderPage defaultValues |
| `contextData['navigation']` | In-memory during action chain | Current page's navigation params | Condition evaluation, template resolution |

#### Navigation modes (NavigationService)

| Mode | Behavior | JSON Config Value |
|---|---|---|
| `push` (default) | Push new page on stack | `"push"` |
| `replace` | Replace current page (back skips it) | `"replace"` |
| `popAndPush` | Pop current, then push new | `"popAndPush"` |
| `popUntilAndPush` | Pop to specific page, then push | `"popUntilAndPush"` + `popUntilPageName` |
| `popUntil` | Pop to specific page (no push) | `"popUntil"` + `popUntilPageName` |
| `popUntilAndReplace` | Pop to + pop target, push fresh (triggers initActions) | `"popUntilAndReplace"` + `popUntilPageName` |

#### Key resolution utilities (`utils/interpolation.dart`)

| Function | Purpose |
|---|---|
| `getScreenKeyFromArgs(context)` | Extracts pageName from `FlowBuilderHomeRouteArgs` |
| `getInstanceIdFromArgs(context)` | Extracts `_instanceId` from route navigationParams |
| `getEffectiveScreenKey(context, contextData)` | screenKey from args → fallback to `contextData['parentScreenKey']` (popup support) |
| `getCompositeKey(context, screenKey?)` | Builds `screenKey::instanceId` from route args |
| `getEffectiveCompositeKey(context, contextData)` | `contextData['_compositeKey']` → route args → `parentScreenKey + _instanceId` |
| `extractCrudStateData(screenKey)` | Converts FlowCrudState.stateWrapper into `CrudStateData` (modelMap + rawState) |
| `resolveValueRaw(value, contextData)` | Resolves `{{path}}` templates with prefix handling (item., navigation., singleton., fn:, widgetData., etc.) |
| `resolveTemplate(template, contextData)` | Resolves multiple `{{placeholders}}` within a string, supports localization |
| `interpolateWithCrudStates(...)` | Full string interpolation with `context.*`, `item.*`, `navigation.*`, `widgetData.*` prefixes |

#### CrudItemContext InheritedWidget

Propagates state data down the widget tree, used by widgets to access current screen state without direct registry access.

```dart
CrudItemContext({
  CrudStateData? stateData,    // modelMap + rawState from extractCrudStateData()
  int? listIndex,              // Current index in a list view iteration
  Map<String, dynamic>? item,  // Current item from stateWrapper iteration
  String? screenKey,           // Page name (e.g., "manageStock")
  String? compositeKey,        // Full key (e.g., "manageStock::manageStock_1234")
})
```

Accessed via: `CrudItemContext.of(context)` — used extensively by action executors, FlowWidgetFactory, and widget implementations.

### Template Interpolation
- Use `{{variable}}` syntax in JSON configs for dynamic values
- `{{navigation.paramKey}}` resolves from navigation params
- Resolved by `resolveTemplates()` in screen_builder.dart and `InterpolationUtil` in utils

### Visibility/Conditional Logic
- Widgets support `hidden` and `visible` JSON properties
- Evaluated by `ConditionalEvaluator` using `digit_formula_parser`
- Checked at `FlowWidgetFactory.build()` level before rendering

## Internal Dependencies (DIGIT ecosystem)
- `digit_crud_bloc` - CRUD operations and state
- `digit_forms_engine` - Form schema rendering (FormsBloc, FormsRenderPage)
- `digit_data_converter` - Data transformation utilities
- `digit_ui_components` - Pre-built UI components
- `digit_data_model` - Data models and utilities
- `digit_formula_parser` - Expression evaluation for conditionals

## Code Style
- Uses `flutter_lints` (analysis_options.yaml extends `package:flutter_lints/flutter.yaml`)
- BLoC pattern for state management (`flutter_bloc`)
- Freezed for immutable data classes
- Auto-route for navigation
- Generated files have `.gm.dart` suffix (auto_route) - do not edit these manually
- Singletons used for registries (FlowCrudStateRegistry, SearchStateManager, FormSubmissionRegistry)

## JSON Config Flow Diagrams

Every screen/page in the system is defined by a JSON config. Below is the flow diagram for each JSON config showing its structure, which files parse it, and what it produces.

---

### 1. Top-Level Flow Config (Page Registration)

```
JSON Input:
┌──────────────────────────────────────────────────────┐
│ {                                                     │
│   "name": "householdSearch",                          │
│   "screenType": "FORM" | "TEMPLATE",                 │
│   "heading": "...",                                   │
│   "preventScreenCapture": false,                      │
│   "defaultValues": { ... },                           │
│   "wrapperConfig": { ... },         ← see #6          │
│   "initActions": [ ... ],           ← see #4          │
│   "onAction": [ ... ],              ← see #4          │
│   "header": [ {widget} ],          ← see #3          │
│   "body":   [ {widget}, ... ],     ← see #3          │
│   "footer": [ {widget} ],          ← see #3          │
│   "pages": [ ... ],                ← FORM only       │
│   "scrollListener": { ... }        ← see #10         │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  FlowRegistry.setConfig(flows)          ← flow_builder.dart
  Stores in static _flowMap[name]
         │
         ▼
  FlowRegistry.getByName("householdSearch")
         │
         ▼
  FlowBuilderHomePage(pageName, navigationParams)   ← flow_builder_home_page.dart
  Creates FlowCrudBloc, generates instanceId
         │
         ▼
  ScreenBuilder(config, navigationParams, instanceId) ← screen_builder.dart
         │
    ┌────┴────┐
    ▼         ▼
  FORM      TEMPLATE
    │         │
    ▼         ▼
  FormsRenderPage          LayoutRendererPage
  (digit_forms_engine)     (layout_renderer.dart)
  Parses pages[]           Renders header/body/footer
  into form schema         widget tree
```

**Files involved**: `flow_builder.dart:18-33`, `flow_builder_home_page.dart`, `screen_builder.dart:34-217`

---

### 2. FORM Screen Pages Config

```
JSON Input (within flow config):
┌──────────────────────────────────────────────────────┐
│ "pages": [                                            │
│   {                                                   │
│     "page": "pageKey",                                │
│     "type": "page" | "template",                      │
│     "label": "Page Title",                            │
│     "order": 1,                                       │
│     "format": "text|dropdown|date|...",               │
│     "actionLabel": "Submit",                          │
│     "description": "...",                             │
│     "navigateTo": { "name": "...", "data": [...] },  │
│     "conditionalNavigateTo": { ... },                 │
│     "showAlertPopUp": { ... },                        │
│     "visibilityCondition": { "expression": "..." },   │
│     "submitCondition": { ... },                       │
│     "preventScreenCapture": false,                    │
│     "properties": [                                   │
│       {                                               │
│         "fieldName": "name",                          │
│         "type": "string",                             │
│         "label": "Full Name",                         │
│         "format": "text|dropdown|date|radio|...",     │
│         "order": 1,                                   │
│         "hidden": false,                              │
│         "readOnly": false,                            │
│         "required": true,                             │
│         "value": "default",                           │
│         "validations": [                              │
│           { "type": "required", "message": "..." },   │
│           { "type": "min", "value": 2 },              │
│           { "type": "pattern", "value": "regex" }     │
│         ],                                            │
│         "enums": [                                    │
│           { "code": "MALE", "name": "Male" }          │
│         ],                                            │
│         "visibilityCondition": { "expression": "..." }│
│       }                                               │
│     ]                                                 │
│   }                                                   │
│ ]                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  transformJson(config)                   ← utils/utils.dart:106-184
  Normalizes pages[] array → pages{} map
  Normalizes properties[] → properties{}
         │
         ▼
  jsonEncode → FormsBloc.add(FormsEvent.load(schemas))  ← flow_builder_home_page.dart:72-77
         │
         ▼
  FormsRenderPage(schemaKey, defaultValues, navigationParams)  ← digit_forms_engine
  Renders form fields, handles validation, emits FormsSubmittedState
         │
         ▼
  FormSubmissionRegistry._onFormStateChanged()       ← form_submission_registry.dart:56-64
  Routes to registered handler → ScreenBuilder._handleFormSubmission()
         │
         ▼
  Executes onAction[] chain with contextData = { formData, navigation }
```

**Files involved**: `utils/utils.dart:106-184`, `flow_builder_home_page.dart:68-77`, `screen_builder.dart:130-155`

---

### 3. Widget Config (TEMPLATE body/header/footer)

```
JSON Input (within body/header/footer arrays):
┌──────────────────────────────────────────────────────┐
│ {                                                     │
│   "format": "listView|menu_card|button|text|card|     │
│              column|row|panel_card|switch|table|       │
│              selection_card|dropdown|info_card|        │
│              tag|radio|expandable|icon|label_pair_list|│
│              search_bar|qr_view|qr_scanner|           │
│              action_popup|back_link|filter|text_input",│
│   "label": "...",                                     │
│   "description": "...",                               │
│   "visible": "{{expression}}" | true,                 │
│   "hidden": "{{expression}}" | false,                 │
│   "disabled": "{{expression}}" | false,               │
│   "onAction": [ {actionConfig}, ... ],                │
│   "properties": { ... },      ← format-specific       │
│   "children": [ {widget}, ... ], ← nested widgets     │
│   "child": { widget },        ← single child          │
│   "dataSource": "path.to.list" ← listView only       │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  FlowWidgetFactory.build(json, context, onAction)    ← flow_widget_interface.dart:36-113
         │
    ┌────┴──── Visibility Check ────┐
    │ Evaluates json['hidden']       │
    │ Evaluates json['visible']      │
    │ via ConditionalEvaluator       │
    │ against evalContext:           │
    │   item + contextData +         │
    │   modelMap + formData +        │
    │   widgetData                   │
    └────────────┬──────────────────┘
         │
    visible=false → SizedBox.shrink()
    visible=true  ↓
         │
  Looks up _widgets[format]
         │
         ▼
  FlowWidget.build(json, context, onAction)    ← widgets/implementations/*.dart
         │
         ▼
  Returns Flutter Widget tree
  (onAction callback triggers ActionHandler when user interacts)
```

**Format → Implementation file mapping**:
| Format | File | Key Props |
|---|---|---|
| `listView` | `list_view_widget.dart` | `dataSource`, `child`, `properties.spacing` |
| `menu_card` | `menu_card_widget.dart` | `heading`, `description`, `icon` |
| `button` | `button_widget.dart` | `label`, `type` (primary/secondary/tertiary/link) |
| `text` | `text_widget.dart` | `label` (supports `{{templates}}`) |
| `card` | `card_widget.dart` | `children[]` |
| `column` | `column_widget.dart` | `children[]`, `properties.spacing` |
| `row` | `row_widget.dart` | `children[]` |
| `panel_card` | `panel_card_widget.dart` | `heading`, `description`, `items[]` |
| `switch` | `switch_widget.dart` | `cases[]`, condition-based rendering |
| `table` | `table_widget.dart` | `columns[]`, `rows`, `dataSource` |
| `selection_card` | `selection_card.dart` | `options[]`, multi/single select |
| `dropdown` | `dropdown_widget.dart` | `dataSource`, `valueField`, `labelField` |
| `info_card` | `info_card_widget.dart` | `heading`, `items[]` |
| `tag` | `tag_widget.dart` | `label`, `type` |
| `radio` | `radio.dart` | `options[]` |
| `expandable` | `expandable_widget.dart` | `header`, `body` |
| `icon` | `icon_widget.dart` | `name`, `size` |
| `label_pair_list` | `label_pair_list_widget.dart` | `items[{label,value}]` |
| `search_bar` | `search_bar_widget.dart` | `placeholder`, writes to widgetData |
| `qr_view` | `qr_view_widget.dart` | `data` (template for QR content) |
| `qr_scanner` | `qr_scanner_widget.dart` | scanner integration |
| `action_popup` | `action_popup_widget.dart` | `popupBody[]`, `popupActions[]` |
| `back_link` | `back_link.dart` | `label`, back navigation |
| `filter` | `filter_widget.dart` | `filterConfig`, writes to SearchStateManager |
| `text_input` | `text_input_widget.dart` | `placeholder`, writes to widgetData |
| `proximitySearch` | `proximitySearch_widget.dart` | geo-search widget |

**Files involved**: `widget_registry.dart:49-75`, `flow_widget_interface.dart:22-113`, `widgets/widget_registration.dart`

---

### 4. Action Config (initActions / onAction / onScroll)

```
JSON Input:
┌──────────────────────────────────────────────────────┐
│ Direct Action:                                        │
│ {                                                     │
│   "action": "",                                       │
│   "actionType": "SEARCH_EVENT|NAVIGATION|...",        │
│   "properties": { ... }           ← type-specific     │
│ }                                                     │
│                                                       │
│ Conditional Action Group:                             │
│ {                                                     │
│   "condition": { "expression": "x == y" },            │
│   "actions": [                                        │
│     { "actionType": "...", "properties": {} }          │
│   ]                                                   │
│ },                                                    │
│ {                                                     │
│   "condition": { "expression": "DEFAULT" },            │
│   "actions": [ ... ]              ← fallback           │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  ActionConfig.fromJson(json)                ← action_config.dart
         │
         ▼
  ActionHandler.executeActions(actions, context, contextData)  ← action_handler.dart
         │
    ┌────┴──── Has condition? ────┐
    │                              │
    No                            Yes
    │                              │
    ▼                              ▼
  ActionHandler.execute()     Build evaluationData from:
  Single action               formData + navigation +
         │                    widgetData + stateWrapper
         │                         │
         │                    FormulaParser.evaluate(expression)
         │                         │
         │                    First match → execute actions[]
         │                    No match → skip group
         │
         ▼
  ActionExecutorRegistry.execute(action, context, contextData)
         │                                   ← action_executor_registry.dart
         ▼
  Routes to executor by actionType:
  ┌──────────────────────────────────────────────────┐
  │ SEARCH_EVENT        → SearchExecutor             │
  │ NAVIGATION          → NavigationExecutor         │
  │ FETCH_TRANSFORMER   → TransformerExecutor        │
  │ REVERSE_TRANSFORM   → ReverseTransformerExecutor │
  │ CREATE_EVENT        → CrudExecutor               │
  │ UPDATE_EVENT        → UpdateExecutor             │
  │ CLEAR_STATE         → ClearStateExecutor         │
  │ SHOW_TOAST          → ToastExecutor              │
  │ REFRESH_SEARCH      → RefreshSearchExecutor      │
  │ OPEN_SCANNER        → OpenScannerExecutor        │
  │ BACK_NAVIGATION     → BackNavigationExecutor     │
  │ CLOSE_POPUP         → ClosePopupExecutor         │
  └──────────────────────────────────────────────────┘
         │
         ▼
  Returns updated contextData (accumulated through chain)
```

**Files involved**: `action_config.dart`, `action_handler.dart:17-281`, `action_executor_registry.dart`

---

### 5. SEARCH_EVENT Action Config

```
JSON Input:
┌──────────────────────────────────────────────────────┐
│ {                                                     │
│   "actionType": "SEARCH_EVENT",                       │
│   "properties": {                                     │
│     "name": "default",                                │
│     "data": [                                         │
│       {                                               │
│         "key": "boundaryCode",                        │
│         "value": "{{navigation.boundary}}",           │
│         "operation": "equals",                        │
│         "root": "HouseholdModel",                     │
│         "applyIf": "expression",     ← optional       │
│         "lat": 12.97,               ← optional geo    │
│         "long": 77.59               ← optional geo    │
│       }                                               │
│     ],                                                │
│     "orderBy": {                                      │
│       "field": "createdTime",                         │
│       "order": "DESC"                ← or ternary     │
│     },                                                │
│     "filterLogic": "and" | "or",                      │
│     "awaitResults": false                             │
│   }                                                   │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  SearchExecutor.execute()                 ← search_executor.dart
         │
    ┌────┴──── For each filter ────┐
    │                               │
    │  1. Evaluate applyIf          │
    │     (FormulaParser)           │
    │  2. Resolve key template      │
    │  3. Resolve value template    │
    │     (from formData,           │
    │      widgetData, navigation)  │
    │  4. Skip if null/unresolved   │
    └────────────┬─────────────────┘
         │
         ▼
  SearchStateManager.updateFilters(compositeKey, searchName, filters)
  SearchStateManager.resetPagination()     ← resets on new filters
         │
         ▼
  getAllFilters(compositeKey)               ← merges across all searchNames
         │
         ▼
  Build GlobalSearchParameters(filters, primary, select, pagination, orderBy)
         │
         ▼
  CrudBloc.add(CrudEventSearch(params))
         │
    ┌────┴──── awaitResults? ────┐
    │                             │
    false                        true
    │                             │
    ▼                             ▼
  Fire-and-forget            Wait for CrudStateLoaded
  Return contextData         Build wrapper
                             Update registry
                             Return { ...contextData, entities, searchResults }
         │
         ▼
  CrudBloc.onTransition() → WrapperBuilder → FlowCrudStateRegistry.update()
  UI rebuilds via ValueListenableBuilder
```

**Files involved**: `executors/search_executor.dart`, `blocs/search_state_manager.dart`, `blocs/flow_crud_bloc.dart:25-129`

---

### 6. wrapperConfig (Entity → UI Data Transformation)

```
JSON Input (within flow config):
┌──────────────────────────────────────────────────────┐
│ "wrapperConfig": {                                    │
│   "rootEntity": "HouseholdModel",                     │
│   "groupByType": false,                               │
│   "groupBy": "field.path",                            │
│   "searchConfig": { ... },          ← see #9          │
│   "filters": [                                        │
│     { "field": "...", "equals": "..." },              │
│     { "field": "...", "equalsFrom": "{{nav.x}}" },   │
│     { "entity": "T", "condition": {...}, "join": {...}}│
│   ],                                                  │
│   "relations": [                                      │
│     {                                                 │
│       "name": "individuals",                          │
│       "entity": "IndividualModel",                    │
│       "match": {                                      │
│         "field": "clientRefId",                       │
│         "equalsFrom": "memberIds",                    │
│         "inFrom": "list.field"                        │
│       },                                              │
│       "filters": [ ... ],                             │
│       "relations": [ ... ]       ← nested             │
│     }                                                 │
│   ],                                                  │
│   "fields": {                                         │
│     "simple": "entity.path",                          │
│     "query": {                                        │
│       "from": "list",                                 │
│       "where": [{ "left":"..","operator":"..","right":".." }],│
│       "map": "path",                                  │
│       "select": "field",                              │
│       "takeFirst": true,                              │
│       "takeLast": true,                               │
│       "default": "fallback"                           │
│     }                                                 │
│   },                                                  │
│   "computed": {                                       │
│     "field": {                                        │
│       "order": 1,                                     │
│       "from": "path",                                 │
│       "condition": { "if":{...}, "then":v, "else":v },│
│       "reduce": { "field":"x", "operation":"max" },   │
│       "evaluateCondition": {                          │
│         "condition": "formula",                       │
│         "context": ["path"],                          │
│         "transformations": { "key": {"type":"..","source":".."}│ }
│       },                                              │
│       "fallback": "default"                           │
│     }                                                 │
│   },                                                  │
│   "computedList": {                                   │
│     "field": {                                        │
│       "order": 1,                                     │
│       "from": "listPath",                             │
│       "where": { "left":"..","operator":"..","right":".." },│
│       "takeWhile": { ... },                           │
│       "skip": { "from": "path" },                     │
│       "evaluateCondition": { ... }                    │
│     }                                                 │
│   }                                                   │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  WrapperBuilder(entities, wrapperConfig, screenKey).build()
                                        ← state_wrapper_builder.dart:84-197
         │
    ┌────┴──── Processing Pipeline ────┐
    │                                   │
    │  1. _groupEntitiesByType()        │
    │     EntityModel[] → Map<type,[]>  │
    │                                   │
    │  2. If groupByType:               │
    │     Return grouped by type/field  │
    │                                   │
    │  3. For each rootEntity:          │
    │     a. _passesFilters()           │
    │        (field equals, equalsFrom  │
    │         template, entity join)    │
    │     b. Build relations            │
    │        _findRelatedEntities()     │
    │        (match.field/equalsFrom/   │
    │         inFrom, nested relations) │
    │     c. Resolve fields             │
    │        _resolveValue() for simple │
    │        _evaluateFieldMap() for    │
    │        query objects              │
    │     d. _applyComputed() sorted    │
    │        by order, each feeds next  │
    │     e. _applyComputedList()       │
    │        filtered/transformed lists │
    └────────────┬─────────────────────┘
         │
         ▼
  Returns List<Map<String, dynamic>>
  (each map = one root entity + relations + fields + computed)
         │
         ▼
  Stored as FlowCrudState.stateWrapper
  UI reads via CrudItemContext / extractCrudStateData()
```

**Files involved**: `blocs/state_wrapper_builder.dart:84-1583`

---

### 7. NAVIGATION Action Config

```
JSON Input:
┌──────────────────────────────────────────────────────┐
│ {                                                     │
│   "actionType": "NAVIGATION",                         │
│   "properties": {                                     │
│     "name": "targetPageName",                         │
│     "type": "HOME" | "",                              │
│     "navigationMode": "push|replace|popAndPush|       │
│                        popUntilAndPush|popUntil|       │
│                        popUntilAndReplace",            │
│     "popUntilPageName": "pageName",                   │
│     "formDataConfig": "screenKey",   ← collect form   │
│     "data": [                                         │
│       { "key": "isEdit", "value": true },             │
│       { "key": "id", "value": "{{item.clientRefId}}" }│
│     ]                                                 │
│   }                                                   │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  NavigationExecutor.execute()           ← navigation_executor.dart
         │
    ┌────┴──── Step 1: Resolve data ────┐
    │  For each data entry:              │
    │  resolveValue(rawValue,            │
    │    stateFormData ∪ stateWrapper    │
    │    ∪ contextData)                  │
    └────────────┬──────────────────────┘
         │
    ┌────┴──── Step 2: Prepare target ──┐
    │  Generate targetInstanceId         │
    │  targetCompositeKey =              │
    │    targetName::targetInstanceId    │
    │  Clear target state                │
    │  Add _instanceId to navProps       │
    └────────────┬──────────────────────┘
         │
    ┌────┴──── Step 3: Navigate ────────┐
    │  NavigationRegistry.navigateTo()   │
    │  → Store navParams in registry     │
    │    [pageName] and [compositeKey]   │
    │  → FlowBuilderNavigationService   │
    │    .navigateTo(mode, route)        │
    └────────────┬──────────────────────┘
         │
    ┌────┴──── Step 4: Pre-populate ────┐
    │  If contextData['entities']:       │
    │    WrapperBuilder → stateWrapper   │
    │    (handles edit mode merge)       │
    │                                    │
    │  Merge formData:                   │
    │    existing ∪ contextData          │
    │    ∪ formDataConfig                │
    │                                    │
    │  Store existingModels if present   │
    │                                    │
    │  FlowCrudStateRegistry.update(     │
    │    targetCompositeKey, FlowCrudState│
    │  )                                 │
    └────────────┬──────────────────────┘
         │
         ▼
  Target FlowBuilderHomePage receives pageName + navigationParams
```

**Files involved**: `executors/navigation_executor.dart`, `navigation_service/navigation_service.dart:170-268`

---

### 8. FETCH_TRANSFORMER_CONFIG (Form → Entities)

```
JSON Input:
┌──────────────────────────────────────────────────────┐
│ {                                                     │
│   "actionType": "FETCH_TRANSFORMER_CONFIG",            │
│   "properties": {                                     │
│     "configName": "beneficiaryRegistration",           │
│     "formDataConfig": "screenKey",    ← optional       │
│     "forceCreate": false,             ← optional       │
│     "data": [                         ← optional extra │
│       { "key": "projectId", "value": "{{...}}" }      │
│     ]                                                 │
│   }                                                   │
│ }                                                     │
│                                                       │
│ Transformer Config (in jsonConfig[configName]):        │
│ {                                                     │
│   "fallbackModel": "ModelName",                       │
│   "multiEntityField": "field.path",   ← optional      │
│   "models": {                                         │
│     "HouseholdModel": {                               │
│       "mappings": {                                   │
│         "id": "__generate:uuid",                      │
│         "tenantId": "__context:tenantId",              │
│         "memberCount": "page1.memberCount",           │
│         "clientReferenceId": "__generate:uuid",        │
│         "status": "__value:ACTIVE",                   │
│         "boundaryCode": "__context:selectedBoundaryCode",│
│         "auditDetails": "__generate:audit",            │
│         "refField": "__ref:IndividualModel.clientRefId",│
│         "conditionalField": "__switch:type:{A:1,B:2}", │
│         "additionalFields": { "custom": "page1.x" }   │
│       },                                              │
│       "listMappings": { ... }                         │
│     },                                                │
│     "IndividualModel": { "mappings": { ... } }        │
│   }                                                   │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  TransformerExecutor.execute()          ← transformer_executor.dart
         │
    ┌────┴──── Determine form data ─────┐
    │  contextData['formData']           │
    │  ∪ FlowCrudStateRegistry           │
    │    .get(formDataConfig)?.formData   │
    │  ∪ extra data[] resolved values    │
    └────────────┬──────────────────────┘
         │
    ┌────┴──── Build context map ───────┐
    │  projectId, user, tenantId,        │
    │  selectedBoundaryCode, userUUID,   │
    │  householdType, beneficiaryType,   │
    │  + extraContext from data[]        │
    └────────────┬──────────────────────┘
         │
    ┌────┴──── Create or Update? ───────┐
    │                                    │
    isEdit && !forceCreate              else
    && existingModels.isNotEmpty         │
    │                                    │
    ▼                                    ▼
  FormEntityMapper                     FormEntityMapper
  .updateEntitiesFromForm()            .mapFormToEntities()
  (preserves IDs, updates              (creates new EntityModels
   changed fields only)                 with generated IDs)
         │                                    │
         └──────────┬─────────────────────────┘
                    │
                    ▼
  contextData['entities'] = List<EntityModel>
  contextData['existingModels'] = originals (for change detection)
```

**Mapping directives**: `__generate:uuid|timestamp|clientAudit|audit`, `__value:LITERAL`, `__context:key.path`, `__ref:Model.field`, `__switch:path:{v:r,...}`, `__listItem:field`, `list:ModelName`, `collect:path`

**Files involved**: `executors/transformer_executor.dart`, `data/transformer_config.dart`

---

### 9. REVERSE_TRANSFORM (Entities → Form Data)

```
JSON Input:
┌──────────────────────────────────────────────────────┐
│ {                                                     │
│   "actionType": "REVERSE_TRANSFORM",                   │
│   "properties": {                                     │
│     "configName": "beneficiaryRegistration",           │
│     "sourceScreenKey": "manageStock",  ← optional      │
│     "entityTypes": ["StockModel"],     ← optional      │
│     "data": [                          ← optional      │
│       { "key": "entities", "value": "{{individual}}" } │
│     ],                                                │
│     "onError": [ ... ]                 ← optional      │
│   }                                                   │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  ReverseTransformerExecutor.execute()   ← reverse_transformer_executor.dart
         │
    ┌────┴──── Find entities ───────────┐
    │  Priority:                         │
    │  1. data[].value resolved entities │
    │  2. contextData['entities']        │
    │  3. FlowCrudStateRegistry          │
    │     .get(compositeKey)             │
    │     .stateWrapper → extract        │
    │     EntityModels recursively       │
    └────────────┬──────────────────────┘
         │
    ┌────┴──── Filter by entityTypes ───┐
    │  Keep only specified types         │
    │  (if entityTypes provided)         │
    └────────────┬──────────────────────┘
         │
         ▼
  ReverseFormMapper(formConfig, modelInstances)  ← digit_data_converter
  .buildFormData()
         │
         ▼
  Returns Map<String, dynamic> formData
  (structured as page.field = value)
         │
         ▼
  FlowCrudStateRegistry.update(compositeKey, FlowCrudState(
    formData: formData,
    stateWrapper: preserved
  ))
         │
         ▼
  contextData = {
    ...contextData,
    'formData': formData,
    'existingModels': modelInstances   ← for UPDATE change detection
  }
```

**Files involved**: `executors/reverse_transformer_executor.dart`

---

### 10. scrollListener Config (Infinite Scroll)

```
JSON Input (within TEMPLATE flow config):
┌──────────────────────────────────────────────────────┐
│ "scrollListener": {                                   │
│   "triggerMode": "end" | "threshold" | "bidirectional",│
│   "threshold": 0.9,                                  │
│   "debounceMs": 300,                                  │
│   "showLoadingIndicator": true,                       │
│                                                       │
│   // For "end" and "threshold" modes:                 │
│   "onScroll": [ {actionConfig}, ... ],                │
│                                                       │
│   // For "bidirectional" mode:                        │
│   "onScrollDown": [ {actionConfig}, ... ],            │
│   "onScrollUp": [ {actionConfig}, ... ]               │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  LayoutRendererPage._setupScrollListener()  ← layout_renderer.dart
         │
    ┌────┴──── triggerMode ─────────────┐
    │                                    │
    end/threshold        bidirectional   │
    │                    │               │
    ▼                    ▼               │
  onScroll at         Check direction:   │
  bottom/threshold    scroll down →      │
    │                   canLoadDown()?   │
    │                   onScrollDown     │
    │                 scroll up →        │
    │                   canLoadUp()?     │
    │                   onScrollUp       │
    └────────────┬──────────────────────┘
         │
    Debounce (debounceMs)
         │
         ▼
  REFRESH_SEARCH action (typical):
    Sets FlowCrudStateRegistry.setScrollDirection('down'|'up')
    Sets FlowCrudStateRegistry.setPaginationInfo(limit, maxItems)
    Triggers SearchStateManager callback
         │
         ▼
  CrudBloc search → onTransition:
    Consumes scrollDirection flag
    _handleBidirectionalPagination():
      down → append + trim from start
      up   → prepend + trim from end
    Updates SearchStateManager.onDataLoaded()
         │
         ▼
  FlowCrudStateRegistry.update() → UI rebuilds
```

**Files involved**: `layout_renderer.dart`, `executors/refresh_search_executor.dart`, `blocs/flow_crud_bloc.dart:131-190`

---

### 11. CLEAR_STATE Action Config

```
JSON Input:
┌──────────────────────────────────────────────────────┐
│ {                                                     │
│   "actionType": "CLEAR_STATE",                         │
│   "properties": {                                     │
│     "clearAll": false,             ← entire state      │
│     "filterKeys": ["status"],      ← specific filters  │
│     "widgetKeys": ["selectedX"],   ← widget data keys  │
│     "name": "default",             ← search name       │
│     "clearOrderBy": false,                             │
│     "triggerSearch": true          ← re-search after   │
│   }                                                   │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  ClearStateExecutor.execute()            ← clear_state_executor.dart
         │
    ┌────┴──── clearAll? ───────────────┐
    │                                    │
    Yes                                 No (selective)
    │                                    │
    ▼                                    ├── Remove filterKeys from
  Registry.clear()                       │   SearchStateManager
  SearchManager.clear()                  │   (.removeFiltersByKeysForScreen)
    │                                    │
    │                                    ├── Clear orderBy if requested
    │                                    │   (.updateOrderBy(null))
    │                                    │
    │                                    ├── Remove widgetKeys from
    │                                    │   FlowCrudState.widgetData
    │                                    │
    │                                    └── If triggerSearch:
    │                                         hasRemainingFilters?
    │                                           Yes → trigger search callback
    │                                           No  → clear page state
    └────────────────────────────────────┘
```

**Files involved**: `executors/clear_state_executor.dart`

---

### 12. OPEN_SCANNER Action Config

```
JSON Input:
┌──────────────────────────────────────────────────────┐
│ {                                                     │
│   "actionType": "OPEN_SCANNER",                        │
│   "properties": {                                     │
│     "scanType": "qr" | "barcode" | "any",             │
│     "fieldName": "voucherCode",                       │
│     "singleValue": true,                              │
│     "scanLimit": "1",                                 │
│     "isGS1": false,                                   │
│     "onSuccess": [ {actionConfig}, ... ],              │
│     "onError": [ {actionConfig}, ... ]                 │
│   }                                                   │
│ }                                                     │
└──────────────────────────────────────────────────────┘
         │
         ▼
  OpenScannerExecutor.execute()          ← open_scanner_executor.dart
         │
         ▼
  DigitScannerBloc.add(ScanEvent)
         │
         ▼
  Awaits scan result
         │
    ┌────┴──── Success? ────────────────┐
    │                                    │
    Yes                                 No/Error
    │                                    │
    ▼                                    ▼
  Extract value from                   Execute onError
  scan result                          actions
    │
    ▼
  Update FlowCrudState.formData[fieldName] = scannedValue
    │
    ▼
  Execute onSuccess actions with updated contextData
```

**Files involved**: `executors/open_scanner_executor.dart`

---

### 13. Conditional / Visibility Config

```
JSON Input (three forms):

A. Widget-level visibility:
┌─────────────────────────────┐
│ { "visible": "{{expr}}" }    │  OR  { "hidden": "{{expr}}" }
└─────────────────────────────┘
         │
         ▼
  FlowWidgetFactory.build()     ← flow_widget_interface.dart:36-88
  ConditionalEvaluator.evaluate(json['hidden'|'visible'], evalContext)
  evalContext = { item, contextData, modelMap, formData, widgetData }
  Result: render widget or SizedBox.shrink()

B. Action-level condition:
┌─────────────────────────────────────────────┐
│ { "condition": { "expression": "x == y" } } │
└─────────────────────────────────────────────┘
         │
         ▼
  ActionHandler.evaluateCondition()     ← action_handler.dart:97-123
  flattenFormData(evaluationData) → FormulaParser(expression, flatData)
  Result: true → execute actions[], false → skip

C. Form field visibility:
┌──────────────────────────────────────────────────┐
│ { "visibilityCondition": { "expression": "..." } }│
└──────────────────────────────────────────────────┘
         │
         ▼
  Handled by digit_forms_engine (FormsRenderPage)
  Result: show/hide form field
```

**Files involved**: `flow_widget_interface.dart:36-88`, `action_handler.dart:97-123`, `utils/conditional_evaluator.dart`

---

### Summary: Config Type → Parser → Output

| # | Config | Parser File | Output |
|---|---|---|---|
| 1 | Flow Config | `flow_builder.dart` | Registered page in FlowRegistry |
| 2 | FORM Pages | `utils.dart` → `digit_forms_engine` | Rendered form with validation |
| 3 | Widget Config | `flow_widget_interface.dart` | Flutter Widget tree |
| 4 | Action Config | `action_handler.dart` | Routed to executor, updated contextData |
| 5 | SEARCH_EVENT | `search_executor.dart` | CrudBloc search, accumulated filters |
| 6 | wrapperConfig | `state_wrapper_builder.dart` | `List<Map>` stateWrapper |
| 7 | NAVIGATION | `navigation_executor.dart` | Route push + pre-populated state |
| 8 | TRANSFORMER | `transformer_executor.dart` | `List<EntityModel>` in contextData |
| 9 | REVERSE_TRANSFORM | `reverse_transformer_executor.dart` | formData for prefill |
| 10 | scrollListener | `layout_renderer.dart` | Infinite scroll with pagination |
| 11 | CLEAR_STATE | `clear_state_executor.dart` | Selective/full state cleanup |
| 12 | OPEN_SCANNER | `open_scanner_executor.dart` | Scanned value in formData |
| 13 | Conditional | `flow_widget_interface.dart`, `action_handler.dart` | Boolean visibility/execution |

## Important Files
- `flow-config-schema.json` - JSON schema defining valid flow configuration structure
- `document.md` - Comprehensive architecture documentation
- `ERROR_HANDLER.md` - Error handling patterns reference
- `TECH_BACKLOG.md` - Technical backlog and improvements
- `TODO.md` - Current development TODOs
- `pubspec_overrides.yaml` - Local dependency overrides for development
