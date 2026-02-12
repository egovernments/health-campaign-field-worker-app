# WrapperConfig Reference Guide

WrapperConfig is a data loading and transformation layer that bridges backend entities and the UI. It loads entities from storage, builds hierarchical data structures, and makes them available to widgets via template interpolation.

## Core Structure

```json
{
  "wrapperName": "string - unique identifier",
  "rootEntity": "string - primary entity type (e.g. HouseholdModel)",
  "groupByType": "boolean - group all entities by type",
  "groupBy": "string - field path to group by",
  "searchConfig": { "primary": "string", "select": ["entity types"], "pagination": {"limit": N, "maxItems": N} },
  "filters": [{ filter configs }],
  "relations": [{ relation configs }],
  "fields": { field extraction configs },
  "computed": { computed scalar configs },
  "computedList": { computed list configs }
}
```

## Execution Order

1. Group entities by type
2. Filter root entities (keep only those matching filter conditions)
3. For each root entity build wrapper object:
   a. Load relations (find related entities, attach to wrapper)
   b. Apply fields (extract specific values from relations)
   c. Apply computed (execute in order, compute scalar/object values)
   d. Apply computedList (compute array values using filtering)
4. Return list of wrapper objects

## Relations

Relations load related entities and attach them to the wrapper.

```json
{
  "name": "members",
  "entity": "HouseholdMemberModel",
  "match": {
    "field": "householdClientReferenceId",
    "equalsFrom": "HouseholdModel.clientReferenceId"
  }
}
```

Match types:
- `equalsFrom`: Related entity field must equal a value from root/wrapper
- `inFrom`: Related entity field must be in a list of values from root/wrapper

Relations can be nested — each relation can have its own `relations` array for deep entity graphs.

## Filters

Filters determine which root entities to include.

Simple field filter:
```json
{"field": "status", "equals": "ACTIVE"}
```

Template-based filter:
```json
{"field": "clientReferenceId", "equalsFrom": "{{navigation.selectedIndividualClientReferenceId}}"}
```

Related entity filter:
```json
{
  "entity": "TaskModel",
  "condition": {"field": "status", "equals": "DELIVERED"},
  "join": {"sourceField": "projectBeneficiaryClientReferenceId", "targetField": "projectBeneficiaryClientReferenceId"}
}
```

## Fields (Value Extraction)

Extract specific values from entity data:
```json
{
  "dose": {
    "from": "{{tasks.additionalFields.fields}}",
    "where": {"left": "{{key}}", "right": "doseIndex", "operator": "eq"},
    "select": "{{value}}",
    "takeLast": true,
    "default": 0
  }
}
```

Operators: eq, neq, lt, lte, gt, gte, contains, in

## Computed (Scalar Values)

Compute new values using wrapper data. Executed in `order` sequence.

Conditional:
```json
{
  "hasCycleArrived": {
    "order": 2,
    "fallback": false,
    "condition": {"left": "{{cycle}}", "right": "{{currentRunningCycle}}", "operator": "equals"}
  }
}
```

If-then-else:
```json
{
  "nextDoseId": {
    "order": 4,
    "fallback": 1,
    "condition": {
      "if": {"left": "{{cycle}}", "right": "{{currentRunningCycle}}", "operator": "equals"},
      "then": {"value": "{{dose}}", "operation": "increment"},
      "else": 1
    }
  }
}
```

Reduce (aggregation):
```json
{
  "maxStockInHand": {
    "from": "{{stockMetrics}}",
    "reduce": {"field": "quantity", "operation": "max", "fallback": 0}
  }
}
```

## ComputedList (Array Values)

Compute list values using filtering:
```json
{
  "pastCycles": {
    "from": "{{singleton.selectedProject.additionalDetails.projectType.cycles}}",
    "order": 6,
    "where": {"left": "{{item.id}}", "right": "{{currentRunningCycle}}", "operator": "lt"}
  }
}
```

With evaluateCondition (formula-based filtering):
```json
{
  "eligibleProductVariants": {
    "from": "{{currentDelivery.0.doseCriteria}}",
    "order": 5,
    "evaluateCondition": {
      "context": ["{{individuals.0}}", "{{household.0}}"],
      "condition": "{{item.condition}}",
      "transformations": {"age": {"type": "ageInMonths", "source": "dateOfBirth"}}
    }
  }
}
```

Transformation types: ageInMonths, ageInYears, dateString, uppercase, lowercase, numeric, boolean

## Template Interpolation in Wrapper

- `{{EntityName.field}}` — access root entity field
- `{{relationName.0.field}}` — access first item of relation
- `{{relationName.field}}` — access field on all items in relation
- `{{singleton.selectedProject.id}}` — global singleton access
- `{{now}}` — current timestamp (ms)
- `{{context.EntityName.field}}` — wrapper context access
- `{{item.field}}` — current item in list contexts
- `{{navigation.paramName}}` — navigation parameter access

## SearchConfig

```json
{
  "searchConfig": {
    "primary": "household",
    "select": ["household", "individual", "householdMember", "projectBeneficiary", "task"],
    "pagination": {"limit": 5, "maxItems": 15}
  }
}
```

- `primary`: Primary search target entity
- `select`: All entity types to include in search
- `pagination`: Used by REFRESH_SEARCH action for infinite scroll

## Key Notes

- wrapperConfig loads data FROM entities TO UI (entity → wrapper context → widgets)
- transformerConfig maps data FROM UI TO entities (form → entity for CREATE/UPDATE)
- Computed fields execute in `order` sequence — later fields can reference earlier ones
- Relations support arbitrary nesting depth
- Filters are AND logic (all conditions must match)
