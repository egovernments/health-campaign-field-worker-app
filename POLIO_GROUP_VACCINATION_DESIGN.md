# Polio Group Vaccination — HLD & LLD

> **Feature**: session-based vaccination recording at Communal Living Facilities (CLF) and Transit Posts, for polio (nOPV2) campaigns.
> **Source of truth**: WHO AFRO PRD (Group Vaccination, Draft v4, 2026-08-31) and prototype at `https://akhil-egov.github.io/hcm-group-vaccination-prototype/`.
> **Implementation**: JSON-driven flows via `digit_flow_builder`; **two independent modules** (`CLF_VACCINATION`, `TRANSIT_VACCINATION`) reached from two home cards; zero new Dart UI code.

---

## 1. HLD (High-Level Design)

### 1.1 Purpose
Enable frontline workers to record polio vaccinations delivered at **ad-hoc gathering points** (schools, markets, health posts, community centres, bus stations, border crossings, checkpoints, ferry terminals) where beneficiaries are **not pre-enumerated**.

### 1.2 Scope
- **In scope**: session-based vaccination + on-the-fly referrals, GPS capture, aggregate campaign coverage via events.
- **Out of scope**: household/individual creation, target allocation, downstream microplan integration (PRD open item).

### 1.3 System Context

```
┌────────────────────────────────────────────────────────────────┐
│                     HCM Field-Worker App                       │
│                                                                │
│  ┌───────────────┐   ┌─────────────────────┐   ┌────────────┐  │
│  │ Home page     │──▶│ Digit Flow Builder  │──▶│ Local DB   │  │
│  │  (Polio)      │   │  (JSON-driven UI)   │   │ (Drift)    │  │
│  │  CLF card ────┼──▶│  CLF_VACCINATION    │   │            │  │
│  │  Transit card ┼──▶│  TRANSIT_VACCINATION│   │            │  │
│  └───────────────┘   └─────────────────────┘   └─────┬──────┘  │
│                             │                        │         │
│                             ▼                        │         │
│                    ┌─────────────────┐               │         │
│                    │  Transformer    │               │         │
│                    │  Config Engine  │               │         │
│                    └─────────────────┘               │         │
└──────────────────────────────────────────────────────┼─────────┘
                                                      │
                              (Sync Service)          ▼
                                              ┌─────────────────┐
                                              │  UserAction API │
                                              │  (egov backend) │
                                              └─────────────────┘
```

### 1.4 Key Components

| Component | Path | Responsibility |
|---|---|---|
| CLF flow config | `apps/health_campaign_field_worker_app/lib/sampleJsonConfigs/polio_clf_vaccination.dart` | 6-flow module for CLF (schemaKey `CLF_VACCINATION`). |
| Transit flow config | `apps/health_campaign_field_worker_app/lib/sampleJsonConfigs/polio_transit_vaccination.dart` | 6-flow module for Transit (schemaKey `TRANSIT_VACCINATION`). |
| Transformer configs | `packages/digit_flow_builder/lib/data/transformer_config.dart` | 5 entries: `clfSession`, `transitSession`, `groupVacChild`, `groupVacReferral`, `groupVacCloseout`. |
| Home cards | `apps/.../lib/pages/home.dart` | Reuses `i18.home.clfLabel` (isPolio-only card) and `i18.home.transitPostLabel` (isPolio → new flow; else falls back to native `TransitPostWrapperRoute`). |
| Showcase | `apps/.../lib/widgets/showcase/config/home_showcase.dart` | Reuses existing `homeShowcaseData.clf` and `homeShowcaseData.transitPost`. |
| MDMS / localization service | egov backend | Strings (`GV_*`) — **not yet added**. |
| Flow-builder runtime | `packages/digit_flow_builder/lib/action_handler/**` | Interprets config, resolves templates, drives navigation, invokes CRUD. |

### 1.5 Data Flow (Session Lifecycle)

Same shape for both modules; the only difference is the module-form marker (`POLIO_CLF_VACCINATION` vs `POLIO_TRANSIT_VACCINATION`) and the setup-form fields.

```
worker ─► CLF or Transit setup form
              │  CREATE_EVENT
              ▼
         UserActionModel #S (session root, resourceTag = self)
                additionalFields.form = POLIO_{CLF|TRANSIT}_VACCINATION
                additionalFields.sessionType = "CLF" | "TRANSIT"
              │
              ├──── Vaccinate ──► UserActionModel #V1 (resourceTag = #S.crId)
              ├──── Vaccinate ──► UserActionModel #V2 (resourceTag = #S.crId)
              ├──── Refer     ──► UserActionModel #R1 (resourceTag = #S.crId)
              │
              ▼
         Close Session ──► UserActionModel #C  (resourceTag = #S.crId)
```

All records land in local `user_action` table; sync workers upload them opportunistically.

### 1.6 Persistence Model

- **Single table**: `UserActionModel` (existing HCM entity).
- **No new schema** — leverages `additionalFields` (JSON) for form-specific attributes.
- **Linkage**: `resourceTag` = parent session's `clientReferenceId` (LQA pattern).
- **Discriminators**:
  - `additionalFields.form` ∈ {`POLIO_CLF_VACCINATION`, `POLIO_TRANSIT_VACCINATION`}
  - `additionalFields.formType` ∈ {`GROUP_VAC_SESSION`, `GROUP_VAC_CHILD`, `GROUP_VAC_REFERRAL`, `GROUP_VAC_CLOSEOUT`}
  - `additionalFields.sessionType` ∈ {`CLF`, `TRANSIT`} (on session + child records)

### 1.7 Integration Touchpoints

| System | How | Direction |
|---|---|---|
| MDMS | localization + (future) `FormConfig` fetch for override | pull |
| UserAction API | event upload during sync | push |
| Boundary API | `sessionArea` locality auto-fill | pull |
| Dashboard / analytics | aggregate over `form` + `formType` + `boundaryCode` | push (indirect) |

### 1.8 Non-Functional

| Aspect | Approach |
|---|---|
| **Offline** | Config bundled; all writes hit local Drift DB first (`isSync=false`); flushed by sync service. |
| **Idempotency** | `clientReferenceId` UUID generated client-side; server upsert. |
| **i18n** | All labels are keys (`GV_*`); rendered via `LocalizationDelegate`. |
| **RBAC** | Gated by `isPolio` at the home card level. |
| **Telemetry** | UserAction rows themselves are the telemetry primitives. |
| **Security** | No PII beyond optional child name + guardian contact (referrals); stored in encrypted local DB, transmitted over HTTPS. |
| **Extensibility** | Adding new fields = edit the sample JSON + transformer config; no Dart UI code changes. |

### 1.9 Assumptions & Constraints

- Runs only when `selectedProject.type == POLIO` (both cards).
- Each session's type is fixed by the module the worker entered from (no in-form selector).
- Vaccine is derived from the project's product details (`ProjectResource` / `ProductVariant`) — not stored per-event.
- Nationality enum is Central/West-Africa scoped (Chad/Nigeria/Cameroon/CAR/Sudan/Niger/Other) — will need regional overrides.
- Existing native `TransitPostWrapperRoute` is retained for non-polio projects (the Transit Post card branches on `isPolio`).

---

## 2. LLD (Low-Level Design)

### 2.1 Flow Registration

| Attribute | CLF | Transit |
|---|---|---|
| Module `schemaKey` | `CLF_VACCINATION` | `TRANSIT_VACCINATION` |
| Config top-level `name` | `CLF_VACCINATION` | `TRANSIT_VACCINATION` |
| `initialPage` | `clfSessionSetup` | `transitSessionSetup` |
| `project` | `POLIO-SIA` | `POLIO-SIA` |
| Home moduleName | `hcm-clf-vaccination-{projectRefId}` | `hcm-transit-vaccination-{projectRefId}` |
| Home label key | `i18.home.clfLabel` | `i18.home.transitPostLabel` |
| Icon | `Icons.account_balance` | `Icons.local_shipping_outlined` |

### 2.2 Screen Inventory (each module, 6 screens)

| # | CLF flow name | Transit flow name | screenType | Role |
|---|---|---|---|---|
| 1 | `clfSessionSetup` | `transitSessionSetup` | FORM | Create session |
| 2 | `clfSessionOverview` | `transitSessionOverview` | TEMPLATE | Dashboard, list children/referrals |
| 3 | `ADD_CLF_CHILD` | `ADD_TRANSIT_CHILD` | FORM | Record one vaccination |
| 4 | `ADD_CLF_REFERRAL` | `ADD_TRANSIT_REFERRAL` | FORM | Record one referral |
| 5 | `clfCloseout` | `transitCloseout` | FORM | End GPS + comments |
| 6 | `clfSuccess` | `transitSuccess` | TEMPLATE | Success + Add-another / Home |

### 2.3 Field-Level Spec

#### 2.3.1 CLF `sessionSetup` page

| # | fieldName | format | required | notes |
|---|---|---|---|---|
| 1 | `clfLocationType` | dropdown | Y | SCHOOL/MARKET/HEALTH_POST/COMMUNITY_CENTRE/OTHER |
| 2 | `locationName` | text | Y | |
| 3 | `responsiblePerson` | text | N | |
| 4 | `contactNumber` | phone | N | |
| 5 | `sessionDate` | date | Y | readOnly, `systemDate=true` |
| 6 | `sessionArea` | locality | N | readOnly (from boundary) |
| 7 | `workerName` | text | Y | autoFill `{{loggedInUserName}}` |
| 8 | `workerPhone` | phone | N | autoFill `{{loggedInUserMobileNumber}}` |
| 9 | `gpsStart` | latLng | Y | required |

#### 2.3.2 Transit `sessionSetup` page

| # | fieldName | format | required | notes |
|---|---|---|---|---|
| 1 | `transitLocationType` | dropdown | Y | BUS_STATION/BORDER_CROSSING/CHECKPOINT/FERRY_TERMINAL/OTHER |
| 2 | `locationName` | text | Y | landmark |
| 3 | `sessionDate` | date | Y | readOnly, `systemDate=true` |
| 4 | `sessionArea` | locality | N | readOnly |
| 5 | `workerName` | text | Y | autoFill `{{loggedInUserName}}` |
| 6 | `workerPhone` | phone | N | autoFill `{{loggedInUserMobileNumber}}` |
| 7 | `gpsStart` | latLng | Y | required |

#### 2.3.3 `childDetails` page (both flows, differing per-type via visibility)

| # | fieldName | format | required (CLF / Transit) | Visibility |
|---|---|---|---|---|
| — | `sessionType` (hidden) | text | N | always (autoFill `{{navigation.SessionType}}`) |
| 1 | `childName` | text | N / N | always |
| 2 | `childSex` | dropdown | Y / Y | MALE/FEMALE |
| 3 | `ageBand` | dropdown | Y / Y | 0_11_MONTHS/12_59_MONTHS |
| 4 | `directionOfTravel` | dropdown | — / Y | Transit only (ENTERING/EXITING) |
| 5 | `nationality` | dropdown | — / Y | Transit only |
| 6 | `opvPrior` | dropdown | Y / Y | YES/NO |
| 7 | `ipvPrior` | dropdown | Y / Y | YES/NO |
| 8 | `twoDropsAdministered` | dropdown | Y / Y | default YES |
| 9 | `fingerMarked` | dropdown | Y / Y | default YES |

Both modules use the same field names for children so downstream analytics is uniform; the transit-only fields exist only in the transit form (kept off the CLF form entirely).

#### 2.3.4 `referralDetails` page (both flows)

| # | fieldName | format | required | validations |
|---|---|---|---|---|
| 1 | `contactPerson` | text | Y | — |
| 2 | `contactNumber` | phone | N | — |
| 3 | `address` | textArea | N | maxLength 300 |
| 4 | `referralReason` | textArea | Y | maxLength 500 |

#### 2.3.5 `closeout` page (both flows)

| # | fieldName | format | required | validations |
|---|---|---|---|---|
| 1 | `gpsEnd` | latLng | N | — |
| 2 | `finalComments` | textArea | N | maxLength 500 |

### 2.4 Navigation Matrix (per flow)

| From | Trigger | To | Nav data | Nav mode |
|---|---|---|---|---|
| Home card | tap (isPolio) | `{clf|transit}SessionSetup` | — | push |
| Setup | Submit | `{clf|transit}SessionOverview` | `SessionClientReferenceId`, `SessionType` | push |
| Overview | "Vaccinate" | `ADD_{CLF|TRANSIT}_CHILD` | `SessionClientReferenceId`, `SessionType` | push |
| Overview | "Refer" | `ADD_{CLF|TRANSIT}_REFERRAL` | `SessionClientReferenceId` | push |
| Overview | "Close Session" | `{clf|transit}Closeout` | `SessionClientReferenceId` | push |
| `childDetails` | Submit | `{clf|transit}SessionOverview` | same | `popUntilAndPush` → `{clf|transit}SessionSetup` |
| `referralDetails` | Submit | `{clf|transit}SessionOverview` | same | `popUntilAndPush` → `{clf|transit}SessionSetup` |
| `closeout` | Submit | `{clf|transit}Success` | — | push |
| Success | "Add Another" | `{clf|transit}SessionSetup` | — | push |
| Success | "Back to Home" | `HOME` | — | back |

### 2.5 Transformer Config → UserActionModel Payload

Common columns (all five configs): `clientReferenceId` (uuid), `projectId`, `boundaryCode`, `tenantId` (all `__context:*`), `timestamp` (NOW), `isSync=false`, `auditDetails`, `clientAuditDetails`.

| Config | `action` | `resourceTag` | GPS fields | `additionalFields.form` | `additionalFields.formType` |
|---|---|---|---|---|---|
| `clfSession` | `LOCATION_CAPTURE` | `__ref:UserActionModel.clientReferenceId` | `sessionSetup.gpsStart[0/1/2]` | `POLIO_CLF_VACCINATION` | `GROUP_VAC_SESSION` |
| `transitSession` | `LOCATION_CAPTURE` | `__ref:UserActionModel.clientReferenceId` | `sessionSetup.gpsStart[0/1/2]` | `POLIO_TRANSIT_VACCINATION` | `GROUP_VAC_SESSION` |
| `groupVacChild` | `VACCINATION_ADMINISTERED` | `__context:SessionClientReferenceId` | — | (inherited via session join) | `GROUP_VAC_CHILD` |
| `groupVacReferral` | `REFERRAL_RECORDED` | `__context:SessionClientReferenceId` | — | (inherited via session join) | `GROUP_VAC_REFERRAL` |
| `groupVacCloseout` | `LOCATION_CAPTURE` | `__context:SessionClientReferenceId` | `closeout.gpsEnd[0/1/2]` | (inherited via session join) | `GROUP_VAC_CLOSEOUT` |

- Session configs also stamp `additionalFields.sessionType = CLF | TRANSIT` (as `__value:*`).
- Child config carries `sessionType` from the form (autofilled from navigation), enabling per-record filtering without needing the session join.
- Vaccine is not stamped on events — resolve from `ProjectResource` / `ProductVariant` at aggregation.

### 2.6 Session Overview Wrapper (search/join spec)

Each module filters on its own `additionalFields.form` (`POLIO_CLF_VACCINATION` for CLF, `POLIO_TRANSIT_VACCINATION` for Transit) so cross-type pollution is impossible.

```
rootEntity : UserActionModel
filters    : action == LOCATION_CAPTURE
             additionalFields.form == POLIO_{CLF|TRANSIT}_VACCINATION
relations  :
  - session (self-join, clientReferenceId == clientReferenceId)
  - children  (resourceTag == session.clientReferenceId,
               filter: additionalFields.formType == GROUP_VAC_CHILD)
        └─ child (self-join for latest snapshot)
  - referrals (resourceTag == session.clientReferenceId,
               filter: additionalFields.formType == GROUP_VAC_REFERRAL)
        └─ referral (self-join)
```

### 2.7 Sequence Diagrams

#### 2.7.1 Session Setup (CLF example)

```
Worker    UI (Flow Builder)     Transformer      DB
  │              │                   │             │
  │─ tap Start ─▶│                   │             │
  │              │─FETCH_TRANSFORMER_CONFIG "clfSession"─▶
  │              │                   │─map form→UserActionModel
  │              │◀──entities────────│             │
  │              │─CREATE_EVENT USERACTION─────────────────▶│
  │              │◀──ok (crId=S)──────────────────────────│
  │              │─NAV → clfSessionOverview [S, "CLF"]      │
  │              │─SEARCH_EVENT resourceTag=S──────────────▶│
  │              │◀──[session, children=[], referrals=[]]───│
  │◀─ overview ──│                                          │
```

#### 2.7.2 Vaccinate Child

```
Worker    UI                  Transformer         DB
  │─tap Vaccinate─▶│                                │
  │            (nav data: S, "CLF"|"TRANSIT")       │
  │───fill form + submit────▶│                      │
  │                │─FETCH_TRANSFORMER_CONFIG        │
  │                │  "groupVacChild" (data=[S])     │
  │                │─map (resourceTag=S,             │
  │                │      sessionType from form)     │
  │                │─CREATE_EVENT ────────────────▶│
  │                │◀─ok─────────────────────────────│
  │                │─NAV popUntilAndPush(overview,S) │
  │                │─SEARCH_EVENT resourceTag=S ──▶│
  │                │◀─[session,children=[V1],refs=[]]│
  │◀─ overview ────│                                 │
```

### 2.8 Localization Keys (to add on MDMS)

Reused existing keys:
- `HOME_COMMUNAL_LIVING_FACILITIES_LABEL` (via `i18.home.clfLabel`)
- `HOME_TRANSIT_POST_LABEL` (via `i18.home.transitPostLabel`)

New keys to add:
- `GV_CLF_SESSION_SETUP_*`, `GV_TRANSIT_SESSION_SETUP_*`
- `GV_CLF_LOCATION_TYPE_*`, `GV_TRANSIT_LOCATION_TYPE_*`, `GV_LOCATION_NAME_*`
- `GV_RESPONSIBLE_PERSON_*`, `GV_CONTACT_NUMBER_*`
- `GV_SESSION_DATE_*`, `GV_SESSION_AREA_*`, `GV_WORKER_NAME_*`, `GV_WORKER_PHONE_*`, `GV_GPS_*`
- `GV_CHILD_*`, `GV_AGE_BAND_*`, `GV_DIRECTION_OF_TRAVEL_*`, `GV_NATIONALITY_*`, `GV_OPV_PRIOR_*`, `GV_IPV_PRIOR_*`, `GV_TWO_DROPS_*`, `GV_FINGER_MARKED_*`
- `GV_REFERRAL_*`
- `GV_CLOSEOUT_*`, `GV_FINAL_COMMENTS_*`
- `GV_SUMMARY_*` (overview label pairs)
- `GV_TAG_*` (finger-marked status chip)
- `GV_ACTION_*` (button labels)
- `GV_ERROR_*` (toast messages)
- `GV_VALIDATION_*` (form errors)
- `GV_ENUM_*` (all dropdown option names)

### 2.9 Error Handling

Every `FETCH_TRANSFORMER_CONFIG`, `CREATE_EVENT`, and `NAVIGATION` action carries an `onError → SHOW_TOAST` with a `GV_ERROR_*` message key. The flow does not roll back partial saves — single-record atomicity per action, guaranteed by the executor.

### 2.10 Edge Cases

| Case | Behaviour |
|---|---|
| Non-polio project taps Transit Post card | Falls through to existing native `TransitPostWrapperRoute()`. |
| Non-polio project (CLF card) | Card is not shown (isPolio-gated). |
| Worker exits mid-session (kills app) | Session record already committed; on relaunch the session isn't auto-resumed. |
| GPS unavailable at setup | Blocks submission (`gpsStart` required). |
| GPS unavailable at close-out | Allowed (not required). |
| Duplicate submit taps | Flow builder disables submit while action executes; `clientReferenceId` UUID generated per attempt. |
| Empty session closed | Success screen still fires; downstream analytics simply see zero children/referrals. |

### 2.11 Traceability to PRD

| PRD requirement | Where satisfied |
|---|---|
| Two separate entry points (CLF vs Transit) | Two home cards (CLF isPolio-gated, Transit isPolio-branched) |
| Session-type-specific setup fields | CLF and Transit each have their own setup form |
| Optional child name | `childName.validations = []` |
| Two-drops + finger-marked checklist | `twoDropsAdministered`, `fingerMarked` (default YES) |
| Eligibility questions removed | Intentionally not added |
| Headless data model | UserAction-only; no Household/Individual entities |
| Aggregate campaign metrics | `form` + `formType` + `boundaryCode` provide group-by dimensions |
| GPS capture on setup | Required `gpsStart` in both setup forms |
| Referral capture | `ADD_CLF_REFERRAL` / `ADD_TRANSIT_REFERRAL` with guardian contact, address, reason |
| Vaccine sourced from product details | Not persisted on event; resolved via `ProjectResource` at aggregation time |

---

## 3. Open Items

1. **MDMS localization** — none of the `GV_*` keys exist yet.
2. **Resume-open-session** UX — not in prototype but likely a v2 ask.
3. **Vaccine attribution** — resolved from `ProjectResource` at aggregation time; add a product picker on session setup if multi-product projects emerge.
4. **Aggregate dashboard** — define analytical queries over `form` ∈ {`POLIO_CLF_VACCINATION`, `POLIO_TRANSIT_VACCINATION`}.
5. **Sync verification** — confirm UserAction sync endpoint accepts the new `formType` values without server-side allow-listing.

---

## 4. References

- PRD: `https://docs.google.com/document/d/1sLFJ2bY58EG0TavutztCEu0qJMq1txCjsZDCWUbOODA`
- Prototype: `https://akhil-egov.github.io/hcm-group-vaccination-prototype/`
- Flow-builder docs: `DIGIT_FLOW_BUILDER_CONFIG_DOCUMENTATION.md`
- Prior-art configs (session/child pattern): `polio_lqa_data_collection.dart`, `polio_inside_household_monitoring.dart`
