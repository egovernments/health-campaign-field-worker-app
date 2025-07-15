## 0.0.1-dev

- `RegistrationService` class to centralize entity-level CRUD operations and search logic.
- Relationship graph support using `RelationshipMapping` to resolve parent-child entity relationships.
- Nested model mapping via `NestedModelMapping` for resolving and filtering deeply nested fields.
- Repository-based support for the following entity models:
    - `HouseholdModel`
    - `IndividualModel`
    - `HouseholdMemberModel`
    - `ProjectBeneficiaryModel`
    - `TaskModel`
- Global search support through `GlobalSearchParameters` and `SearchEntityRepository`.
- Full CRUD functionality:
    - `registerEntities()` – Create
    - `searchHouseholds()` – Read
    - `updateEntities()` – Update
    - `deleteEntities()` – Delete

---

### ⚠️ Known Limitations

- Currently **tightly coupled to the `registration_delivery` package** for model definitions.
- Only supports entity models provided by `registration_delivery`.

---

### 🔭 Future Scope

- Decouple model and repository logic through abstract interfaces or contracts.
- Make the package **framework-agnostic** and reusable across different domains or modules.

