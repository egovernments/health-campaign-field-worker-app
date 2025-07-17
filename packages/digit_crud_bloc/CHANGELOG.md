## 0.1.0

- Major refactor for maintainability and clarity. No logic changes.
- All BLoC, service, and singleton naming is now generic (CrudBloc, CrudService, etc.).
- Extracted query-building, hydration, and relationship graph logic into dedicated helpers:
    - `QueryBuilder` for SQL and filter utilities
    - `HydrationHelper` for nested model hydration
    - `RelationshipGraphHelper` for relationship pathfinding
- Singleton setup now requires all dependencies to be set explicitly.
- Improved documentation and code comments throughout.
- The main repository class is now focused and readable, with helpers handling complex logic.

## 0.0.1-dev

- `RegistrationService` class to centralize entity-level CRUD operations and search logic.
- Relationship graph support using `RelationshipMapping` to resolve parent-child entity relationships.
- Nested model mapping via `NestedModelMapping` for resolving and filtering deeply nested fields.
- Global search support through `GlobalSearchParameters` and `SearchEntityRepository`.
- Full CRUD functionality:
    - `registerEntities()` – Create
    - `searchHouseholds()` – Read
    - `updateEntities()` – Update
    - `deleteEntities()` – Delete

