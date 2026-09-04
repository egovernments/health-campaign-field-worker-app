# DIGIT Flow Builder

A JSON-driven dynamic UI rendering framework that builds complete screens and workflows from configuration. Flow configs are registered in `FlowRegistry` by the host application, and the framework renders forms or templates, handles user actions (search, create, update, delete, navigate), and manages state — all without writing screen-level code.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  digit_flow_builder: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Features

- Render complete screens (forms or templates) from JSON flow configuration registered in `FlowRegistry`
- Two screen types — **FORM** (powered by digit_forms_engine) and **TEMPLATE** (custom layout with 26+ widgets)
- 12 built-in action types — create, update, search, navigate, scan QR, show toast, clear state, and more
- Conditional action execution — run actions only when formula conditions are met
- Template interpolation — dynamically resolve values in labels, properties, and actions using `{{key}}` syntax
- Bidirectional pagination with scroll listeners
- Multi-instance support — same screen can run multiple independent instances
- Transform form data to entities and reverse-transform entities back to form data for editing
- Accumulated search filters across multiple search interactions
- Custom widget registration — plug in your own widgets alongside built-in ones
- Screen capture protection on sensitive screens

## Getting Started

### Step 1: Register Flow Configs

Register your flow configurations into `FlowRegistry`. This is typically done at app startup after fetching configs from your backend/MDMS:

```dart
import 'package:digit_flow_builder/flow_builder.dart';

// Register a list of flow configs
FlowRegistry.setConfig([
  registrationFlowConfig,   // Map<String, dynamic>
  deliveryFlowConfig,
  closedHouseholdFlowConfig,
]);

// Retrieve a specific flow by name
final config = FlowRegistry.getByName('REGISTRATION');

// Get all registered configs
final allConfigs = FlowRegistry.getAllConfigs();
```

### Step 2: Navigate to a Flow

Use `FlowBuilderHomePage` to render a registered flow:

```dart
// Navigate to a flow screen
context.router.push(
  FlowBuilderHomePageRoute(screenKey: 'REGISTRATION'),
);
```

### Step 3: Define Flow Config Structure

A flow config is a JSON/Map with the following structure:

```json
{
  "name": "REGISTRATION",
  "initialPage": "SEARCH",
  "flows": [
    {
      "screenType": "TEMPLATE",
      "name": "SEARCH",
      "header": [],
      "body": [
        {
          "type": "template",
          "format": "proximitySearch",
          "label": "SEARCH_HEADING",
          "fieldName": "proximitySearch"
        },
        {
          "type": "template",
          "format": "listView",
          "label": "RESULTS",
          "fieldName": "resultsList"
        }
      ],
      "footer": [],
      "initActions": [
        {
          "actionType": "SEARCH_EVENT",
          "properties": { ... }
        }
      ]
    },
    {
      "screenType": "FORM",
      "name": "REGISTER_HOUSEHOLD",
      "pages": [ ... ],
      "summary": true,
      "onAction": [
        {
          "actionType": "FETCH_TRANSFORMER_CONFIG",
          "properties": { "configName": "householdRegistration" }
        },
        {
          "actionType": "CREATE_EVENT",
          "properties": { "entity": "HOUSEHOLD, INDIVIDUAL, MEMBER" }
        },
        {
          "actionType": "NAVIGATION",
          "properties": { "type": "TEMPLATE", "name": "successScreen" }
        }
      ]
    }
  ]
}
```

## Flow Config Keys

### Top-Level Config

| Key | Type | Required | Description |
|-----|------|----------|-------------|
| `name` | `String` | Yes | Unique flow identifier (used with `FlowRegistry.getByName`) |
| `initialPage` | `String` | No | Starting page name |
| `order` | `int` | No | Display order on home page |
| `disabled` | `bool` | No | Disable this flow |
| `flows` | `List` | Yes | Array of screen configurations |

### Screen Config (inside `flows`)

| Key | Type | Required | Description |
|-----|------|----------|-------------|
| `screenType` | `String` | Yes | `FORM` or `TEMPLATE` |
| `name` | `String` | Yes | Unique screen name |
| `header` | `List` | No | Header widgets (TEMPLATE only) |
| `body` | `List` | No | Body widgets (TEMPLATE only) |
| `footer` | `List` | No | Footer widgets (TEMPLATE only) |
| `pages` | `List` | No | Form pages (FORM only, uses digit_forms_engine schema) |
| `summary` | `bool` | No | Show summary before submission (FORM only) |
| `initActions` | `List` | No | Actions to execute when screen loads |
| `onAction` | `List` | No | Actions to execute on form submission / button click |
| `scrollListener` | `Object` | No | Scroll-based pagination config |
| `preventScreenCapture` | `bool` | No | Block screenshots on this screen |

### Widget Config (inside `body`, `header`, `footer`)

| Key | Type | Required | Description |
|-----|------|----------|-------------|
| `type` | `String` | Yes | Widget type (`template`, `string`, etc.) |
| `format` | `String` | Yes | Widget format (see Built-in Widgets below) |
| `label` | `String` | No | Display label (supports `{{key}}` interpolation) |
| `fieldName` | `String` | No | Field identifier |
| `onAction` | `List` | No | Actions triggered by this widget |
| `visibilityCondition` | `Object` | No | Show/hide condition |
| `disabledCondition` | `Object` | No | Enable/disable condition |

### Action Config

| Key | Type | Required | Description |
|-----|------|----------|-------------|
| `actionType` | `String` | Yes | Action type (see Supported Actions below) |
| `properties` | `Map` | No | Action-specific configuration |
| `condition` | `Object` | No | Execute only if condition is true |
| `actions` | `List` | No | Nested sub-actions |

## Screen Types

| Type | Description | Powered By |
|------|-------------|------------|
| **FORM** | Multi-page configurable forms with validation, visibility conditions, and summary | digit_forms_engine |
| **TEMPLATE** | Custom layouts with header, body, footer using 26+ built-in widgets | WidgetRegistry |

## Supported Actions

| Action | Description |
|--------|-------------|
| `CREATE_EVENT` | Create new entities from form data or context |
| `UPDATE_EVENT` | Update existing entities with change detection |
| `SEARCH_EVENT` | Search entities with filters, pagination, and proximity |
| `REFRESH_SEARCH` | Re-execute previous search with new pagination |
| `FETCH_TRANSFORMER_CONFIG` | Map form data to entity models using transformer config |
| `REVERSE_TRANSFORM` | Map entities back to form data for pre-filling edit forms |
| `NAVIGATION` | Navigate to another page or flow (push, replace, pop, popUntil) |
| `BACK_NAVIGATION` | Handle back button with custom logic |
| `OPEN_SCANNER` | Open QR/barcode scanner |
| `SHOW_TOAST` | Display toast notification |
| `CLEAR_STATE` | Clear filters, widget data, or full state |
| `CLOSE_POPUP` | Close an action popup |

### Action Example with Condition

Actions can be conditionally executed using formula expressions:

```json
{
  "actionType": "NAVIGATION",
  "condition": {
    "expression": "status == 'COMPLETED'"
  },
  "properties": {
    "type": "TEMPLATE",
    "name": "successScreen"
  }
}
```

## Template Interpolation

Use `{{key}}` syntax to dynamically resolve values from form data, widget data, navigation params, or state:

```json
{
  "label": "Household: {{householdDetails.headName}}",
  "description": "Members: {{memberCount}}"
}
```

| Syntax | Source |
|--------|--------|
| `{{fieldName}}` | Form data or widget data |
| `{{page.fieldName}}` | Nested path access |
| `{{navigation.paramName}}` | Navigation parameters |
| `{{fn:functionName(args)}}` | Function call |

## Built-in Widgets (for TEMPLATE screens)

| Category | Widgets |
|----------|---------|
| **Layout** | Column, Row, Card, Expandable, Panel Card |
| **Input** | Text Input, Dropdown, Radio, Switch, Search Bar, Filter |
| **Display** | Text, Tag, Icon, Info Card, Menu Card, Label Pair List, Table |
| **List** | ListView (with scroll pagination) |
| **Selection** | Selection Card |
| **Scanner** | QR Scanner, QR View |
| **Navigation** | Button, Back Link, Action Popup |
| **Search** | Proximity Search |

## Custom Widget Registration

Register your own widgets to be used alongside built-in ones:

```dart
// Static component
CustomComponentRegistry.register(
  'myWidget',
  (context, config) => MyCustomWidget(config: config),
);

// Dynamic builder with state access
CustomComponentRegistry.registerDynamic(
  'myStatefulWidget',
  (context, config, pageStateAccessor) {
    final otherPageData = pageStateAccessor.getPageState('otherPage');
    return MyStatefulWidget(data: otherPageData);
  },
);
```

## Scroll Listener (Pagination)

Configure scroll-based pagination for TEMPLATE screens:

```json
{
  "scrollListener": {
    "triggerMode": "bidirectional",
    "onScrollDown": [
      {
        "actionType": "REFRESH_SEARCH",
        "properties": { "direction": "next" }
      }
    ],
    "onScrollUp": [
      {
        "actionType": "REFRESH_SEARCH",
        "properties": { "direction": "previous" }
      }
    ]
  }
}
```

| Trigger Mode | Description |
|--------------|-------------|
| `end` | Trigger when scrolled to bottom |
| `threshold` | Trigger at a scroll threshold |
| `bidirectional` | Trigger on both scroll up and scroll down |

## How It Works

1. The host application registers flow configs into `FlowRegistry`
2. `ScreenBuilder` reads the config from the registry and checks the screen type
3. **FORM** screens are handed off to digit_forms_engine for rendering
4. **TEMPLATE** screens are rendered by `LayoutRendererPage` using `WidgetRegistry`
5. User interactions trigger actions defined in the config
6. `ActionHandler` executes the right action executor based on `actionType`
7. State is managed per screen instance via `FlowCrudStateRegistry`

## Integrates With

| Package | How |
|---------|-----|
| digit_forms_engine | Renders FORM screens, handles validation and submission |
| digit_crud_bloc | Powers search, create, update, delete operations |
| digit_formula_parser | Evaluates conditional expressions for actions and visibility |
| digit_data_converter | Transforms form data to entities and vice versa |
| digit_data_model | Entity models (Household, Individual, Task, etc.) |
| digit_ui_components | UI components for consistent look and feel |

## Core Exports

```dart
import 'package:digit_flow_builder/flow_builder.dart';

// Gives you access to:
// - FlowRegistry
// - FlowBuilderHomePage
// - ScreenBuilder
// - LayoutRendererPage
// - ActionHandler, ActionConfig
// - FlowCrudBloc, FlowCrudState, FlowCrudStateRegistry
// - SearchStateManager
// - FormSubmissionRegistry
// - CustomComponentRegistry
// - WidgetRegistry
// - NavigationService
```
