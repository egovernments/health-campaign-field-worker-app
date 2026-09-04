# DIGIT Flow Builder Package - Comprehensive Configuration Guide

## Overview
This documentation provides a complete reference for creating configuration packages for the DIGIT Flow Builder. Based on analysis of three sample configurations (Registration-Delivery, Complaint Management, and Inventory Management), this guide covers all patterns, components, and use cases.

---

## Table of Contents
1. [Configuration Structure](#configuration-structure)
2. [Root Level Configuration](#root-level-configuration)
3. [Screen Types](#screen-types)
4. [Wrapper Configuration](#wrapper-configuration)
5. [Component Formats](#component-formats)
6. [Action Types](#action-types)
7. [Form Configuration](#form-configuration)
8. [Template Configuration](#template-configuration)
9. [Data Binding and Context](#data-binding-and-context)
10. [Validation Patterns](#validation-patterns)
11. [Navigation Patterns](#navigation-patterns)
12. [Common Use Cases](#common-use-cases)

---

## 1. Configuration Structure

### Root Level Structure
Every flow configuration must have the following root structure:

```json
{
  "name": "FLOW_NAME",
  "initialPage": "screenName",
  "project": "PROJECT_ID",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": []
}
```

**Fields:**
- `name` (string, required): Unique identifier for the flow (e.g., "REGISTRATION-DELIVERY", "COMPLAINT", "INVENTORY")
- `initialPage` (string, required): Name of the first screen to display
- `project` (string, required): Project identifier
- `version` (integer, required): Version number for the configuration
- `disabled` (boolean, required): Whether the flow is disabled
- `isSelected` (boolean, required): Whether the flow is currently selected
- `flows` (array, required): Array of screen configurations

---

## 2. Root Level Configuration

### Use Cases:
- **Multi-Module Applications**: Group related screens into flows (e.g., Registration, Complaints, Inventory)
- **Version Control**: Track configuration versions for updates
- **Feature Flags**: Enable/disable flows using the `disabled` field

---

## 3. Screen Types

### 3.1 TEMPLATE Screen Type

**Purpose:** Display-only screens with dynamic data, lists, cards, and interactive elements

**Structure:**
```json
{
  "screenType": "TEMPLATE",
  "name": "screenName",
  "heading": "Screen Title",
  "description": "Screen description",
  "header": [],
  "footer": [],
  "body": [],
  "initActions": [],
  "wrapperConfig": {}
}
```

**Use Cases:**
- Search and listing screens
- Dashboard/overview screens
- Detail view screens
- Inbox/list management
- Acknowledgment/success screens

**Example - Search Screen:**
```json
{
  "screenType": "TEMPLATE",
  "name": "searchBeneficiary",
  "heading": "Search Beneficiary",
  "description": "search beneficiary description",
  "header": [
    {
      "format": "backLink",
      "label": "Back",
      "onAction": [{"actionType": "BACK_NAVIGATION", "properties": {}}]
    }
  ],
  "footer": [
    {
      "format": "button",
      "label": "register beneficiary",
      "properties": {"type": "primary", "size": "large"},
      "onAction": [
        {
          "actionType": "NAVIGATION",
          "properties": {"type": "FORM", "name": "HOUSEHOLD"}
        }
      ]
    }
  ],
  "body": [
    {
      "format": "searchBar",
      "label": "Enter the name of individual",
      "fieldName": "searchBar"
    },
    {
      "format": "listView",
      "fieldName": "listView",
      "data": "members",
      "child": { "format": "card", "children": [] }
    }
  ]
}
```

### 3.2 FORM Screen Type

**Purpose:** Multi-page data entry forms with validation and submission

**Structure:**
```json
{
  "screenType": "FORM",
  "name": "FORM_NAME",
  "project": "PROJECT_ID",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "pages": [],
  "wrapperConfig": {},
  "onAction": []
}
```

**Key Features:**
- Multi-page forms with navigation
- Field-level validation
- Conditional visibility
- Auto-fill capabilities
- Form submission actions

**Use Cases:**
- Registration forms
- Data entry forms
- Multi-step wizards
- Survey/checklist forms
- Stock management forms

**Example - Registration Form:**
```json
{
  "screenType": "FORM",
  "name": "HOUSEHOLD",
  "pages": [
    {
      "page": "beneficiaryLocation",
      "type": "object",
      "label": "LOCATION_SCREEN_HEADING",
      "order": 1,
      "navigateTo": {"name": "householdDetails", "type": "form"},
      "properties": [
        {
          "type": "string",
          "label": "Administrative Area",
          "format": "locality",
          "fieldName": "administrativeArea",
          "validations": [
            {"type": "required", "value": true, "message": "Required field"}
          ]
        }
      ]
    }
  ],
  "onAction": [
    {
      "actionType": "CREATE_EVENT",
      "properties": {"entity": "HOUSEHOLD, INDIVIDUAL"}
    },
    {
      "actionType": "NAVIGATION",
      "properties": {"type": "TEMPLATE", "name": "acknowledgement"}
    }
  ]
}
```

---

## 4. Wrapper Configuration

**Purpose:** Define data models, relationships, and search configurations for screens

### Structure:
```json
{
  "wrapperName": "WrapperName",
  "rootEntity": "EntityModel",
  "filters": [],
  "relations": [],
  "searchConfig": {},
  "fields": {},
  "computed": {},
  "computedList": {}
}
```

### 4.1 Basic Wrapper (Simple Entity)

**Use Case:** Single entity without relationships

```json
{
  "wrapperName": "ComplaintWrapper",
  "rootEntity": "PgrServiceModel",
  "filters": [],
  "relations": [],
  "searchConfig": {
    "primary": "pgrService",
    "select": ["pgrService"]
  }
}
```

### 4.2 Wrapper with Relations

**Use Case:** Fetching related data (household + members + individuals)

```json
{
  "wrapperName": "HouseholdWrapper",
  "rootEntity": "HouseholdModel",
  "filters": [],
  "relations": [
    {
      "name": "members",
      "entity": "HouseholdMemberModel",
      "match": {
        "field": "householdClientReferenceId",
        "equalsFrom": "clientReferenceId"
      }
    },
    {
      "name": "individuals",
      "entity": "IndividualModel",
      "match": {
        "field": "clientReferenceId",
        "inFrom": "members.individualClientReferenceId"
      }
    }
  ],
  "searchConfig": {
    "primary": "household",
    "select": ["household", "individual", "householdMember"]
  }
}
```

**Relationship Types:**
- `equalsFrom`: One-to-one relationship (field equals value from parent)
- `inFrom`: One-to-many relationship (field in array from parent)

### 4.3 Wrapper with Filters

**Use Case:** Filter entities by specific criteria

```json
{
  "wrapperName": "HouseholdWrapper",
  "rootEntity": "HouseholdMemberModel",
  "filters": [
    {"field": "isHeadOfHousehold", "equals": true}
  ],
  "relations": []
}
```

### 4.4 Wrapper with Computed Fields

**Use Case:** Calculate values from existing data

```json
{
  "fields": {
    "cycle": {
      "from": "{{tasks.additionalFields.fields}}",
      "where": {"left": "{{key}}", "operator": "eq", "right": "cycleIndex"},
      "select": "{{value}}",
      "takeLast": true,
      "default": 1
    }
  },
  "computed": {
    "hasCycleArrived": {
      "condition": {
        "left": "{{cycle}}",
        "operator": "equals",
        "right": "{{currentRunningCycle}}"
      },
      "fallback": false
    }
  },
  "computedList": {
    "eligibleProductVariants": {
      "from": "{{currentDelivery.0.doseCriteria}}",
      "evaluateCondition": {
        "condition": "{{item.condition}}",
        "context": ["{{individuals.0}}"],
        "transformations": {
          "age": {"type": "ageInMonths", "source": "dateOfBirth"}
        }
      }
    }
  }
}
```

### 4.5 Wrapper with Nested Relations

**Use Case:** Deep hierarchical data structures

```json
{
  "relations": [
    {
      "name": "members",
      "entity": "HouseholdMemberModel",
      "match": {
        "field": "householdClientReferenceId",
        "equalsFrom": "clientReferenceId"
      },
      "relations": [
        {
          "name": "individual",
          "entity": "IndividualModel",
          "match": {
            "field": "clientReferenceId",
            "equalsFrom": "individualClientReferenceId"
          }
        }
      ]
    }
  ]
}
```

### 4.6 Wrapper with GroupBy

**Use Case:** Group items (e.g., stock transactions by MRN number)

```json
{
  "wrapperName": "ViewStockWrapper",
  "groupByType": true,
  "rootEntity": "StockModel",
  "groupBy": "additionalFields.fields.mrnNumber",
  "searchConfig": {
    "primary": "stock",
    "select": ["stock"],
    "orderBy": {"field": "clientCreatedTime", "order": "DESC"}
  }
}
```

---

## 5. Component Formats

### 5.1 Input Components

#### 5.1.1 Text Input
```json
{
  "format": "text",
  "label": "Name",
  "fieldName": "name",
  "validations": [
    {"type": "required", "value": true, "message": "Name is required"}
  ]
}
```

**Use Case:** Single-line text entry (names, IDs, etc.)

#### 5.1.2 Text Area
```json
{
  "format": "textArea",
  "label": "Description",
  "fieldName": "description"
}
```

**Use Case:** Multi-line text entry (comments, descriptions)

#### 5.1.3 Number Input
```json
{
  "format": "numeric",
  "label": "Count",
  "fieldName": "count",
  "validations": [
    {"type": "min", "value": "1", "message": "Minimum 1"},
    {"type": "max", "value": "10", "message": "Maximum 10"}
  ]
}
```

**Use Case:** Numeric values with min/max validation

#### 5.1.4 Mobile Number
```json
{
  "format": "mobileNumber",
  "label": "Phone",
  "fieldName": "phone",
  "prefixText": "+91"
}
```

**Use Case:** Phone number with country code prefix

#### 5.1.5 Date Picker
```json
{
  "format": "date",
  "label": "Date of Registration",
  "fieldName": "dateOfRegistration",
  "systemDate": true,
  "readOnly": true
}
```

**Use Case:** Date selection (registration date, delivery date)
**Properties:**
- `systemDate: true` - Auto-fills with current date
- `readOnly: true` - Prevents user modification

#### 5.1.6 Date of Birth (DOB) Picker
```json
{
  "format": "dob",
  "label": "Date of Birth",
  "fieldName": "dobPicker"
}
```

**Use Case:** Special date picker for age calculation

#### 5.1.7 Scanner/QR Code
```json
{
  "format": "scanner",
  "label": "Scan Resource",
  "fieldName": "scanResource",
  "validations": [
    {"type": "isGS1", "value": true, "message": "Invalid GS1 code"}
  ]
}
```

**Use Case:** Barcode/QR code scanning with GS1 validation

### 5.2 Selection Components

#### 5.2.1 Dropdown
```json
{
  "format": "dropdown",
  "label": "Gender",
  "fieldName": "gender",
  "enums": [
    {"code": "MALE", "name": "MALE"},
    {"code": "FEMALE", "name": "FEMALE"}
  ]
}
```

**Use Case:** Single selection from predefined list

#### 5.2.2 Radio Buttons
```json
{
  "format": "radio",
  "label": "Is the child sick?",
  "fieldName": "ec1",
  "enums": [
    {"code": "YES", "name": "YES"},
    {"code": "NO", "name": "NO"}
  ]
}
```

**Use Case:** Yes/No questions, mutually exclusive options

#### 5.2.3 Checkbox
```json
{
  "format": "checkbox",
  "label": "Is Head of Family",
  "fieldName": "isHeadOfFamily"
}
```

**Use Case:** Boolean true/false selection

#### 5.2.4 Selection Card
```json
{
  "format": "selectionCard",
  "fieldName": "selectedStatus",
  "data": [
    {"code": "ADMINISTRATION_SUCCESS", "name": "Administration Success"},
    {"code": "ADMINISTRATION_FAILED", "name": "Administration Failed"}
  ]
}
```

**Use Case:** Visual card-based selection

#### 5.2.5 Radio List
```json
{
  "format": "radioList",
  "fieldName": "assignTo",
  "data": [
    {"code": "ASSIGN_TO_ME", "name": "Assign to me"},
    {"code": "ASSIGN_TO_ALL", "name": "Assign to all"}
  ]
}
```

**Use Case:** Radio buttons in list format

#### 5.2.6 Locality Picker
```json
{
  "format": "locality",
  "label": "Administrative Area",
  "fieldName": "administrativeArea"
}
```

**Use Case:** Geographic/administrative area selection

#### 5.2.7 LatLong Picker
```json
{
  "format": "latLng",
  "label": "Location",
  "fieldName": "latLng"
}
```

**Use Case:** GPS coordinate selection

### 5.3 Display Components

#### 5.3.1 Text
```json
{
  "format": "text",
  "value": "{{ headIndividual.0.name.givenName }}"
}
```

**Use Case:** Display static or dynamic text

#### 5.3.2 Label Pair List
```json
{
  "format": "labelPairList",
  "data": [
    {"key": "Name", "value": "{{individual.name.givenName}}"},
    {"key": "Age", "value": "{{fn:formatDate(individual.dateOfBirth, age)}}"}
  ]
}
```

**Use Case:** Display key-value pairs (details screens)

#### 5.3.3 Tag
```json
{
  "format": "tag",
  "type": "success",
  "label": "Active"
}
```

**Use Case:** Status badges, labels

#### 5.3.4 Info Card
```json
{
  "format": "infoCard",
  "hidden": "{{ context.household.notEmpty }}",
  "label": "No households found",
  "description": "Use the search above to find households"
}
```

**Use Case:** Empty state messages, informational messages

#### 5.3.5 Panel Card
```json
{
  "format": "panelCard",
  "label": "Delivery Successful",
  "description": "The resource is successfully delivered",
  "properties": {"type": "success"},
  "primaryAction": {
    "label": "View Details",
    "onAction": [{"actionType": "NAVIGATION", "properties": {}}]
  },
  "secondaryAction": {
    "label": "Go Home",
    "onAction": [{"actionType": "NAVIGATION", "properties": {}}]
  }
}
```

**Use Case:** Success/error messages with actions
**Types:** `success`, `error`, `warning`, `info`

#### 5.3.6 Menu Card
```json
{
  "format": "menu_card",
  "heading": "Record Stock Receipt",
  "description": "Create records for stock received",
  "icon": "file_upload_outlined",
  "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}}",
  "onAction": [
    {
      "actionType": "NAVIGATION",
      "properties": {"type": "FORM", "name": "MANAGESTOCK"}
    }
  ]
}
```

**Use Case:** Dashboard menu options with icons
**Properties:**
- `visible`: Conditional rendering based on role/logic
- `icon`: Material icon name

### 5.4 Container Components

#### 5.4.1 Card
```json
{
  "format": "card",
  "type": "primary",
  "children": [
    {"format": "text", "value": "Card content"}
  ]
}
```

**Types:** `primary`, `secondary`
**Use Case:** Group related content

#### 5.4.2 Row
```json
{
  "format": "row",
  "properties": {
    "mainAxisAlignment": "spaceBetween",
    "mainAxisSize": "max"
  },
  "children": [
    {"format": "text", "value": "Left"},
    {"format": "text", "value": "Right"}
  ]
}
```

**Properties:**
- `mainAxisAlignment`: `start`, `center`, `end`, `spaceBetween`, `spaceAround`
- `mainAxisSize`: `min`, `max`

**Use Case:** Horizontal layout

#### 5.4.3 Column
```json
{
  "format": "column",
  "properties": {
    "mainAxisAlignment": "start",
    "mainAxisSize": "min"
  },
  "children": [
    {"format": "text", "value": "Top"},
    {"format": "text", "value": "Bottom"}
  ]
}
```

**Use Case:** Vertical layout

#### 5.4.4 List View
```json
{
  "format": "listView",
  "fieldName": "listView",
  "dataSource": "members",
  "properties": {"spacing": "spacer4"},
  "child": {
    "format": "card",
    "children": []
  }
}
```

**Use Case:** Render lists of items
**Properties:**
- `dataSource`: Data source from wrapper
- `child`: Template for each list item
- `spacing`: Space between items

#### 5.4.5 Table
```json
{
  "format": "table",
  "data": {
    "source": "individuals",
    "columns": [
      {"header": "Name", "cellValue": "{{item.name.givenName}}"},
      {"header": "Age", "cellValue": "{{fn:formatDate(item.dateOfBirth, age)}}"}
    ],
    "rows": "{{contextData.0.individuals}}"
  }
}
```

**Use Case:** Tabular data display

### 5.5 Interactive Components

#### 5.5.1 Button
```json
{
  "format": "button",
  "label": "Submit",
  "icon": "add",
  "properties": {
    "type": "primary",
    "size": "large",
    "mainAxisSize": "max",
    "mainAxisAlignment": "center"
  },
  "onAction": [
    {"actionType": "NAVIGATION", "properties": {}}
  ]
}
```

**Types:** `primary`, `secondary`, `tertiary`
**Sizes:** `small`, `medium`, `large`

#### 5.5.2 Back Link
```json
{
  "format": "backLink",
  "label": "Back",
  "onAction": [
    {"actionType": "BACK_NAVIGATION", "properties": {}}
  ]
}
```

**Use Case:** Navigation back button in header

#### 5.5.3 Search Bar
```json
{
  "format": "searchBar",
  "label": "Enter the name",
  "fieldName": "searchBar",
  "onAction": [
    {
      "actionType": "SEARCH_EVENT",
      "properties": {
        "name": "name",
        "data": [
          {"key": "givenName", "value": "field.value", "operation": "contains"}
        ]
      }
    }
  ]
}
```

**Use Case:** Search input with event triggers

#### 5.5.4 Switch
```json
{
  "format": "switch",
  "label": "Proximity Search",
  "fieldName": "proximitySearch",
  "onAction": [
    {
      "actionType": "EVENT",
      "properties": {
        "type": "field.value==true ? SEARCH_EVENT : CLEAR_EVENT"
      }
    }
  ]
}
```

**Use Case:** Toggle switches with conditional actions

#### 5.5.5 Action Popup
```json
{
  "format": "actionPopup",
  "label": "Filter search",
  "suffixIcon": "filter",
  "properties": {
    "type": "tertiary",
    "size": "medium",
    "popupConfig": {
      "type": "default",
      "title": "Filter Options",
      "titleIcon": "filter",
      "showCloseButton": true,
      "barrierDismissible": true,
      "body": [
        {
          "format": "selectionCard",
          "fieldName": "selectedStatus",
          "data": []
        }
      ],
      "footerActions": [
        {
          "format": "button",
          "label": "Clear",
          "onAction": [
            {"actionType": "CLEAR_STATE", "properties": {}},
            {"actionType": "CLOSE_POPUP", "properties": {}}
          ]
        },
        {
          "format": "button",
          "label": "Apply",
          "onAction": [
            {"actionType": "CLOSE_POPUP", "properties": {}},
            {"actionType": "SEARCH_EVENT", "properties": {}}
          ]
        }
      ]
    }
  }
}
```

**Use Case:** Filter popups, modal dialogs
**Popup Types:** `default`, `fullscreen`

### 5.6 Special Components

#### 5.6.1 ID Populator
```json
{
  "format": "idPopulator",
  "label": "Identifiers",
  "fieldName": "identifiers",
  "enums": [
    {"code": "DEFAULT", "name": "DEFAULT"},
    {"code": "UNIQUE_BENEFICIARY_ID", "name": "UNIQUE_BENEFICIARY_ID"}
  ],
  "schemaCode": "HCM.ID_TYPE_OPTIONS_POPULATOR"
}
```

**Use Case:** Dynamic ID type and value entry

#### 5.6.2 Custom Component (Dynamic)
```json
{
  "type": "dynamic",
  "format": "custom",
  "label": "Resource Card",
  "fieldName": "resourceCard",
  "enums": []
}
```

**Use Case:** Custom widgets (product selection, resource cards)

---

## 6. Action Types

### 6.1 Navigation Actions

#### 6.1.1 Forward Navigation
```json
{
  "actionType": "NAVIGATION",
  "properties": {
    "type": "TEMPLATE",
    "name": "targetScreen",
    "data": [
      {"key": "id", "value": "{{item.id}}"}
    ]
  }
}
```

**Use Case:** Navigate to another screen with data

#### 6.1.2 Back Navigation
```json
{
  "actionType": "BACK_NAVIGATION",
  "properties": {
    "type": "TEMPLATE",
    "name": "previousScreen"
  }
}
```

**Use Case:** Navigate back

### 6.2 Data Actions

#### 6.2.1 Search Event
```json
{
  "actionType": "SEARCH_EVENT",
  "properties": {
    "type": "SEARCH_EVENT",
    "name": "household",
    "data": [
      {"key": "clientReferenceId", "value": "{{value}}", "operation": "equals"}
    ]
  }
}
```

**Operations:** `equals`, `contains`, `in`, `within`

**Use Case:** Trigger search/filter

#### 6.2.2 Create Event
```json
{
  "actionType": "CREATE_EVENT",
  "properties": {
    "entity": "HOUSEHOLD, INDIVIDUAL, PROJECTBENEFICIARY",
    "onError": [
      {
        "actionType": "SHOW_TOAST",
        "properties": {"message": "Failed to create"}
      }
    ]
  }
}
```

**Use Case:** Create database records

#### 6.2.3 Clear Event
```json
{
  "actionType": "CLEAR_EVENT",
  "properties": {}
}
```

**Use Case:** Clear search/filter results

#### 6.2.4 Clear State
```json
{
  "actionType": "CLEAR_STATE",
  "properties": {}
}
```

**Use Case:** Reset form/popup state

### 6.3 UI Actions

#### 6.3.1 Show Toast
```json
{
  "actionType": "SHOW_TOAST",
  "properties": {"message": "Success message"}
}
```

**Use Case:** Display notification messages

#### 6.3.2 Close Popup
```json
{
  "actionType": "CLOSE_POPUP",
  "properties": {}
}
```

**Use Case:** Close modal/popup

### 6.4 Config Actions

#### 6.4.1 Fetch Transformer Config
```json
{
  "actionType": "FETCH_TRANSFORMER_CONFIG",
  "properties": {
    "configName": "beneficiaryRegistration",
    "data": [
      {"key": "householdId", "value": "{{value}}"}
    ],
    "onError": [
      {
        "actionType": "SHOW_TOAST",
        "properties": {"message": "Failed to fetch config"}
      }
    ]
  }
}
```

**Use Case:** Fetch external configuration/data transformers

### 6.5 Init Actions

**Purpose:** Actions that execute when screen loads

```json
{
  "initActions": [
    {
      "actionType": "SEARCH_EVENT",
      "properties": {
        "name": "household",
        "data": [
          {"key": "id", "value": "{{navigation.householdId}}", "operation": "equals"}
        ]
      }
    }
  ]
}
```

**Use Case:** Pre-load data when screen opens

### 6.6 Conditional Actions

```json
{
  "onAction": [
    {
      "condition": {
        "expression": "eligibilityChecklist.ec1==NO"
      },
      "actions": [
        {"actionType": "NAVIGATION", "properties": {}}
      ]
    },
    {
      "condition": {"expression": "DEFAULT"},
      "actions": [
        {"actionType": "SHOW_TOAST", "properties": {}}
      ]
    }
  ]
}
```

**Use Case:** Different actions based on conditions

---

## 7. Form Configuration

### 7.1 Form Page Structure

```json
{
  "page": "pageName",
  "type": "object",
  "label": "Page Title",
  "order": 1,
  "description": "Page description",
  "actionLabel": "Next",
  "navigateTo": {"name": "nextPage", "type": "form"},
  "properties": []
}
```

### 7.2 Form Field Types

All input formats from Section 5.1 and 5.2 can be used as form properties.

**Common Field Structure:**
```json
{
  "type": "string",
  "label": "Field Label",
  "order": 1,
  "value": "",
  "format": "text",
  "hidden": false,
  "tooltip": "Tooltip text",
  "helpText": "Help text",
  "infoText": "Info text",
  "readOnly": false,
  "fieldName": "fieldName",
  "deleteFlag": false,
  "innerLabel": "",
  "systemDate": false,
  "validations": [],
  "errorMessage": "",
  "isMultiSelect": false
}
```

### 7.3 Visibility Conditions

```json
{
  "visibilityCondition": {
    "expression": "complaintType.complaintType==Other"
  }
}
```

**Use Case:** Show/hide fields based on other field values

### 7.4 Auto-Fill Conditions

```json
{
  "autoFillCondition": [
    {
      "value": "{{loggedInUserName}}",
      "expression": "complaintDetails.complaintRaisedFor==MYSELF"
    }
  ]
}
```

**Use Case:** Auto-populate fields based on conditions

### 7.5 Multi-Entity Configuration

**Purpose:** Create multiple records from a single form (e.g., multiple products)

```json
{
  "page": "stockProductDetails",
  "multiEntityConfig": {
    "sourcePageKey": "stockDetails",
    "sourceFieldKey": "productdetail"
  },
  "properties": []
}
```

**Use Case:** Repeat a page for each selected item

### 7.6 Show Alert Popup

**Purpose:** Confirmation dialog before form submission

```json
{
  "showAlertPopUp": {
    "title": "Ready to submit?",
    "description": "Based on responses you are going to '{value}'",
    "primaryActionLabel": "Submit",
    "secondaryActionLabel": "Cancel",
    "conditions": [
      {
        "expression": "eligibilityChecklist.ec1==NO",
        "value": "To Administer"
      },
      {
        "expression": "DEFAULT",
        "value": "referral flow"
      }
    ]
  }
}
```

**Use Case:** Conditional confirmation messages

---

## 8. Template Configuration

### 8.1 Header Configuration

```json
{
  "header": [
    {
      "format": "backLink",
      "label": "Back",
      "onAction": [{"actionType": "BACK_NAVIGATION", "properties": {}}]
    }
  ]
}
```

### 8.2 Footer Configuration

```json
{
  "footer": [
    {
      "format": "button",
      "label": "Submit",
      "properties": {"type": "primary", "size": "large"},
      "onAction": []
    }
  ]
}
```

### 8.3 Body Configuration

The body contains all visible components (from Section 5).

---

## 9. Data Binding and Context

### 9.1 Context Data Binding

**Format:** `{{contextData.path.to.value}}`

**Examples:**
```
{{contextData.0.individuals.IndividualModel.name.givenName}}
{{contextData.household.HouseholdModel.memberCount}}
```

### 9.2 Navigation Data Binding

**Format:** `{{navigation.parameterName}}`

**Example:**
```
{{navigation.HouseholdClientReferenceId}}
```

### 9.3 Form Data Binding

**Format:** `{{formData.pageName.fieldName}}`

**Example:**
```
{{formData.household.clientReferenceId}}
```

### 9.4 Widget Data Binding

**Format:** `{{widgetData.fieldName}}`

**Example:**
```
{{widgetData.selectedStatus}}
```

### 9.5 Singleton Data Binding

**Format:** `{{singleton.property}}`

**Examples:**
```
{{singleton.selectedProject.id}}
{{singleton.loggedInUserUuid}}
```

### 9.6 Item Data Binding (in lists)

**Format:** `{{item.property}}`

**Example:**
```
{{item.name.givenName}}
{{item.groupKey}}
```

### 9.7 Function Calls

**Format:** `{{fn:functionName(params)}}`

**Examples:**
```
{{fn:formatDate(item.dateOfBirth, age)}}
{{fn:formatDate(item.createdTime, dateTime, dd MMM yyyy)}}
{{fn:checkEligibilityForAgeAndSideEffect(individual.dateOfBirth)}}
{{fn:hasRole('WAREHOUSE_MANAGER')}}
{{fn:generateUniqueMaterialNoteNumber()}}
{{fn:getQuantityLabel(item.sku)}}
```

### 9.8 Conditional Expressions

**Format:** `condition ? trueValue : falseValue`

**Example:**
```
field.value==true ? SEARCH_EVENT : CLEAR_EVENT
```

### 9.9 Visibility Expressions

```json
{
  "hidden": "{{ context.household.empty }}",
  "visibilityCondition": "{{ context.household.notEmpty }}"
}
```

**Operations:**
- `empty` / `isEmpty`
- `notEmpty` / `isNotEmpty`

---

## 10. Validation Patterns

### 10.1 Required Field
```json
{
  "type": "required",
  "value": true,
  "message": "This field is required"
}
```

### 10.2 String Length
```json
{
  "type": "minLength",
  "value": "2",
  "message": "Minimum 2 characters"
},
{
  "type": "maxLength",
  "value": "200",
  "message": "Maximum 200 characters"
}
```

### 10.3 Numeric Range
```json
{
  "type": "min",
  "value": "1",
  "message": "Minimum value is 1"
},
{
  "type": "max",
  "value": "10",
  "message": "Maximum value is 10"
}
```

### 10.4 Regular Expression
```json
{
  "type": "regex",
  "value": "^[0-9]+$",
  "message": "Please enter a valid number"
}
```

### 10.5 Not Equal To
```json
{
  "type": "notEqualTo",
  "value": "warehouseDetails.facilityToWhich",
  "message": "Facility from and to must be different"
}
```

### 10.6 Custom Validations
```json
{
  "type": "isGS1",
  "value": true,
  "message": "Invalid GS1 code"
}
```

---

## 11. Navigation Patterns

### 11.1 Form to Form
```json
{
  "navigateTo": {"name": "nextPage", "type": "form"}
}
```

### 11.2 Form to Template
```json
{
  "navigateTo": {
    "name": "acknowledgement",
    "type": "template",
    "data": [
      {"key": "id", "value": "{{formData.household.clientReferenceId}}"}
    ]
  }
}
```

### 11.3 Template to Form
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

### 11.4 Template to Template
```json
{
  "actionType": "NAVIGATION",
  "properties": {
    "type": "TEMPLATE",
    "name": "householdOverview",
    "data": []
  }
}
```

### 11.5 Passing Data Between Screens

**From Source:**
```json
{
  "data": [
    {"key": "householdId", "value": "{{household.clientReferenceId}}"}
  ]
}
```

**In Target (initActions):**
```json
{
  "initActions": [
    {
      "actionType": "SEARCH_EVENT",
      "properties": {
        "data": [
          {"key": "clientReferenceId", "value": "{{navigation.householdId}}"}
        ]
      }
    }
  ]
}
```

---

## 12. Common Use Cases

### 12.1 Search and List Screen

**Components:**
- Search bar
- Filter popup
- List view with cards
- Navigation to details

**Example:** `complaintInbox`, `searchBeneficiary`

### 12.2 Multi-Step Registration Form

**Components:**
- Multiple form pages
- Page-to-page navigation
- Final submission action
- Acknowledgment screen

**Example:** `HOUSEHOLD` form (3 pages)

### 12.3 Detail View Screen

**Components:**
- Label pair list (read-only data)
- Edit button
- Related items list
- Action buttons

**Example:** `householdOverview`, `complaintView`

### 12.4 Dashboard/Menu Screen

**Components:**
- Multiple menu cards
- Role-based visibility
- Icon-based navigation

**Example:** `manageStock`

### 12.5 Conditional Workflow (Checklist)

**Components:**
- Form with radio buttons
- Conditional alert popup
- Different navigation paths based on answers

**Example:** `CHECKLIST` form with eligibility check

### 12.6 Inventory/Transaction Management

**Components:**
- Multi-entity forms
- Product selection
- Quantity entry
- Receipt/acknowledgment

**Example:** `MANAGESTOCK` form

### 12.7 Success/Acknowledgment Screen

**Components:**
- Panel card (success type)
- Primary action (view details)
- Secondary action (return home)

**Example:** `deliverySuccess`, `complaintAcknowledgement`

### 12.8 List with Grouped Items

**Components:**
- Grouped list view
- Expandable details
- Action buttons per group

**Example:** `viewTransaction` (stock grouped by MRN)

---

## 13. Best Practices

### 13.1 Naming Conventions

- **Screen Names:** Use camelCase (e.g., `searchBeneficiary`, `householdOverview`)
- **Field Names:** Use camelCase (e.g., `dateOfRegistration`, `administrativeArea`)
- **Form Names:** Use UPPER_CASE (e.g., `HOUSEHOLD`, `COMPLAINT_CREATE`)
- **Entity Models:** Use PascalCase with "Model" suffix (e.g., `HouseholdModel`, `IndividualModel`)

### 13.2 Error Handling

Always provide `onError` handlers for critical actions:

```json
{
  "actionType": "CREATE_EVENT",
  "properties": {
    "entity": "HOUSEHOLD",
    "onError": [
      {
        "actionType": "SHOW_TOAST",
        "properties": {"message": "Failed to create household"}
      }
    ]
  }
}
```

### 13.3 Localization

Use localization keys instead of hardcoded strings:

```json
{
  "label": "APPONE_REGISTRATION_BENEFICIARYDETAILS_SCREEN_HEADING"
}
```

### 13.4 Conditional Rendering

Use visibility conditions to show/hide components:

```json
{
  "hidden": "{{ context.household.empty }}",
  "visible": "{{fn:hasRole('WAREHOUSE_MANAGER')}}"
}
```

### 13.5 Data Pre-loading

Use `initActions` to load data before screen renders:

```json
{
  "initActions": [
    {
      "actionType": "SEARCH_EVENT",
      "properties": {
        "name": "household",
        "data": [
          {"key": "id", "value": "{{navigation.householdId}}"}
        ]
      }
    }
  ]
}
```

### 13.6 Default Values

Provide default values for computed fields:

```json
{
  "fields": {
    "cycle": {
      "from": "{{tasks.additionalFields.fields}}",
      "default": 1
    }
  }
}
```

---

## 14. Component Property Reference

### Button Properties
```json
{
  "type": "primary" | "secondary" | "tertiary",
  "size": "small" | "medium" | "large",
  "mainAxisSize": "min" | "max",
  "mainAxisAlignment": "start" | "center" | "end"
}
```

### Layout Properties
```json
{
  "mainAxisAlignment": "start" | "center" | "end" | "spaceBetween" | "spaceAround",
  "mainAxisSize": "min" | "max",
  "spacing": "spacer4" | "spacer8" | "spacer16"
}
```

### Card Properties
```json
{
  "type": "primary" | "secondary"
}
```

### Panel Card Properties
```json
{
  "type": "success" | "error" | "warning" | "info"
}
```

---

## 15. Complete Flow Examples

### 15.1 Simple CRUD Flow

**Screens:**
1. List screen (TEMPLATE)
2. Create form (FORM)
3. Detail view (TEMPLATE)
4. Success screen (TEMPLATE)

**Navigation:**
List → Create → Success → Detail → List

### 15.2 Search and Register Flow

**Screens:**
1. Search screen (TEMPLATE)
2. Multi-page registration form (FORM)
3. Overview screen (TEMPLATE)

**Flow:**
Search → Register (3 pages) → Overview

### 15.3 Approval Workflow

**Screens:**
1. Inbox list (TEMPLATE)
2. Detail view (TEMPLATE)
3. Checklist form (FORM)
4. Conditional navigation based on checklist

---

## 16. Troubleshooting Common Issues

### Issue: Data not displaying
**Solution:** Check wrapper configuration and data binding paths

### Issue: Validation not working
**Solution:** Ensure validation objects are properly structured with `type`, `value`, `message`

### Issue: Navigation not working
**Solution:** Verify screen names match exactly (case-sensitive)

### Issue: Conditional rendering not working
**Solution:** Check expression syntax and context data availability

---

## Appendix: Field Type Reference

| Type | Format Options | Use Case |
|------|---------------|----------|
| string | text, textArea, radio, dropdown, select, locality, latLng, dob, mobileNumber, scanner, idPopulator | Text-based inputs |
| integer | numeric, date | Numeric and date inputs |
| boolean | checkbox | True/false values |
| dynamic | custom | Custom components |

---

## Appendix: Action Type Reference

| Action Type | Purpose | Required Properties |
|------------|---------|-------------------|
| NAVIGATION | Navigate to screen | type, name |
| BACK_NAVIGATION | Go back | - |
| SEARCH_EVENT | Trigger search | name, data |
| CREATE_EVENT | Create entities | entity |
| CLEAR_EVENT | Clear search | - |
| CLEAR_STATE | Reset state | - |
| SHOW_TOAST | Show message | message |
| CLOSE_POPUP | Close popup | - |
| FETCH_TRANSFORMER_CONFIG | Fetch config | configName |
| EVENT | Generic event | type |

---

## Conclusion

This comprehensive guide covers all patterns and use cases found in the DIGIT Flow Builder package configurations. Use this as a reference when creating new flow configurations. For specific implementation details, refer to the three sample configs:

1. **sampleFlows** - Registration and Delivery workflow
2. **sampleComplaintFlows** - Complaint management system
3. **sampleInventoryFlows** - Stock/inventory management

Each configuration demonstrates different aspects of the framework, from simple forms to complex conditional workflows with computed fields and nested relationships.
