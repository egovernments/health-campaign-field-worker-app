## 0.1.2

- `within`: fix the radius-to-bounding-box conversion. The deltas were in radians but compared against degree columns, so the box was far too small; they are now converted to degrees
- Added the `withinOrUnlocated` operator (`withinOrUnlocatedOperator`): like `within`, but also keeps rows with no recorded location (null or 0/0 coordinates), e.g. outside-household sites added by planners without GPS
- Added the `__distance` order field (`distanceOrderField`): sorts by distance from the centre of the search's `within` filter, nearest first with `ASC`, unlocated rows last. Ignored when the search has no `within` filter
- Geo filters and the distance sort cast coordinates stored as text to numbers
- Geo-filtered paginated searches fetch a little extra and trim to the page size, so the exact-distance post-filter no longer returns short pages

## 0.1.1

- `SearchEntityRepository`: add hot-path indexes and run `ANALYZE` after migrations to prime the SQLite query planner; skip redundant `COUNT` queries on the read path
- Refresh `sqlite_stat1` once per session so cardinality estimates stay current without paying the cost on every query

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
