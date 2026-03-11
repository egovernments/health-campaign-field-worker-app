# Dynamic Flow Configuration Technical Documentation

## Overview
This document provides detailed technical documentation for the dynamic flow configuration system used in the Health Campaign Field Worker App. The configuration defines user interface flows, forms, and business logic through JSON-based declarative configuration.

## Table of Contents
1. [Flow Structure](#flow-structure)
2. [Screen Types](#screen-types)
3. [Action Types](#action-types)
4. [Body Components](#body-components)
5. [Footer Components](#footer-components)
6. [Form Configuration](#form-configuration)
7. [Wrapper Configuration](#wrapper-configuration)
8. [Expressions and Conditional Logic](#expressions-and-conditional-logic)
9. [Navigation and Data Flow](#navigation-and-data-flow)

---

## Flow Structure

### Root Configuration
```json
{
  "name": "REGISTRATION-DELIVERY",
  "initialPage": "searchBeneficiary",
  "project": "CMP-2025-08-04-004846",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [...]
}
```

**Properties:**
- `name`: Identifier for the flow configuration
- `initialPage`: The starting screen of the flow
- `project`: Campaign ID associated with this flow
- `version`: Version number for the configuration
- `disabled`: Boolean flag to enable/disable the flow
- `isSelected`: Boolean flag indicating if this flow is currently selected
- `flows`: Array of screen configurations

---

## Screen Types

| Screen Type | Description | Use Case |
|-------------|-------------|----------|
| TEMPLATE | Dynamic content display with search, filtering, and navigation | Search screens, data listing, overview pages |
| FORM | Multi-step data collection forms | Registration forms, surveys, data entry |

### Screen Type Properties

| Property | TEMPLATE | FORM | Description |
|----------|----------|------|-------------|
| `screenType` | "TEMPLATE" | "FORM" | Type identifier |
| `name` | ✓ | ✓ | Unique identifier |
| `heading` | ✓ | ✗ | Display title |
| `description` | ✓ | ✗ | Optional description |
| `project` | ✗ | ✓ | Campaign ID |
| `version` | ✗ | ✓ | Version number |
| `disabled` | ✗ | ✓ | Enable/disable flag |
| `isSelected` | ✗ | ✓ | Selection state |
| `wrapperConfig` | ✓ | ✓ | Data configuration |
| `body` | ✓ | ✗ | Main content components |
| `footer` | ✓ | ✗ | Footer components |
| `initActions` | ✓ | ✗ | Load-time actions |
| `pages` | ✗ | ✓ | Form pages array |
| `onAction` | ✗ | ✓ | Form submission actions |

### 1. TEMPLATE Screen Example
```json
{
  "screenType": "TEMPLATE",
  "name": "searchBeneficiary",
  "heading": "Search Beneficiary",
  "description": "search beneficiary description",
  "wrapperConfig": {...},
  "body": [...],
  "footer": [...]
}
```

### 2. FORM Screen Example
```json
{
  "screenType": "FORM",
  "name": "HOUSEHOLD",
  "project": "CMP-2025-08-04-004846",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "pages": [...],
  "wrapperConfig": {...},
  "onAction": [...]
}
```

---

## Action Types

Actions define what happens when users interact with components.

| Action Type | Description | Common Use Cases |
|-------------|-------------|------------------|
| NAVIGATION | Navigate to another screen or form | Moving between screens, opening forms |
| SEARCH_EVENT | Trigger a search operation | Filtering data, finding records |
| CREATE_EVENT | Create new entities in the system | Saving form data, adding records |
| FETCH_TRANSFORMER_CONFIG | Fetch configuration data for transformations | Loading dynamic configs |
| EVENT | Generic event action for various operations | Custom business logic |
| SHOW_TOAST | Display toast message to user | User feedback, notifications |
| UPDATE_EVENT | Update existing entities | Modifying records |
| CLEAR_EVENT | Clear search results or form data | Resetting forms, clearing filters |

### Action Type Properties

| Action Type | Required Properties | Optional Properties |
|-------------|-------------------|-------------------|
| NAVIGATION | `type`, `name` | `data`, `onError` |
| SEARCH_EVENT | `type`, `name`, `data` | `onError` |
| CREATE_EVENT | `entity` | `data`, `onError` |
| FETCH_TRANSFORMER_CONFIG | `configName` | `data`, `onError` |
| EVENT | `type`, `name` | `data`, `onError` |
| SHOW_TOAST | `message` | - |
| UPDATE_EVENT | `entity`, `data` | `onError` |
| CLEAR_EVENT | `type` | - |

### Action Examples

#### NAVIGATION
```json
{
  "actionType": "NAVIGATION",
  "properties": {
    "type": "FORM",
    "name": "HOUSEHOLD",
    "data": [
      {"key": "nameOfIndividual", "value": "searchBar.value"}
    ]
  }
}
```

#### SEARCH_EVENT
```json
{
  "actionType": "SEARCH_EVENT",
  "properties": {
    "type": "SEARCH_EVENT",
    "name": "name",
    "data": [
      {
        "key": "givenName",
        "value": "field.value",
        "operation": "contains"
      }
    ]
  }
}
```

#### CREATE_EVENT
```json
{
  "actionType": "CREATE_EVENT",
  "properties": {
    "entity": "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY, MEMBER",
    "onError": [
      {
        "actionType": "SHOW_TOAST",
        "properties": {"message": "Failed to create household."}
      }
    ]
  }
}
```

#### EVENT
```json
{
  "actionType": "EVENT",
  "properties": {
    "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT",
    "name": "ENTITY // ADDRESS",
    "data": [...]
  }
}
```

#### SHOW_TOAST
```json
{
  "actionType": "SHOW_TOAST",
  "properties": {
    "message": "Operation completed successfully"
  }
}
```

---

## Body Components

Body components are rendered in the main content area of the screen.

| Component | Description | Interactive | Use Cases |
|-----------|-------------|-------------|-----------|
| switch | Toggle switch for boolean values | Yes | Enable/disable features, filters |
| searchBar | Search input field | Yes | Text search, filtering data |
| filter | Filter controls for data | Yes | Refining search results |
| infoCard | Information display card | No | Empty states, notifications |
| listView | Scrollable list of items | No | Data collections, search results |
| card | Container for grouped content | No | Layout structure |
| row | Horizontal layout container | No | Side-by-side content |
| text | Static or dynamic text display | No | Labels, values, content |
| button | Interactive action button | Yes | Navigation, actions |
| table | Tabular data display | No | Structured data, reports |
| labelPairList | Key-value pairs display | No | Details, summaries |
| panelCard | Interactive panel with actions | Yes | Forms, settings |

### Component Properties

| Component | Common Properties | Specific Properties |
|-----------|------------------|-------------------|
| switch | `format`, `label`, `fieldName` | `onAction` |
| searchBar | `format`, `label`, `fieldName` | `onAction` |
| filter | `format`, `label`, `fieldName` | `onAction` |
| infoCard | `format`, `label`, `description` | `hidden` |
| listView | `format`, `fieldName`, `data` | `child`, `hidden`, `dataSource` |
| card | `format`, `children` | `type` |
| row | `format`, `children` | `properties` (alignment) |
| text | `format`, `value` | - |
| button | `format`, `label`, `properties` | `onAction`, `icon` |
| table | `format`, `data` | `columns`, `rows`, `source` |
| labelPairList | `format`, `data` | - |
| panelCard | `format`, `label`, `fieldName` | `onAction` |

### Component Examples

#### Switch Component
```json
{
  "format": "switch",
  "label": "Proximity Search",
  "fieldName": "proximitySearch",
  "onAction": [...]
}
```

#### Search Bar Component
```json
{
  "format": "searchBar",
  "label": "Enter the name of individual",
  "fieldName": "searchBar",
  "onAction": [...]
}
```

#### List View Component
```json
{
  "format": "listView",
  "hidden": "{{ context.household.empty }}",
  "fieldName": "listView",
  "data": "members",
  "child": {...}
}
```

#### Button Component
```json
{
  "format": "button",
  "label": "Open",
  "properties": {
    "type": "secondary",
    "size": "medium"
  },
  "onAction": [...]
}
```

#### Table Component
```json
{
  "format": "table",
  "data": {
    "source": "individuals",
    "columns": [
      {
        "header": "Beneficiary",
        "cellValue": "{{context.individuals.name.givenName}}"
      }
    ],
    "rows": []
  }
}
```

---

## Footer Components

Footer components are rendered at the bottom of the screen, typically for navigation actions. They use the same component formats as body components but are commonly used for:

- Primary action buttons (Submit, Next, Save)
- Secondary action buttons (Cancel, Back)
- Navigation controls

Example:
```json
"footer": [
  {
    "format": "button",
    "label": "register beneficiary",
    "properties": {
      "type": "primary",
      "size": "large",
      "mainAxisSize": "max",
      "mainAxisAlignment": "center"
    },
    "onAction": [...]
  }
]
```

---

## Form Configuration

Forms consist of multiple pages with various field types and validation rules.

### Form Page Structure
```json
{
  "page": "beneficiaryLocation",
  "type": "object",
  "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_HEADING",
  "order": 2,
  "navigateTo": {"name": "householdDetails", "type": "form"},
  "properties": [...],
  "actionLabel": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_ACTION_BUTTON_LABEL_1",
  "description": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_SCREEN_DESCRIPTION"
}
```

### Field Types (Format)

| Format | Description | Input Type | Use Cases |
|--------|-------------|------------|-----------|
| text | Basic text input field | String | Names, descriptions, addresses |
| locality | Location/boundary picker | String | Geographic locations |
| latLng | GPS coordinate picker | String | Coordinates, mapping |
| date | Date picker component | Date | Registration dates, deadlines |
| numeric | Number input field | Number | Counts, quantities, ages |
| checkbox | Boolean checkbox | Boolean | Yes/No questions, flags |
| idPopulator | ID selection with options | String | Document types, ID categories |
| dob | Date of birth with age calc | Date | Birth dates, age calculation |
| select | Single selection dropdown | String | Gender, status, categories |
| scanner | QR/Barcode scanner input | String | QR codes, barcodes |
| radio | Radio button group | String | Single choice questions |
| dropdown | Dropdown selection | String | Predefined options |
| custom | Custom component | Any | Special UI requirements |

### Field Properties
```json
{
  "type": "string",
  "label": "APPONE_REGISTRATION_BENEFICIARY_LOCATION_label_administrativeArea",
  "order": 1,
  "value": "",
  "format": "locality",
  "hidden": false,
  "tooltip": "",
  "helpText": "",
  "infoText": "",
  "readOnly": false,
  "fieldName": "administrativeArea",
  "deleteFlag": false,
  "innerLabel": "",
  "systemDate": false,
  "validations": [...],
  "errorMessage": "",
  "isMultiSelect": false,
  "enums": [...],
  "schemaCode": ""
}
```

### Validation Types

| Validation Type | Description | Applies To | Example Value |
|----------------|-------------|------------|---------------|
| required | Field must have a value | All field types | `true` |
| minLength | Minimum character length | String fields | `"2"` |
| maxLength | Maximum character length | String fields | `"200"` |
| min | Minimum numeric value | Numeric fields | `"1"` |
| max | Maximum numeric value | Numeric fields | `"10"` |

### Validation Examples

#### Required Validation
```json
{
  "type": "required", 
  "value": true, 
  "message": "Required field cannot be empty"
}
```

#### Length Validations
```json
{
  "type": "minLength", 
  "value": "2", 
  "message": "Size must be 2 to 200 characters"
}
```

#### Numeric Validations
```json
{
  "type": "min", 
  "value": "1", 
  "message": "Total household members cannot be less than 1"
}
```

---

## Wrapper Configuration

Wrapper configuration defines how data is structured and accessed within a screen.

```json
"wrapperConfig": {
  "wrapperName": "HouseholdWrapper",
  "rootEntity": "HouseholdModel",
  "filters": [],
  "relations": [...],
  "searchConfig": {...}
}
```

**Properties:**
- `wrapperName`: Name identifier for the wrapper (can be any custom name)
- `rootEntity`: Primary data model for the screen
- `filters`: Array of filter conditions
- `relations`: Array defining data relationships between entities
- `searchConfig`: Configuration for search operations

### Relations Structure
```json
{
  "name": "members",
  "entity": "HouseholdMemberModel",
  "match": {
    "field": "householdClientReferenceId",
    "equalsFrom": "clientReferenceId"
  },
  "filters": [
    {"field": "isHeadOfHousehold", "equals": true}
  ]
}
```

### Search Configuration
```json
"searchConfig": {
  "primary": "household",
  "select": [
    "household",
    "individual",
    "householdMember",
    "projectBeneficiary",
    "task"
  ]
}
```

---

## Expressions and Conditional Logic

### Expression Syntax
Expressions using `{{ }}` syntax are resolved to extract data from the context.

Examples:
- `{{ context.household.notEmpty }}` - Check if household data is not empty
- `{{ context.headIndividual.name.givenName }}` - Get the given name of head individual
- `{{fn:calculateAge(context.individuals.dateOfBirth)}}` - Call function to calculate age

### Context Variables
The context contains:
- **Wrapper data**: Data from the configured wrapper
- **Project data**: Information related to the current campaign/project
- **Boundary data**: Geographic boundary information
- **Form data**: Current form field values
- **Navigation data**: Data passed between screens

### Conditional Actions
```json
{
  "condition": {
    "expression": "eligibilityChecklist.ec1==NO && eligibilityChecklist.ec3==NO && eligibilityChecklist.ec4==NO"
  },
  "actions": [...]
}
```

### Visibility Conditions
```json
{
  "visibilityCondition": {
    "expression": "eligibilityChecklist.ec1==YES"
  }
}
```

---

## Navigation and Data Flow

### Data Passing Between Screens
Data can be passed between screens using the `data` array:

```json
"data": [
  {
    "key": "HouseholdClientReferenceId",
    "value": "{{contextData.entities.HouseholdModel.clientReferenceId}}"
  }
]
```

### Navigation Types

| Navigation Type | Description | Target Screen | Use Cases |
|----------------|-------------|---------------|-----------|
| FORM | Navigate to a form screen | Multi-step forms | Data collection, registration |
| TEMPLATE | Navigate to a template screen | Dynamic content screens | Search, overview, listings |

### Navigation Properties

| Property | Required | Description | Example |
|----------|----------|-------------|---------|
| `type` | Yes | Navigation type (FORM/TEMPLATE) | `"FORM"` |
| `name` | Yes | Target screen identifier | `"HOUSEHOLD"` |
| `data` | No | Data to pass to target screen | `[{"key": "id", "value": "123"}]` |
| `onError` | No | Error handling actions | `[{"actionType": "SHOW_TOAST", ...}]` |

### Navigation Examples

#### FORM Navigation
```json
{
  "type": "FORM",
  "name": "HOUSEHOLD",
  "data": [
    {"key": "nameOfIndividual", "value": "searchBar.value"}
  ]
}
```

#### TEMPLATE Navigation
```json
{
  "type": "TEMPLATE",
  "name": "householdOverview",
  "data": [
    {"key": "HouseholdClientReferenceId", "value": "{{item.id}}"}
  ]
}
```
---

## Best Practices

1. **Consistent Naming**: Use descriptive and consistent names for screens, fields, and actions
2. **Error Handling**: Always include `onError` handlers for actions that might fail
3. **Validation**: Apply appropriate validation rules for all form fields
4. **Accessibility**: Provide meaningful labels, help text, and tooltips
5. **Performance**: Use conditional rendering (`hidden` property) to optimize screen performance
6. **Data Integrity**: Ensure proper data flow and validation between screens

---

This documentation covers the core concepts and configurations available in the dynamic flow system. Additional components and features can be added as they are implemented.