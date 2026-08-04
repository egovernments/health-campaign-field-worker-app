# Single APK — Approach (HLD & LLD)

*HLD, LLD, what's already possible in the codebase, and what needs to be built.*

## 1. What exists vs. what we build

### Already possible (leverage)

- `EnvironmentConfiguration` singleton loading `.env` at startup (`envConfig.variables.*`)
- Multi-hierarchy runtime-singleton pattern: `DigitDataModelSingleton.hierarchyType` + `runtimeHierarchyType()` resolver (PR #866)
- Upload-gate-on-logout at widget layer: Isar OpLog count + *Sync/Close* popup + resume-after-sync (PR #864, branch `Single-APK-per-countries-859`)
- Isar `OpLog` collection with `syncedUp` / `syncedDown` / `createdBy` fields
- Drift downsync entities carry `auditDetails.createdBy`
- Existing MDMS v2 pipeline (`_searchV2` in `data/repositories/remote/mdms.dart:172`) and Dio DI wiring
- `digit_scanner` package with regex/pattern validation already built in (`QRScannerPage(regex:…, patternMessage:…)` → `blocs/scanner.dart` filters via `RegExp.hasMatch`). Reused for the provisioning-deeplink shape check.

### Not yet built (this design)

- Runtime fields for `tenantId` / `baseUrl` / `mdmsApiPath` / `actionMapApiPath` on the singleton + their resolvers
- Reconfigurable Dio (`DioClient.reconfigure(baseUrl)`)
- Provisioning deeplink format + a scanner pattern constant published from `digit_scanner`
- QR-bootstrap page (wraps `QRScannerPage`) + bootstrap bloc + secure-store persistence
- Deeplink URI parser + content validation (`https`-only baseUrl, version, required params)
- Branding widgets reading QR-supplied app title + logo (home screen + app bar)
- `createdBy` filter on user-scoped downsync repository reads
- Migration of every `envConfig.variables.*` read to the runtime resolver

## 2. High-level design

### 2.1 Flow

```
    Fresh install / after OS Clear storage             Authenticated session
   ┌──────────────┐    ┌──────────────┐    ┌──────────┐    ┌──────────────────┐
   │ QR-SCAN      │───▶│ Configure    │───▶│  LOGIN   │───▶│ Session:         │
   │ Parse+persist│    │ Dio; populate│    │ (creds   │    │  - runtimeTenantId
   │  baseUrl,    │    │ singletons;  │    │ only,    │    │  - runtimeBaseUrl│
   │  tenantId,   │    │ apply branding│   │ tenant   │    │  - branded UI    │
   │  mdmsApiPath │    │ (home + bar) │    │ from QR) │    │                  │
   │  branding    │    │              │    │          │    │                  │
   └──────────────┘    └──────────────┘    └──────────┘    └────────┬─────────┘
                                                                     │
                                                             "Logout" (P3)
                                                                     │
                                                                     ▼
                                                       ┌───────────────────────┐
                                                       │  Upload gate ★        │
                                                       │  (strict block if any │
                                                       │   syncedUp=false row) │
                                                       │  Clear auth + per-    │
                                                       │  user singleton state │
                                                       │  → LOGIN              │
                                                       └───────────────────────┘

    Re-provisioning (P2) is not an in-app action. Ops walks the user through
    Android Settings → App info → Storage → Clear storage. On next launch the
    app has no bootstrap_config and lands on QR-SCAN. Residual risk: OS-level
    clear bypasses the upload gate; pending records are lost if any.

    ★ Strict upload gate — implemented in PR #864. No new work.
```

### 2.2 Key decisions

1. **Everything runtime, nothing baked.** `baseUrl`, `tenantId`, `mdmsApiPath`, `actionMapApiPath`, and branding come from the QR. `.env` is a dev fallback only.
2. **Extend `DigitDataModelSingleton`.** Same pattern as multi-hierarchy. One resolver family for all runtime values.
3. **Dio reconfigurable at bootstrap time.** Built with a mutable base URL; reconfigured after QR capture. (Reset is OS-level, so no reconfigure-on-reset case — after OS clear, the app restarts from scratch.)
4. **Tenant bound to the QR**, not chosen at login. Once the platform's multi-instance mode ships, `tenantId` will be embedded in the URL path — QR's separate field becomes redundant (kept for compat).
5. **Logout doesn't wipe.** Data persists across logouts and shift changes.
6. **Only one exit flow.** Logout, gated on unsynced records. Re-provisioning is deliberately OS-level.
7. **Cross-user isolation via `createdBy` filter.** User-scoped downsync reads add the filter; master-data reads stay unfiltered.
8. **Branding rendered from QR-supplied assets.** Native launcher label/icon stay generic. In-app widgets (home logo, app bar title) read from bootstrap config.

## 3. Low-level design

### 3.1 QR bootstrap

#### Payload format — app deeplink

The QR encodes a purpose-built app deeplink. Only strings matching this shape are accepted; the scanner rejects everything else.

```
digit://provision?v=1
  &baseUrl=https%3A%2F%2Fhealth-partner-x.example%2F
  &tenantId=hcm
  &mdmsApiPath=mdms-v2%2Fv2%2F_search
  &actionsApiPath=actions%2F_get
  &appTitle=Partner%20X%20HCM
  &logoUrl=https%3A%2F%2Fcdn.example%2Flogo.png
```

All values are URL-encoded. Because a QR-sized URI is limited (roughly ≤1 KB for a comfortable scan), the logo travels as a URL, not embedded bytes.

#### Scanner filtering — reuse digit_scanner's existing pattern validation

`packages/digit_scanner` already exposes a validation surface: `QRScannerPage` accepts a `regex` (or a `List<ScannerValidation>`) and the scanner bloc (`packages/digit_scanner/lib/blocs/scanner.dart`) filters scans via `RegExp.hasMatch`. The bootstrap flow uses this — no new scanner infrastructure needed.

```dart
// Constant published from digit_scanner for reuse
const provisionDeeplinkPattern =
    r'^digit:\/\/provision\?(?=.*\bv=)(?=.*\bbaseUrl=)(?=.*\btenantId=).*$';

// Bootstrap page invokes the scanner with this pattern
QRScannerPage(
  regex: provisionDeeplinkPattern,
  patternMessage: 'This is not a valid provisioning QR.',
);
```

- The scanner never emits a scan result for non-matching content — the app never sees WiFi/payment/marketing QRs.
- On a match, the bootstrap bloc parses the URI (`Uri.parse` + `queryParameters`), then applies content validation: `baseUrl` is `https`-only, `v` is a known version, required params present, URL-decoded values are sane.
- Persist the validated payload to `LocalSecureStore` under `bootstrap_config`.

#### New files

- `pages/qr_bootstrap.dart` — wraps `QRScannerPage` with the provisioning pattern; feeds valid scans to the bootstrap bloc.
- `blocs/bootstrap/bootstrap.dart` — load-from-secure-store on app start or capture-from-scan; emits `Uninitialized` / `Ready`.

Router: `Uninitialized → QR`, `Ready → login`. Same *Uninitialized* branch handles fresh install and post-OS-clear cases.

### 3.2 Runtime resolvers

```dart
class DigitDataModelSingleton {
  String? _hierarchyType;     // existing
  String? _tenantId;          // NEW
  String? _baseUrl;           // NEW
  String? _mdmsApiPath;       // NEW
  String? _actionMapApiPath;  // NEW
  BrandInfo? _brand;          // NEW  { appTitle, logoUrl / logoBytes }
}

// apps/…/utils/runtime_config.dart (new)
String runtimeTenantId()       => _resolve(singleton.tenantId,       envConfig.variables.tenantId);
String runtimeBaseUrl()        => _resolve(singleton.baseUrl,        envConfig.variables.baseUrl);
String runtimeMdmsApiPath()    => _resolve(singleton.mdmsApiPath,    envConfig.variables.mdmsApiPath);
String runtimeActionsApiPath() => _resolve(singleton.actionMapApiPath, envConfig.variables.actionMapApiPath);
BrandInfo? runtimeBrand()      => singleton.brand;   // no env fallback for branding
```

Debug-only assert if runtime value is missing and env fallback fires — catches un-migrated call sites. Grep audit replaces every `envConfig.variables.*` read with the matching resolver.

### 3.3 Reconfigurable Dio

Change `DioClient` so `options.baseUrl` is mutable and add `reconfigure({required String baseUrl})`. Called from the bootstrap bloc after QR capture; in-flight requests at that instant are cancelled via `dio.close(force: true)`.

### 3.4 Login (no discovery)

`pages/login.dart` stays a credentials-only form. On submit: `POST fetchAuthToken` with `runtimeTenantId()`. No dropdown, no tenant-discovery repo. Populates the per-user singleton state on success.

### 3.5 Upload gate — reused from PR #864

Widget-layer implementation stays exactly as merged. Gate lives in `apps/…/pages/authenticated.dart`'s `onLogOut` handler: `isar.opLogs.filter().createdByEqualTo(userId).syncedUpEqualTo(false).count()`, `Popup(alert)` with *Sync* / *Close*, resume-after-sync via `_pendingSyncLogout`. **No new work on the gate.**

### 3.6 Logout flow

1. Upload gate (§3.5). Strict block if any `syncedUp=false` row exists.
2. Server logout call (best-effort, existing).
3. Clear `LocalSecureStore` credentials only (*not* `bootstrap_config`).
4. Clear per-user singleton state: `setHierarchyType(null)`. `tenantId`, `baseUrl`, brand stay populated.
5. Route to login. **No Isar clear, no Drift wipe.**

### 3.7 Branding rendering

Bootstrap bloc exposes the parsed brand info. Widgets consume it via `runtimeBrand()`:

- **Home screen logo** — `brand.logoUrl` loaded via `NetworkImage`. Cache to disk on first successful load so subsequent launches show it offline. Deeplink pragma settles the URL-vs-base64 question: only a URL fits comfortably in the QR.
- **App bar header** — `AppBar` title widget replaced by `brand.appTitle` text. Localization keys unaffected.
- **Fallback** — if branding is absent (older QR, offline logo fetch failed), fall back to a neutral title + no logo.

### 3.8 Cross-user isolation

Devices are shared across workers. Since logout no longer wipes downsync, isolation is enforced at read time.

- **User-scoped (needs `createdBy` filter):** OpLog (already filtered — PR #864 uses this) and per-user assignment rows in downsync tables (`Household`, `Task`, `Referral`, `Attendance`, …).
- **Tenant-scoped (safe unfiltered):** `AppConfiguration`, `ServiceRegistry`, `Localization`, `RowVersions`, `Boundary`, reference tables like `ProductVariant`.

Approach: per-table audit → add `createdBy = context.loggedInUserUuid` to reads on user-scoped tables → debug-only warning in the repo base when a user-scoped read runs unfiltered.

### 3.9 File changes summary

| File | Change |
|---|---|
| `packages/digit_data_model/lib/utils/utils.dart` | Add `tenantId` / `baseUrl` / `mdmsApiPath` / `actionMapApiPath` / `brand` fields + setters/getters |
| `apps/…/utils/runtime_config.dart` *(new)* | Resolvers with env fallback (brand has no fallback) |
| `apps/…/data/network/dio_client.dart` | Mutable base URL + `reconfigure()` |
| `packages/digit_scanner/lib/utils/constants.dart` | Publish the provisioning deeplink regex constant (`provisionDeeplinkPattern`) for reuse by the app-side bootstrap page. Optional: add a factory returning a preconfigured `ScannerValidation`. |
| `apps/…/pages/qr_bootstrap.dart` *(new)* | Wraps `QRScannerPage` with the deeplink pattern; parses `Uri`; hands payload to bootstrap bloc |
| `apps/…/blocs/bootstrap/bootstrap.dart` *(new)* | Load-from-store / capture-from-scan; content validation (`https`-only, version, required params); persist to secure store |
| Home widget + `AppBar` title widget | Consume `runtimeBrand()`; fallback if absent |
| `apps/…/pages/authenticated.dart` | *No change from PR #864.* Upload gate stays where it is. |
| `apps/…/blocs/auth/auth.dart` | Populate singleton on login; `_onLogout` unchanged (no wipe) |
| `apps/…/pages/login.dart` | Swap `envConfig.variables.tenantId` → `runtimeTenantId()` |
| `apps/…/main.dart` / router | Route on `BootstrapState`: `Uninitialized` → QR, `Ready` → login |
| Downsync repos / DAOs | §3.8 audit: add `createdBy` filter on user-scoped reads |
| All `envConfig.variables.*` read sites | Replace with the matching resolver (grep audit) |

**Not in this design:** no `utils/wipe.dart`, no `blocs/app_reset/app_reset.dart`, no "Reset app" settings entry. Re-provisioning is not an in-app feature.

## 4. Sequencing

1. **Phase 0 (merging separately)** — PR #864 upload gate on logout. Consumed as-is.
2. **Phase 1** — Runtime resolvers + reconfigurable Dio. Grep-audit-migrate `envConfig.variables.*`. Env fallback keeps behavior identical. No user-visible change.
3. **Phase 2** — Cross-user isolation: per-table audit + `createdBy` filters on user-scoped reads. Ships without QR.
4. **Phase 3** — QR bootstrap + branding widgets. Scanner, bloc, secure-store persist, Dio reconfigure, home logo + app-bar title. Login screen consumes `runtimeTenantId()`. No geo-fence.
5. **Phase 4 (deferred)** — Geo-fence at login. Boundary GeoJSON delivery, point-in-polygon utility, permission handling. Blocks on backend GeoJSON.

## 5. Risks (tech)

- **Accepted residual: OS-level Clear storage.** Bypasses the upload gate; pending records lost. Not addressable at app level. Mitigation is procedural (ops trains "sync first, then clear").
- **Missed `envConfig.variables.*` read sites.** Debug-only assert in `_resolve` + grep audit.
- **Missed `createdBy` filter on a user-scoped read.** Privacy leak on shared devices. Audit-time classification + debug-only warning in repo base + code-review checklist.
- **Dio-reconfigure race at QR capture.** Router blocks non-bootstrap routes until `BootstrapState` is `Ready`; `dio.close(force: true)` before reconfigure.
- **Malicious / phishing QR.** Scanner-level deeplink filtering eliminates false-positive scans (WiFi, payment, marketing QRs never reach the app). What remains is a hostile QR that *uses* our deeplink scheme. Content validation catches structural failures (`https`-only, version, required params). Signed-QR verification deferred; slots into the bootstrap bloc's parse step when picked up.
- **Branding logo load failure.** If `logoUrl` is unreachable on first launch after scan, the app falls back to no-logo. Cache-to-disk after first successful load so offline sessions still see branding.

## 6. Open questions (tech)

1. **Downsync table classification.** §3.8 lists tables to audit but doesn't say which specific rows are user-scoped vs. tenant-scoped. Needs a per-table pass with data-owners before Phase 2 starts.
2. **Multi-config support** (multiple cached QR configs, switchable without OS clear). Not in Phase 1. If ever adopted: per-tenant DB instance (cleanest, no query changes) vs. single DB with `tenantId` filter on every read (smaller, risky).
3. **Geo-boundary enforcement in the login API.** Client-side point-in-polygon can be bypassed on rooted devices. Should the login API also validate against request IP or a signed device claim? Client design unchanged either way.
4. **Signed / verifiable QR payload.** Deferred. Slots between "parse" and "persist" in the bootstrap pipeline without changing other components. Requires backend signing infra + agreed threat model.
