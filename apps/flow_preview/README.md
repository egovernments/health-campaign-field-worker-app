# HCM flow preview

A browser preview for flow-builder / forms-engine configs. It runs the real
`digit_flow_builder` and `digit_forms_engine` from this repo against an
in-memory database with invented sample data, so implementers and product
reviewers can click through a config without a phone or an MDMS push.

**It is not the field worker app.** There is no login, sync, real GPS,
scanning or camera, and nothing is kept after the page is closed.

## Run locally

```sh
cd apps/flow_preview
flutter pub get
flutter run -d chrome
```

To serve a build with the DIGIT proxy: `flutter build web --pwa-strategy=none --no-web-resources-cdn && python3 tool/serve.py`.

Load a config by:
- clicking a bundled example (`assets/examples/*.json`),
- pasting JSON (an MDMS `FormConfig` record, a module with `flows`, a list of
  flows or a single flow), or
- opening the page with `?config=<URL of a JSON file>`.

**Saved records** shows what submitted forms wrote to the preview database.
**Messages** loads localisation messages (the `messages` list from the
localisation search API); keys without a message are shown as the key.

## Embedded in the campaign console (`?embed=1`)

The console's app-config editor (DIGIT-Frontend campaign-manager) can show
an unsaved config in the preview inside an iframe. With `?embed=1` the
preview skips its login page and waits for the host page over
`window.postMessage`. Messages are accepted from, and sent to, **the same
origin only**, so the preview must be served from the console's domain (for
example at `/flow-preview/`, built with `--base-href /flow-preview/`).

| Direction | Message |
|---|---|
| preview → host | `{type: 'hcm-preview:ready', protocol: 1}` once it is listening |
| host → preview | `{type: 'hcm-preview:init', session: {token, userInfo, tenantId, host?, locale?, hierarchyType?}, campaignNumber, config?}` |
| host → preview | `{type: 'hcm-preview:config', config}` to replace the draft |
| preview → host | `{type: 'hcm-preview:status', state: 'loading' \| 'ready' \| 'config-applied' \| 'signed-out' \| 'error', message?}` |

- `session` is the console's own (`Digit.UserService.getUser()`:
  `access_token` and `info`); the token stays in memory.
- `campaignNumber` is the project's `referenceID`; the campaign's root
  project is opened without a staff assignment.
- `config` is a FormConfig record's `data` with the editor's draft `flows`
  (the output of `transformMdmsToAppConfig`). On the home screen it replaces
  the saved module of the same name. If that module is open when a new
  `config` arrives, it restarts at its first screen.
- `session.host` defaults to the page's origin. When served by
  `tool/serve.py`, requests go through its proxy to `session.host`.

**Test locally:** `python3 tool/serve.py`, then open
http://127.0.0.1:8099/embed-host — a development stand-in for the console
(sign in, enter a campaign number, paste or pick a config, send). It is
served from `tool/` and is not part of `build/web`.

**Test the console's drawer:** `/drawer-test` runs the console's real
`AppPreviewDrawer.js`, `transformMdmsToAppConfig` and i18n keys (from a
DIGIT-Frontend checkout) against this preview, with the console's services
stubbed. It loads React and Babel from unpkg.

```sh
python3 tool/serve.py --upstream https://unified-qa.digit.org/ \
  --console-src <DIGIT-Frontend>/health/micro-ui-react19/web/packages/modules/campaign-manager/src
# http://127.0.0.1:8099/drawer-test
```

`--upstream` forwards the same read-only API paths at the root, as the
console's dev server does, because an embedded preview without a
`session.host` calls its own origin. Draft screens can come from the
editor's sample (`configs/fullData.json`), a live MDMS search (after signing
in) or nothing; "Current screen" simulates validation errors.

## Build and deploy

| Step | Where |
|---|---|
| Analyze, test, build, and smoke-test the Docker image on every PR | `.github/workflows/flow-preview.yml` |
| Image (Flutter build → nginx at `/flow-preview/`) | `docker/Dockerfile`, `docker/nginx.conf`; build context is the repo root |
| Build and push the image | **Build Pipeline** workflow (`.github/workflows/build.yaml`, pipeline `flow-preview`) from `build/build-config.yml` → `egovio/hcm-flow-preview:<branch>-<commit>` |
| Route `/flow-preview/` on the campaign console's (workbench-ui) domain to the service | Helm chart and ingress in the DevOps repository |

```sh
# from the repository root
docker build -f apps/flow_preview/docker/Dockerfile -t hcm-flow-preview .
docker run --rm -p 8080:80 hcm-flow-preview   # http://localhost:8080/flow-preview/
```

- No service worker and CanvasKit served from the image
  (`web/flutter_bootstrap.js`, `--no-web-resources-cdn`), so a new deployment
  shows on the next load and nothing loads from www.gstatic.com. (Known
  gap: Flutter's fallback font, Roboto, still comes from fonts.gstatic.com.)
- nginx sends `X-Frame-Options: SAMEORIGIN` and `frame-ancestors 'self'`
  (only the console can frame it) and `Cache-Control: no-cache` (Flutter
  3.22 file names are not content-hashed). Probe: `/flow-preview/health`.

## How it works

- `digit_data_model` picks a browser database connection (SQLite compiled to
  WebAssembly, in memory) and an in-memory oplog when built for the web.
  Android/iOS builds are unchanged.
- `lib/src/session.dart` fills the same singletons the app fills after
  login, with sample values.
- `lib/src/repositories.dart` provides the same repositories as the app and
  the registration module's search graph.

## Status

Step 1 of the preview plan: the app shell and config loading. Still to do:
`web/sqlite3.wasm`, verifying forms and templates in Chrome, sample records,
stand-ins for GPS and scanning, and the GitHub Pages workflow.
