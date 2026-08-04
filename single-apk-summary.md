# Single APK — Summary

*What we're delivering, how we approach it, the logout flow, and where the risks are.*

## What we're delivering

One APK for every deployment — no per-country build. On first launch (or after the app data has been cleared), the app shows a QR scanner. The QR carries a purpose-built **app deeplink** — not a plain URL, not raw JSON. Only QRs that match this deeplink shape are accepted; anything else (WiFi QR, payment QR, random URL) is rejected by the scanner before it reaches the app. Scanning a valid deeplink provisions the device:

- **Server URL** — which server the device talks to
- **Tenant ID** — which tenant on that server
- **MDMS API path** (and other endpoint paths carried alongside it)
- **Branding** — app title and logo URL, rendered inside the app:
  - Logo shown on the home screen
  - App title shown as the app-bar header

After scanning, the app behaves as a normal login-and-work app: credentials-only login (tenant is already resolved from the QR), then straight into the campaign work. Data stays on device across logouts so shift changes on shared devices don't burn network re-downloading everything.

## How we approach it

- **Extend the runtime-config pattern** that multi-hierarchy already established (PR #866), adding server URL, tenant, and MDMS/action paths as runtime-resolved values rather than build-time env values.
- **QR scanner as the first screen** when the app has no stored config. Scanner is restricted (via the existing pattern-validation in `digit_scanner`) to accept only QRs whose contents match our provisioning deeplink — nothing else will register as a valid scan. On a valid scan the deeplink is parsed, persisted to secure storage, and the branding is applied.
- **Reuse the upload gate on logout** already merged in PR #864 — no rework, no new gate.
- **Per-user filter on downsync reads** so shared devices don't leak one worker's assignments to another.
- **Re-provisioning is delegated to Android Settings → App info → Storage → Clear storage.** There is no in-app "Reset" button; the OS path is available anyway, so we accept it as the single reset mechanism.

## Flow — a device across its lifetime

```
1. DEPLOYMENT (once, per device)

   ┌──────────┐    prints    ┌──────┐    scans    ┌──────────────────────┐
   │   Ops    │────────────▶ │  QR  │──────────▶  │  Config stored.      │
   └──────────┘              └──────┘             │  Branding applied.   │
                                                  │  → Login screen      │
                                                  └──────────────────────┘

2. DAILY USE (many logins per day, shared device)

   Worker A ──login──▶ works, syncs ──logout──▶ Worker B ──login──▶ …
                                                   │
                                                   └─ Same device. Data stays.
                                                      Each worker sees only
                                                      their own tasks.

3. RE-PROVISIONING (rare — new server, tenant, or campaign)

   Ops: "please sync any pending records, then go to
         Settings → App info → Storage → Clear storage."

   ──▶ OS wipes app data (including the QR config)
   ──▶ next launch shows the QR scanner again  (back to step 1)
```

## Logout flow — the one in-app safeguard

Logout is the only place inside the app where a user "leaves" a session. It's guarded by a hard block on unsynced records (PR #864, already merged). Data itself is *not* wiped — master data and cached operational data stay so the next login is instant.

```
   User taps Logout
      │
      ▼
   Count pending records for the current user
   (Isar OpLog where syncedUp = false)
      │
      ├──── 0 pending  ────▶ clear auth token
      │                      → back to Login screen
      │                      (data stays on device)
      │
      └──── > 0 pending ────▶ POPUP: "Sync pending records first"
                                  │
                                  ├── [Sync now]  ─▶ upload runs
                                  │                    │
                                  │                    └─ once count == 0,
                                  │                       logout resumes
                                  │
                                  └── [Close]    ─▶ stays logged in
```

## Risks

- **Data loss via OS-level Clear storage (accepted).** Since re-provisioning uses Android Settings → Clear storage, the OS wipes app data without invoking the upload gate. Any pending unsynced records at that moment are lost. Not addressable at the app level. Mitigation is procedural: ops trains users to "sync first, then clear".
- **Cross-user leak on shared devices.** Because downsync data now persists across logouts, a missed per-user read filter would show User A's assignments to User B. The audit + a debug-only warning catch it, but it requires ongoing code-review discipline.
- **Master-data staleness.** Master data persists across logouts, so if server-side MDMS changes are made while the app is closed, users could operate on stale config until the next MDMS refresh runs. Existing refresh-on-login behavior needs to be verified as sufficient.

## Open questions (product)

1. **Same tenant, different campaigns.** Is OS Clear storage the intended reset between campaigns for the same tenant, or do we need a lighter "clear campaign data" flow? Depends on whether campaign switches invalidate boundary hierarchy / module configuration.
2. **Ops procedure for the OS clear step.** Is "sync first, then clear" documented anywhere ops-facing?
3. **Offline provisioning with logo.** The logo is delivered as a URL fetched after scan. First launch after provisioning must have connectivity long enough to load the logo (which is then cached). Is that acceptable for field deployment realities?
4. **One-boundary-per-tenant assumption.** Relevant when geo-fence lands later — do any tenants operate disjoint areas that would need a multi-polygon boundary?
5. **Master-data staleness check.** Do we need an explicit version check on next login (since data now persists across logouts) or is the existing MDMS refresh enough?
