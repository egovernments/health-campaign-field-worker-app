## 0.0.3-dev

- Fixed query for count fetching

## 0.0.2-dev

- Major refactor for better readability and maintainability
- Renamed all classes to generic names (CrudBloc, CrudService, etc.)
- Extracted helper utilities into dedicated classes:
  - `QueryBuilder` — SQL and filter utilities
  - `HydrationHelper` — nested model data loading
  - `RelationshipGraphHelper` — relationship pathfinding between entities
- Singleton setup now requires all dependencies to be set explicitly
- Improved documentation and code comments

## 0.0.1-dev

- Initial release
- CRUD operations for all supported entity types (create, search, update, delete)
- Relationship graph support for resolving parent-child entity relationships
- Nested model mapping for filtering deeply nested fields
- Global search with filters, pagination, and relationship traversal
