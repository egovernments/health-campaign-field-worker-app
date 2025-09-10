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

There are two main screen types available:

### 1. TEMPLATE Screen
Template screens are used for displaying dynamic content with search, filtering, and navigation capabilities.

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

**Properties:**
- `screenType`: Always "TEMPLATE"
- `name`: Unique identifier for the screen
- `heading`: Display title for the screen
- `description`: Optional description text
- `wrapperConfig`: Consumable data format for current page 
- `body`: Array of UI components for the main content area
- `footer`: Array of UI components for the footer area
- `initActions`: Optional array of actions to execute when screen loads

### 2. FORM Screen
Form screens are used for data collection through multi-step forms.

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

**Properties:**
- `screenType`: Always "FORM"
- `name`: Unique identifier for the form
- `project`: Campaign ID
- `version`: Form version number
- `disabled`: Boolean flag to enable/disable the form
- `isSelected`: Boolean flag for selection state
- `pages`: Array of form page configurations
- `wrapperConfig`: Data configuration for the form
- `onAction`: Array of actions to execute on form submission

---

## Action Types

Actions define what happens when users interact with components. Available action types:

### 1. NAVIGATION
Navigate to another screen or form.
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

### 2. SEARCH_EVENT
Trigger a search operation.
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

### 3. CREATE_EVENT
Create new entities in the system.
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

### 4. FETCH_TRANSFORMER_CONFIG
Fetch configuration data for transformations.
```json
{
  "actionType": "FETCH_TRANSFORMER_CONFIG",
  "properties": {
    "configName": "beneficiaryRegistration",
    "onError": [
      {
        "actionType": "SHOW_TOAST",
        "properties": {"message": "Failed to fetch config."}
      }
    ]
  }
}
```

### 5. SHOW_TOAST
Display toast message to user.
```json
{
  "actionType": "SHOW_TOAST",
  "properties": {
    "message": "Operation completed successfully"
  }
}
```

### 6. UPDATE_EVENT
Update existing entities.
```json
{
  "actionType": "UPDATE_EVENT",
  "properties": {
    "entity": "INDIVIDUAL",
    "data": [
      {"key": "isHead", "value": "field.value"}
    ]
  }
}
```

### 7. CLEAR_EVENT
Clear search results or form data.
```json
{
  "actionType": "CLEAR_EVENT",
  "properties": {
    "type": "CLEAR_EVENT"
  }
}
```

---

## Body Components

Body components are rendered in the main content area of the screen. Available formats:

### 1. switch
Toggle switch component for boolean values.
```json
{
  "format": "switch",
  "label": "Proximity Search",
  "fieldName": "proximitySearch",
  "onAction": [...]
}
```

### 2. searchBar
Search input component.
```json
{
  "format": "searchBar",
  "label": "Enter the name of individual",
  "fieldName": "searchBar",
  "onAction": [...]
}
```

### 3. filter
Filter component for refining search results.
```json
{
  "format": "filter",
  "label": "Filter Search",
  "fieldName": "searchByFilter",
  "onAction": [...]
}
```

### 4. infoCard
Information display card with conditional visibility.
```json
{
  "format": "infoCard",
  "hidden": "{{ context.household.notEmpty }}",
  "label": "No households found",
  "description": "Use the search above to find households or register a new one"
}
```

### 5. listView
Scrollable list component for displaying collections.
```json
{
  "format": "listView",
  "hidden": "{{ context.household.empty }}",
  "fieldName": "listView",
  "data": "members",
  "child": {...}
}
```

### 6. card
Container component for grouping related content.
```json
{
  "format": "card",
  "type": "primary",
  "children": [...]
}
```

### 7. row
Horizontal layout component.
```json
{
  "format": "row",
  "properties": {
    "mainAxisAlignment": "spaceBetween",
    "mainAxisSize": "max"
  },
  "children": [...]
}
```

### 8. text
Text display component with dynamic content.
```json
{
  "format": "text",
  "value": "{{ context.headIndividual.name.givenName }}"
}
```

### 9. button
Interactive button component.
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

### 10. table
Tabular data display component.
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

### 11. labelPairList
Key-value pair display component.
```json
{
  "format": "labelPairList",
  "data": [
    {
      "key": "Household head name",
      "value": "{{context.headIndividual.name.givenName}}"
    }
  ]
}
```

### 12. panelCard
Interactive panel component with actions.
```json
{
  "format": "panelCard",
  "label": "Is Head of Household?",
  "fieldName": "isHead",
  "onAction": [...]
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
Available field formats:

1. **text** - Text input field
2. **locality** - Location picker
3. **latLng** - GPS coordinate picker
4. **date** - Date picker
5. **numeric** - Number input
6. **checkbox** - Boolean checkbox
7. **idPopulator** - ID selection with predefined options
8. **dob** - Date of birth picker with age calculation
9. **select** - Single selection dropdown
10. **scanner** - QR/Barcode scanner input
11. **radio** - Radio button group
12. **dropdown** - Dropdown selection
13. **custom** - Custom component

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
Available validation types:

1. **required** - Field must have a value
   ```json
   {"type": "required", "value": true, "message": "Required field cannot be empty"}
   ```

2. **minLength** - Minimum character length
   ```json
   {"type": "minLength", "value": "2", "message": "Size must be 2 to 200 characters"}
   ```

3. **maxLength** - Maximum character length
   ```json
   {"type": "maxLength", "value": "200", "message": "Size must be 2 to 200 characters"}
   ```

4. **min** - Minimum numeric value
   ```json
   {"type": "min", "value": "1", "message": "Total household members cannot be less than 1"}
   ```

5. **max** - Maximum numeric value
   ```json
   {"type": "max", "value": "10", "message": "Total household members cannot be more than 10"}
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
1. **FORM Navigation**: Navigate to a form screen
   ```json
   {
     "type": "FORM",
     "name": "HOUSEHOLD"
   }
   ```

2. **TEMPLATE Navigation**: Navigate to a template screen
   ```json
   {
     "type": "TEMPLATE",
     "name": "householdOverview"
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