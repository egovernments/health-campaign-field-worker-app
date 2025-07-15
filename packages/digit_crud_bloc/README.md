# 📦 Digit Crud Bloc

This package provides the core logic and services for managing entity-based data flows in a modular and extensible way. It supports dynamic entity mapping, relationship traversal, nested field resolution, and repository-driven CRUD operations.

---

## 🧠 Key Concepts

### 🔁 Relationship Graph
- Maintains bidirectional relationship mappings between entity models.
- Enables efficient traversal and lookup across related entities.

### 🌿 Nested Model Mappings
- Allows mapping nested fields from complex models (e.g., mapping `Individual.address.locality.code`).
- Enables powerful filtering and selection in search queries.

---

## 🔨 Core Features

### `RegistrationService`
A centralized service that orchestrates:
- Entity registration and update
- Relationship-based queries
- Repository resolution per entity type

#### Constructor Params
- `relationshipMap`: List of `RelationshipMapping` objects defining entity links.
- `nestedModelMappings`: List of `NestedModelMapping` for deep field resolution.
- Repositories for each supported entity: `Household`, `Individual`, `HouseholdMember`, `ProjectBeneficiary`, `Task`.

#### Public Methods
- `init()`: Initializes relationship graph and nested mapping lookup.
- `searchHouseholds(query)`: Performs a global search using filters, pagination, and nested field resolution.
- `registerEntities(entities)`: Creates a list of entities using their mapped repository.
- `updateEntities(entities)`: Updates a list of entities.
- `deleteEntities(entities)`: Deletes a list of entities.

---

## 🔁 CRUD Operations

The `RegistrationService` supports full **CRUD operations** for all supported entity types. Internally, it resolves the appropriate repository based on the runtime type of the entity.

### 1. **Create**
Registers new entities to local storage.

```dart
await registrationService.registerEntities(entities);
```

Internally calls repository.create(entity) for each entity. Suitable for bulk registration of household, members, tasks, etc.

### 2. **Read (Search)**
Performs global or scoped search on entities using relationships and nested fields.
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
  select: [
    'individual',
    'household',
    'householdMember',
    'projectBeneficiary',
    'task',
  ],
  pagination: Pagination(limit: 10, offset: 0),
);

// Perform the global search
final (results, totalCount) =
    await registrationService.searchHouseholds(query: searchParams);
```

Uses SearchEntityRepository.
Supports filters, pagination, relationship traversal, and nested field lookup.

### 3. **Update**
Updates existing entities in the local repository.

```dart
await registrationService.updateEntities(updatedEntities);

```

Calls repository.update(entity) for each provided entity.
Supports batch updates for any entity type.

### 4. **Delete**
Deletes entities from the local repository.

```dart
await registrationService.deleteEntities(entitiesToDelete);
```

Calls repository.delete(entity) for each entity.

## ⚠️ Limitations & Future Scope

Currently, this package depends on the `registration_delivery` package for access to models like:

- `HouseholdModel`
- `IndividualModel`
- `ProjectBeneficiaryModel`
- and other entity types

---

### 🛠️ Planned Improvements

- Make the package **framework-agnostic** and **reusable across domains** without tight coupling to specific implementations.
