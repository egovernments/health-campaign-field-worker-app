# CLAUDE.md — Agentic Hybrid RAG for DIGIT Flow Builder Config Generation

## What This Project Is

This is a Flutter monorepo (`health-campaign-field-worker-app`) that powers a field worker mobile app. The entire UI is rendered from JSON configuration via the **DIGIT Flow Builder** (`packages/digit_flow_builder`). We are building a **Python-based Agentic RAG system** that generates valid Flow Builder JSON configs from natural language prompts.

The RAG system lives in a new top-level directory: `rag/`.

---

## Repository Layout (Key Paths)

```
health-campaign-field-worker-app/
├── packages/
│   ├── digit_flow_builder/          # Core flow builder engine
│   │   ├── flow-config-schema.json  # JSON Schema (draft-07) for configs
│   │   ├── lib/widgets/implementations/*.dart   # 26 widget implementations
│   │   ├── lib/widgets/widget_registration.dart  # Widget registry
│   │   ├── lib/action_handler/action_executor_registry.dart  # Action registry
│   │   ├── lib/data/transformer_config.dart      # Transformer configs
│   │   ├── lib/custom_component_registry.dart    # Custom component registry
│   │   └── lib/flow_builder.dart                 # FlowRegistry.setConfig()
│   ├── digit_forms_engine/
│   │   └── lib/models/property_schema/property_schema.dart  # PropertySchemaFormat/Type enums
│   └── digit_data_model/
│       └── lib/models/entities/*.dart  # Entity model classes (@MappableClass)
├── apps/health_campaign_field_worker_app/
│   └── lib/sampleJsonConfigs/       # 8 existing config files (exemplars)
│       ├── registration_flows.dart  # (129KB — largest, most patterns)
│       ├── manage_stock.dart
│       ├── complaints.dart
│       ├── hf_referral.dart
│       ├── inventory_reports.dart
│       ├── stock_reconciliation.dart
│       ├── closed_household.dart
│       └── permission_handler.dart
├── DIGIT_FLOW_BUILDER_CONFIG_DOCUMENTATION.md  # 1781-line config guide
├── rag/                             # <<< NEW — build everything here
│   ├── requirements.txt
│   ├── registry_introspector.py
│   ├── schema_generator.py
│   ├── registry_manifest.json       # Auto-generated, do NOT edit
│   ├── flow-config-schema-strict.json  # Auto-generated strict schema
│   ├── indexing/
│   │   ├── chunker.py               # Document chunking logic
│   │   ├── build_index.py           # FAISS + BM25 index builder
│   │   └── stores/                  # Persisted vector/BM25 indexes
│   ├── pipeline/
│   │   ├── manifest.py              # RegistryManifest loader class
│   │   ├── router.py                # Query router (Adaptive RAG)
│   │   ├── retriever.py             # Hybrid BM25 + FAISS retriever
│   │   ├── compressor.py            # Context compression (Contextual RAG)
│   │   ├── generator.py             # Config generation (LLM)
│   │   ├── validator.py             # JSON Schema + semantic validation (Self RAG)
│   │   ├── corrector.py             # Corrective rewriter (Corrective RAG)
│   │   ├── prompts.py               # All prompt templates
│   │   └── graph.py                 # LangGraph state machine (orchestrator)
│   ├── api/
│   │   └── server.py                # FastAPI service
│   └── tests/
│       ├── test_introspector.py
│       ├── test_validator.py
│       ├── test_generator.py
│       └── eval_suite.py            # 20+ prompt-to-config eval cases
└── .github/workflows/
    └── rag-index-rebuild.yml        # CI: auto-rebuild on registry changes
```

---

## Build Order

Follow this exact sequence. Each step depends on the previous one.

### Step 1: `rag/requirements.txt`

```
langchain>=0.3
langchain-openai>=0.2
langchain-community>=0.3
langgraph>=0.2
faiss-cpu>=1.8
rank-bm25>=0.2
jsonschema>=4.20
pydantic>=2.5
fastapi>=0.110
uvicorn>=0.27
```

### Step 2: `rag/registry_introspector.py`

Extracts all registered widgets, actions, entities, form formats, transformer configs, and custom components from the Dart source files. Produces `registry_manifest.json`.

**Source-of-truth files and extraction patterns:**

| What to Extract | Source File (relative to repo root) | How to Extract |
|---|---|---|
| Widget formats | `packages/digit_flow_builder/lib/widgets/implementations/*.dart` | Regex: `String\s+get\s+format\s*=>\s*\n?\s*['\"](\w+)['\"]` (MUST handle multi-line — `text_widget.dart` splits across two lines) |
| Widget registrations | `packages/digit_flow_builder/lib/widgets/widget_registration.dart` | Regex: `FlowWidgetFactory\.register\((\w+)\(\)\)` |
| Action types | `packages/digit_flow_builder/lib/action_handler/action_executor_registry.dart` | Regex: `register\(\s*['\"](\w+)['\"]\s*,\s*(\w+)\(\)` |
| Form field formats | `packages/digit_forms_engine/lib/models/property_schema/property_schema.dart` | Parse `enum PropertySchemaFormat { ... }` block |
| Form field types | Same file as above | Parse `enum PropertySchemaType { ... }` block |
| Entity models | `packages/digit_data_model/lib/models/entities/*.dart` | Parse `class (\w+Model)` from `@MappableClass` annotated files. **SKIP** files ending in `.mapper.dart`. **SKIP** classes containing `SearchModel` or `Companion`. |
| Transformer configs | `packages/digit_flow_builder/lib/data/transformer_config.dart` | Parse top-level map keys: `['\"](\w+)['\"]\s*:\s*\{` |
| Custom components | All `*.dart` files in repo | Regex: `CustomComponentRegistry\.register(?:Dynamic)?\(\s*['\"](\w+)['\"]` |

**For each widget implementation, also extract:**
- Class name (from `class (\w+)\s+(?:extends|implements)`)
- JSON properties read (from `json\[['\"]([\w]+)['\"]\]`)
- Whether it supports `children`, `child`, `onAction`

**Output format:** `rag/registry_manifest.json` — see Section 3.4 of the architecture doc for exact schema.

**CLI:** `python rag/registry_introspector.py --root . --output rag/registry_manifest.json`

**Expected counts (current codebase):**
- Widget formats: 26 unique
- Action types: 12
- Form field formats: 15 (date, latLng, custom, locality, select, numeric, dropdown, checkbox, radio, dob, scanner, idPopulator, mobileNumber, textArea, text)
- Form field types: 5 (object, string, integer, boolean, dynamic)

### Step 3: `rag/schema_generator.py`

Reads `registry_manifest.json` and the original `flow-config-schema.json`, then produces `flow-config-schema-strict.json` with:

1. **Enum constraints** on `screenType`: `["TEMPLATE", "FORM"]`
2. **Enum constraints** on widget `format` fields: all format names from manifest (template widgets + custom components)
3. **Enum constraints** on `actionType` fields: all action type names from manifest
4. **Enum constraints** on form property `format`: all form field formats from manifest
5. **Enum constraints** on form property `type`: all form field types from manifest
6. **Conditional rules** (`if/then/else`):
   - If `screenType == "TEMPLATE"` then `body` is required
   - If `screenType == "FORM"` then `pages` is required
7. **Recursive widget structure**: `children` items and `child` should `$ref` back to the widget definition
8. **Required fields per screen**: `screenType`, `name` are always required

**Input:** `rag/registry_manifest.json` + `packages/digit_flow_builder/flow-config-schema.json`
**Output:** `rag/flow-config-schema-strict.json`
**CLI:** `python rag/schema_generator.py --manifest rag/registry_manifest.json --base-schema packages/digit_flow_builder/flow-config-schema.json --output rag/flow-config-schema-strict.json`

### Step 4: `rag/indexing/chunker.py`

Chunks four document collections:

**Collection 1 — Config Schema Reference:**
- `rag/flow-config-schema-strict.json` → single document chunk
- `DIGIT_FLOW_BUILDER_CONFIG_DOCUMENTATION.md` → section-level chunks split on `## ` / `### ` / `---` headers
- Chunk size: 1000 chars, overlap: 200 chars
- Splitter: `RecursiveCharacterTextSplitter(separators=["\n## ", "\n### ", "\n---", "\n\n", "\n"])`

**Collection 2 — Existing Page Configs (exemplars):**
- All 8 files in `apps/health_campaign_field_worker_app/lib/sampleJsonConfigs/*.dart`
- Custom splitter: parse the Dart map literals, extract each screen object from the `flows` array as a separate document
- Tag each chunk with metadata: `source`, `screen_name`, `screen_type` (TEMPLATE or FORM), `has_wrapper`, `has_init_actions`, `widget_formats_used` (list), `action_types_used` (list), `entity_models` (list)
- These Dart files contain Dart map literals (not raw JSON). The chunker must handle this. The configs are assigned to variables like `const registrationFlows = [{ ... }]`.

**Collection 3 — Widget Reference:**
- Each file in `packages/digit_flow_builder/lib/widgets/implementations/*.dart` → one chunk per file
- Extract: format string, required properties, optional properties, supports_children/child/onAction

**Collection 4 — Transformer & Wrapper Patterns:**
- `packages/digit_flow_builder/lib/data/transformer_config.dart` → per config-name chunk
- Wrapper configs extracted from Collection 2 sample flows → per wrapper chunk

### Step 5: `rag/indexing/build_index.py`

Builds dual indexes from chunked documents:

1. **FAISS vector index** using `OpenAIEmbeddings(model="text-embedding-3-small")`
2. **BM25 keyword index** using `rank_bm25` via LangChain's `BM25Retriever`

Persist both to `rag/indexing/stores/`.

**CLI:** `python rag/indexing/build_index.py`

### Step 6: `rag/pipeline/manifest.py`

The `RegistryManifest` class. Loads `registry_manifest.json` once and provides property accessors:
- `widget_formats -> set[str]`
- `action_types -> set[str]`
- `form_formats -> set[str]`
- `form_types -> set[str]`
- `entity_models -> set[str]`
- `transformer_configs -> set[str]`
- `custom_components -> set[str]`
- `all_widget_formats -> set[str]` (template formats union custom components)
- `widget_detail(format_name) -> dict | None`

### Step 7: `rag/pipeline/router.py`

Query Router using structured LLM output (Adaptive RAG pattern).

**Pydantic model `RouteQuery`:**
- `screen_type`: Literal["TEMPLATE", "FORM", "FULL_FLOW"]
- `intent_keywords`: list[str] — extracted keywords for retrieval
- `is_complete`: bool — whether the prompt has enough detail
- `missing_info`: list[str] — what's missing if incomplete

**Completeness rules:**
- `TEMPLATE`: needs what the screen displays, data source entity, widgets, navigation targets
- `FORM`: needs fields to capture, number of pages, field grouping per page, entity to create on submit
- `FULL_FLOW`: needs all of the above plus screen-to-screen navigation and post-submit behavior

**When `is_complete == False`:** return targeted follow-up questions. Loop until complete or max 3 rounds (then proceed with best-effort).

### Step 8: `rag/pipeline/retriever.py`

Hybrid retriever combining BM25 + FAISS with `EnsembleRetriever`.

- **Weights:** BM25 = 0.6, Vector = 0.4 (config generation is keyword-sensitive)
- **Vector search:** MMR (Maximal Marginal Relevance), k=8, fetch_k=20
- **BM25 search:** k=8
- **Metadata filtering:** filter by `screen_type` metadata when the route is known
- **Multi-query expansion** (RAG Fusion): for ambiguous queries, generate 3 sub-queries focused on (1) screen type/layout, (2) data/actions, (3) navigation/workflow. Merge results with Reciprocal Rank Fusion (k=60).

### Step 9: `rag/pipeline/compressor.py`

Context compression using `LLMChainExtractor` wrapped in `ContextualCompressionRetriever`.

This filters irrelevant sections from retrieved config documents (e.g., a 500-line registration config gets compressed to only the relevant screen sections).

### Step 10: `rag/pipeline/prompts.py`

All prompt templates. Three generation prompts:

1. **TEMPLATE screen prompt** — for single display/list/dashboard screens
2. **FORM screen prompt** — for multi-page data entry forms
3. **FULL_FLOW prompt** — for complete multi-screen flows (generates root config + all screens)

Every prompt MUST inject allowed values dynamically from the manifest:
```
AVAILABLE WIDGET FORMATS: {manifest.all_widget_formats}
AVAILABLE ACTION TYPES: {manifest.action_types}
AVAILABLE ENTITY MODELS: {manifest.entity_models}
AVAILABLE FORM FIELD FORMATS: {manifest.form_formats}
```

**NEVER hardcode** allowed value lists in prompts. Always read from `RegistryManifest`.

Additional prompts:
- **Correction prompt** — receives original config + validation errors + allowed values, outputs fixed JSON
- **Grading prompt** — LLM-as-judge for semantic validation
- **Query expansion prompt** — generates 3 sub-queries for RAG Fusion

### Step 11: `rag/pipeline/validator.py`

Two-stage validation (Self RAG gate):

**Stage 1 — JSON Schema validation:**
- Validate against `rag/flow-config-schema-strict.json` (auto-generated)
- Uses `jsonschema.Draft7Validator`
- Collect all errors via `validator.iter_errors()`

**Stage 2 — Semantic validation:**
- All checks driven by `RegistryManifest` (no hardcoded lists)
- Check: `screenType` is TEMPLATE or FORM
- Check: all widget `format` values exist in `manifest.all_widget_formats`
- Check: all `actionType` values exist in `manifest.action_types` (skip conditional expressions containing `?`)
- Check: all form property `format` values exist in `manifest.form_formats`
- Check: all entity references (`rootEntity`, relation `entity` values) exist in `manifest.entity_models`
- Recurse into `children`, `child`, and nested `actions`

Returns `(is_valid: bool, errors: list[str])`.

### Step 12: `rag/pipeline/corrector.py`

Corrective rewriter (Corrective RAG pattern). Receives:
1. Original config (JSON)
2. Validation errors (list of strings)
3. Allowed values from manifest

Produces a corrected config. Prompt instructs: "Fix ONLY the listed errors. Do not change anything else."

### Step 13: `rag/pipeline/graph.py`

LangGraph state machine that wires everything together.

**State:**
```python
class GraphState(TypedDict):
    user_query: str
    route: Optional[str]           # TEMPLATE | FORM | FULL_FLOW
    is_complete: bool
    missing_info: list[str]
    follow_up_questions: list[str]
    user_answers: list[str]
    intent_keywords: list[str]
    documents: list[str]
    generation: Optional[dict]
    validation_errors: list[str]
    retry_count: int               # Initialize to 0
    final_output: Optional[dict]
```

**Nodes:** route_query, gather_info, retrieve, compress_context, generate_config, validate_config, corrective_rewrite

**Edges:**
```
START → route_query
route_query → [is_complete?] → YES: retrieve | NO: gather_info
gather_info → route_query  (loop, max 3 rounds then force proceed)
retrieve → compress_context → generate_config → validate_config
validate_config → [valid?] → YES: END | NO + retries < 3: corrective_rewrite | NO + retries >= 3: END with warnings
corrective_rewrite → validate_config  (NOT generate_config — go straight to re-validation)
```

**IMPORTANT:** The corrective_rewrite edge goes to `validate_config`, not `generate_config`. Going back to generate would risk undoing corrections.

**IMPORTANT:** The gather_info loop must have a max of 3 iterations. After 3 rounds of follow-up, proceed to generation with whatever information is available.

**Human-in-the-loop for gather_info:** Use LangGraph's `interrupt` mechanism to pause the graph and return questions to the caller. The caller provides answers, then the graph resumes.

### Step 14: `rag/api/server.py`

FastAPI service with these endpoints:

```
POST /generate-config
  Body: { "prompt": "...", "answers": [...] }
  Response: { "config": {...}, "warnings": [...], "is_valid": bool }

POST /validate-config
  Body: { "config": {...} }
  Response: { "is_valid": bool, "errors": [...] }

GET /registry
  Response: { "widget_formats": [...], "action_types": [...], ... }

POST /rebuild-index
  Response: { "status": "ok", "counts": {...} }
```

### Step 15: Tests

**`rag/tests/test_introspector.py`:**
- Run introspector against repo, verify counts match expected (26 widgets, 12 actions, 15 form formats, 5 form types)
- Verify `textTemplate` is captured (the multi-line regex edge case)
- Verify no duplicate formats in output

**`rag/tests/test_validator.py`:**
- Test valid config passes both stages
- Test unknown widget format is caught
- Test unknown action type is caught
- Test unknown entity is caught
- Test missing required fields are caught
- Test recursive children validation works

**`rag/tests/test_generator.py`:**
- Test TEMPLATE generation for a simple dashboard
- Test FORM generation for a 2-page form
- Test generated configs pass validation

**`rag/tests/eval_suite.py`:**
- 20+ prompt-to-config test cases (see Section 8.3 of the architecture doc)
- Metrics: schema validity (target 100%), widget accuracy (target 100%), action accuracy (target 100%), naming convention compliance (target >95%)

### Step 16: `.github/workflows/rag-index-rebuild.yml`

CI workflow that triggers on pushes to these paths:
- `packages/digit_flow_builder/lib/widgets/implementations/**`
- `packages/digit_flow_builder/lib/widgets/widget_registration.dart`
- `packages/digit_flow_builder/lib/action_handler/action_executor_registry.dart`
- `packages/digit_forms_engine/lib/models/property_schema/property_schema.dart`
- `packages/digit_data_model/lib/models/entities/**`
- `packages/digit_flow_builder/lib/data/transformer_config.dart`
- `apps/health_campaign_field_worker_app/lib/sampleJsonConfigs/**`

Steps: checkout → setup Python 3.11 → pip install → run introspector → run schema_generator → run build_index

---

## Critical Rules

1. **NEVER hardcode** allowed widget formats, action types, entity names, or form formats anywhere in the RAG pipeline. Always read from `RegistryManifest` which loads from `registry_manifest.json`.

2. **All generated configs MUST validate** against `flow-config-schema-strict.json` (auto-generated, not the original permissive schema).

3. **Only use values that exist in the manifest.** If a widget format, action type, or entity model isn't in the manifest, it doesn't exist.

4. **Naming conventions are strict:**
   - Screen names in `flows[].name`: `camelCase` (e.g., `searchBeneficiary`)
   - Form names: `UPPER_CASE` (e.g., `STOCKRECONCILIATION`)
   - Localization keys/labels: `SCREAMING_SNAKE_CASE` with pattern `MODULE_SCREEN_FIELD_LABEL` (e.g., `INVENTORY_STOCK_RECONCILIATION_SEARCH_HEADING`)
   - Form field names: `camelCase` (e.g., `firstName`, `dateOfBirth`)

5. **Template interpolation syntax:**
   - `{{key}}` — simple key lookup
   - `{{fn:functionName}}` — function call (only use functions seen in existing configs)
   - `{{singleton.selectedProject.id}}` — singleton access
   - `{{item.fieldName}}` — list item access (inside listView child)
   - `{{context.entityName.field}}` — wrapper context access

6. **The sample configs are Dart map literals, not raw JSON.** The chunker must parse Dart syntax (e.g., `const registrationFlows = [{ ... }]`). Keys may or may not be quoted. Values use single quotes. Booleans are `true`/`false`. The Dart maps are structurally identical to JSON but use Dart syntax.

7. **The corrective rewrite loop goes to `validate_config`, NOT `generate_config`.** This prevents the LLM from undoing corrections.

8. **The gather_info loop has a max of 3 rounds.** After that, proceed to generation with available information.

9. **`permission_handler.dart` in sampleJsonConfigs** contains permission/role configs, not screen configs. Include it in the corpus but tag it with metadata `screen_type: "PERMISSION"` so it's only retrieved for permission-related queries.

---

## Technology Decisions

| Component | Choice | Reason |
|---|---|---|
| LLM | GPT-4o or Claude Sonnet | Need structured output support for router/grader |
| Embeddings | OpenAI `text-embedding-3-small` | Cost-effective for small corpus |
| Vector store | FAISS (in-memory) | Corpus is ~100 documents, no need for a database |
| Keyword search | BM25 via `rank_bm25` | Critical for exact format/action name matching |
| Orchestration | LangChain + LangGraph | State machine for agentic flow with human-in-the-loop |
| Schema validation | `jsonschema` (draft-07) | Matches existing schema format |
| API | FastAPI + uvicorn | Standard Python async API |

---

## What NOT to Build

- Do not modify any Dart/Flutter code in the existing packages
- Do not create a UI/frontend — the FastAPI service is the interface
- Do not create a database — FAISS in-memory is sufficient
- Do not implement authentication on the API (add later)
- Do not implement caching beyond what LangChain provides
- Do not attempt to generate configs for screen types other than TEMPLATE and FORM
