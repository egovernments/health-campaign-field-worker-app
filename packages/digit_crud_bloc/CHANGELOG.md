## 0.1.0

- Added `matches` operator for JSON substring lookups
- Added `within`, `equalsAny`, and `containsAll` operators
- Hardened `containsAll`, `in`, and `notIn` against NULL and empty inputs
- Fixed `in:[]` to be match-none (was incorrectly match-all)
- Routed geo count queries through Drift
- Preserved search wrapper state on clear/persisted transitions
- Added table indexes for improved search performance
- Refresh `sqlite_stat1` once per session in `SearchEntityRepository`
- Add hot-path indexes, run post-migration `ANALYZE`, skip redundant COUNTs
- Gate `IndexDiag` behind debug so it no longer blocks first search
- Improve primary-key inference; snake_case for primary table; enhanced error logging
- Enhance `table_widget` with `@condition`-based cell values and structured evaluation contexts (`currentItem`, `contextData`)
- Fix visibility check support for `button_widget`; visible-property preprocessing with `listIndex` awareness
- Fix multiple-individual and count-query issues; add OR condition to `query_builder.dart`
- Add access to navigation data in `search_executor.dart` for search of lists
- Removed registration package dependency; renamed from `global_bloc`

## 0.0.1

- Added OR condition support to SQL query builder
- Fixed service.isInitialized error
- Added multi-table filter support
- Updated query builder for search of list
- Added SQL ordering support

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
