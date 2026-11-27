## 0.0.1

* Provider-independent `TelemetryService` API with `DigitTelemetry` as the app-facing entry point
* `TelemetryProvider` interface and a PostHog provider (`PosthogProvider`)
* `TrackingPolicy` to decide which modules, screens and capabilities are tracked
* `NavigationTracker` and `TelemetryRouteObserver`: screen views, forward and back steps, time on screen (paused in background)
