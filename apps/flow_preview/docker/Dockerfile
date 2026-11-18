# HCM flow preview: Flutter web build served by nginx at /flow-preview/.
#
# Build context is the REPOSITORY ROOT (the preview uses packages/* by path):
#   docker build -f apps/flow_preview/docker/Dockerfile -t hcm-flow-preview .
#
# Served on the same domain as the campaign console (workbench-ui), which
# embeds it in an iframe (?embed=1) and talks to it over postMessage (same
# origin only). Built by .github/workflows/build.yaml (pipeline flow-preview).

# --- Build ------------------------------------------------------------------
# Same Flutter version as the APK workflows (.github/workflows/build-apk.yml).
FROM ghcr.io/cirruslabs/flutter:3.22.2 AS build

WORKDIR /src
COPY packages ./packages
COPY apps/flow_preview ./apps/flow_preview

WORKDIR /src/apps/flow_preview
# --enforce-lockfile: build exactly what pubspec.lock pins (including the
# digit_ui_components git dependency), never newer versions.
RUN flutter pub get --enforce-lockfile

# --pwa-strategy=none        no service worker (see web/flutter_bootstrap.js)
# --no-web-resources-cdn     CanvasKit served from this image, not gstatic.com
# --base-href /flow-preview/ path the ingress routes to this service
RUN flutter build web --release \
      --pwa-strategy=none \
      --no-web-resources-cdn \
      --base-href /flow-preview/

# --- Serve ------------------------------------------------------------------
FROM nginx:mainline-alpine

COPY --from=build /src/apps/flow_preview/build/web /var/web/flow-preview
COPY apps/flow_preview/docker/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
