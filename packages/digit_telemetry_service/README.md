# digit_telemetry_service

Product telemetry for DIGIT apps behind one provider-independent API.

The app logs through `DigitTelemetry.instance` and never imports a telemetry
SDK. Each telemetry tool is an `TelemetryProvider`; the package ships
`PosthogProvider`. Changing the tool means writing one provider class and
changing the line that passes it to `DigitTelemetry.initialize`.

## What it does

| Part | Purpose |
|---|---|
| `TelemetryService` / `DigitTelemetry` | The API the app uses: `start`, `stop`, `identify`, `reset`, `screen`, `track`, `setSuperProperties`. Never throws. Remembers identity and super properties until started. Drops personal-looking property keys and unsupported values. |
| `TelemetryProvider` | The adapter one telemetry tool implements (about 8 methods). `NoopTelemetryProvider` sends nothing. |
| `PosthogProvider` | PostHog adapter. The only file that imports `posthog_flutter`. |
| `TrackingPolicy` | Which modules, screens (with `*` wildcards) and capabilities (`screens`, `navigation`, `backNavigation`, `timeOnScreen`) are tracked. Built from JSON. |
| `NavigationTracker` + `TelemetryRouteObserver` | Screen views, `navigated` events (`from`, `to`, `direction`, `seconds_on_screen`). Time stops while the app is in the background. The app supplies an `TelemetryRouteResolver` to name its routes. |

## Setup

```dart
DigitTelemetry.initialize(PosthogProvider(host: host, apiKey: apiKey));
NavigationTracker.instance.policy = TrackingPolicy.fromJson(policyJson);
await DigitTelemetry.instance.start();

// Navigator observers:
TelemetryRouteObserver((route) => /* TelemetryRoute.screen('...') or null */);

// When a module opens:
NavigationTracker.instance.moduleOpened('AEFI');
```

## PostHog: settings the host app must add

A pure Dart package cannot change the app's native settings.

- **Android** `AndroidManifest.xml`, inside `<application>`:
  ```xml
  <meta-data android:name="com.posthog.posthog.AUTO_INIT" android:value="false" />
  ```
- **iOS** `Info.plist`: key `com.posthog.posthog.AUTO_INIT`, value `false`.
- **Kotlin 1.8 apps**: `posthog_flutter` 5.0.0 pulls `posthog-android:3.+`.
  Pin it to `3.14.1` in `android/build.gradle` with a `resolutionStrategy`.

## Adding another provider

1. Add `lib/src/providers/<tool>_provider.dart` implementing `TelemetryProvider`.
2. Export it from `lib/digit_telemetry_service.dart` and add the SDK to
   `pubspec.yaml`.
3. In the app, pass the new provider to `DigitTelemetry.initialize`.
