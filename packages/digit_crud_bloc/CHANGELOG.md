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

