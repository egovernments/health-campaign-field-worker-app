## 2.1.1

* Added offline face recognition attendance with JSON-driven face-event dots, MDMS-independent config, hard match cutoff, and full i18n
* Added multi-hierarchy support (moved `hierarchyType` from build-time env to per-project runtime; centralized country-suffix stripping)
* Added Polio productization alongside SMC: registration flows, inside-household monitoring, LQA data collection, redose flow, transit-post home card, unique beneficiary ID pool, VACCINATION_FAILED filter
* Nigeria stock revamp: CDD scan flow with explicit Accept/Decline, RECEIVED-row generation on Accept, receive-list dedup, batch/expiry/waybill threading, per-campaign balance scoping
* VAPT/security hardening: SQLCipher DB encryption, SSL pinning gated on PROD, root detection, ProGuard rules, ScreenProtectionManager, secure broadcast receivers, `AppSecurityLevel` envs
* Migrated MDMS v1 → v2 and added a config-driven eligibility engine (dynamic label placeholders, dose criteria, cycle/dose context resolution)
* Performance: pre-warmed Home, hot-path SQL indexes with post-migration ANALYZE, O(1) localization lookups, chunked/split localization retries, global loading coordinator, boundary-fetch scoped to missing codes only
* UI/UX audit alignment with Figma across spacing, tags/typography, progress bars, permission page, logout dialog, sync popup, home tiles, download-success screen, no-result cards