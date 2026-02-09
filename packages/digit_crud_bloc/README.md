# DIGIT CRUD BLoC

A core package that handles all Create, Read, Update, and Delete (CRUD) operations for entities in the HCM application. It acts as the data engine behind feature modules like Registration & Delivery, Closed Household, Inventory, etc. — managing how data is searched, saved, updated, and deleted across related tables.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  digit_crud_bloc: ^0.0.3-dev
```

Then run:

```bash
flutter pub get
```

## Features

- Create, search, update, and delete any entity (Household, Individual, Task, Stock, etc.)
- Search across multiple related tables in a single query
- Filter results using various operators (exact match, contains, within radius, etc.)
- Proximity-based search — find entities within a given distance using GPS coordinates
- Automatically load nested/related data (e.g., fetch household along with its members)
- Pagination and ordering support for large result sets
- Works with any entity model from `digit_data_model`

## Getting Started

### Step 1: Extend CrudService

Create your own service by extending `CrudService` and implementing `getRepositoryForEntity` for your entity types:

```dart
import 'package:digit_crud_bloc/digit_crud_bloc.dart';

class MyCrudService extends CrudService {
  final BuildContext context;

  MyCrudService({
    required this.context,
    required super.relationshipMap,
    required super.nestedModelMappings,
    required super.searchEntityRepository,
  });

  @override
  DataRepository? getRepositoryForEntity(EntityModel entity) {
    if (entity is HouseholdModel) {
      return context.repository<HouseholdModel, HouseholdSearchModel>(context);
    } else if (entity is IndividualModel) {
      return context.repository<IndividualModel, IndividualSearchModel>(context);
    } else if (entity is HouseholdMemberModel) {
      return context.repository<HouseholdMemberModel, HouseholdMemberSearchModel>(context);
    } else if (entity is ProjectBeneficiaryModel) {
      return context.repository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>(context);
    } else if (entity is TaskModel) {
      return context.repository<TaskModel, TaskSearchModel>(context);
    }
    return null;
  }
}
```

### Step 2: Implement DynamicEntityModelListener

Provide a mapper to convert raw database rows into typed entity models:

```dart
class MyEntityModelMapper extends DynamicEntityModelListener {
  @override
  EntityModel? dynamicEntityModelFromMap(
    String modelName,
    Map<String, dynamic> map,
  ) {
    switch (modelName) {
      case 'household':
        return HouseholdModelMapper.fromMap(map);
      case 'individual':
        return IndividualModelMapper.fromMap(map);
      case 'householdMember':
        return HouseholdMemberModelMapper.fromMap(map);
      case 'projectBeneficiary':
        return ProjectBeneficiaryModelMapper.fromMap(map);
      case 'task':
        return TaskModelMapper.fromMap(map);
      default:
        return null;
    }
  }
}
```

### Step 3: Initialize the Singleton

Before using any CRUD features, initialize the singleton with all required dependencies:

```dart
CrudBlocSingleton.instance.setData(
  crudService: myCrudService,
  dynamicEntityModelListener: MyEntityModelMapper(),
);
```

### Step 4: Use CrudBloc

```dart
// Create the bloc
final crudBloc = CrudBloc(service: myCrudService);

// Initialize
crudBloc.add(const CrudEvent.initialize());
```

## Usage Examples

### Search Entities

```dart
final searchParams = GlobalSearchParameters(
  filters: [
    SearchFilter(
      root: 'household',
      field: 'clientReferenceId',
      operator: 'equals',
      value: 'HOUSEHOLD-1234',
    ),
  ],
  primaryModel: 'household',
  primaryKeyField: 'clientReferenceId',
  select: ['household', 'individual', 'householdMember', 'projectBeneficiary', 'task'],
  pagination: PaginationParams(limit: 10, offset: 0),
  filterLogic: MultiTableFilterLogic.and,
);

crudBloc.add(CrudEvent.search(searchParams));
```

### Create Entities

```dart
crudBloc.add(CrudEvent.create(entities: [householdModel, individualModel]));
```

### Update Entities

```dart
crudBloc.add(CrudEvent.update(entities: [updatedHouseholdModel]));
```

### Delete Entities

```dart
crudBloc.add(CrudEvent.delete(entities: [entityToDelete]));
```

### Listen to State Changes

```dart
BlocListener<CrudBloc, CrudState>(
  listener: (context, state) {
    state.when(
      initial: () => print('Initial'),
      loading: () => print('Loading...'),
      loaded: (results, totalCount) {
        // results is Map<String, List<EntityModel>>
        final households = results['household'] ?? [];
        final individuals = results['individual'] ?? [];
        print('Found ${households.length} households, ${individuals.length} individuals');
      },
      persisted: (entities) => print('Saved ${entities.length} entities'),
      error: (message) => print('Error: $message'),
    );
  },
)
```

## Core Classes

### CrudBloc

The BLoC that manages CRUD state.

**Events:**

| Event | Description |
|-------|-------------|
| `CrudEvent.initialize()` | Initialize the service |
| `CrudEvent.search(GlobalSearchParameters)` | Search entities with filters |
| `CrudEvent.create(entities)` | Create new entities |
| `CrudEvent.update(entities)` | Update existing entities |
| `CrudEvent.delete(entities)` | Delete entities |

**States:**

| State | Description |
|-------|-------------|
| `CrudStateInitial` | Initial state before any operation |
| `CrudStateLoading` | Operation in progress |
| `CrudStateLoaded(results, totalCount)` | Search results loaded |
| `CrudStatePersisted(entities)` | Create/update/delete succeeded |
| `CrudStateError(message)` | Operation failed |

### GlobalSearchParameters

The main search query configuration.

| Parameter | Type | Description |
|-----------|------|-------------|
| `filters` | `List<SearchFilter>` | Filter conditions |
| `select` | `List<String>` | Entity types to return |
| `primaryModel` | `String?` | Primary table for pagination/count |
| `primaryKeyField` | `String?` | Primary key field name |
| `pagination` | `PaginationParams?` | Limit and offset |
| `filterLogic` | `MultiTableFilterLogic` | AND or OR across tables (default: AND) |
| `orderBy` | `SearchOrderBy?` | Ordering configuration |

### SearchFilter

| Parameter | Type | Description |
|-----------|------|-------------|
| `field` | `String` | Field name to filter |
| `operator` | `String` | Filter operator (see table below) |
| `value` | `dynamic` | Filter value |
| `root` | `String` | Table name the field belongs to |
| `coordinates` | `LatLng?` | Required for `within` operator |

### RelationshipMapping

Defines how two entity tables are related.

| Parameter | Type | Description |
|-----------|------|-------------|
| `from` | `String` | Source table name |
| `to` | `String` | Target table name |
| `localKey` | `String` | Key field in source table |
| `foreignKey` | `String` | Key field in target table |

### NestedModelMapping

Defines nested fields that should be loaded from related tables.

| Parameter | Type | Description |
|-----------|------|-------------|
| `rootModel` | `String` | Parent model name |
| `fields` | `Map<String, NestedFieldMapping>` | Nested field configurations |

## Supported Filter Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `equals` | Exact match | `field == value` |
| `notEqual` | Not equal | `field != value` |
| `contains` | Partial text match | `field LIKE %value%` |
| `in` | Value in list | `field IN (a, b, c)` |
| `notIn` | Value not in list | `field NOT IN (a, b, c)` |
| `isNull` | Field is null | `field IS NULL` |
| `isNotNull` | Field is not null | `field IS NOT NULL` |
| `equalsAny` | OR across multiple columns | `col1 == val OR col2 == val` |
| `within` | Geospatial radius search (Haversine) | Entities within X km |

## Helper Classes

| Class | Purpose |
|-------|---------|
| `QueryBuilder` | SQL query construction and field mapping utilities |
| `HydrationHelper` | Loads and attaches nested model data to raw rows |
| `RelationshipGraphHelper` | BFS-based pathfinding between entity relationships |
| `MultiTableFilterResolver` | Resolves filters across multiple tables to primary key constraints |

## Supported Entities

Works with all entities from `digit_data_model`:

- Household, Individual, Household Member
- Project Beneficiary, Task
- Stock, Stock Reconciliation
- Facility, Project Facility
- Referral, HF Referral
- Product Variant, Project Resource
