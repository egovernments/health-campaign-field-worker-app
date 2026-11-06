# digit_face_verification

Offline face verification for field worker attendance using MobileFaceNet + Google ML Kit.

The package provides:

- On-device face enrollment and verification (no server round-trip required)
- Liveness detection to defeat photo/video replay
- Distance-metric based match scoring against a locally-stored embedding
- A ready-to-use capture, enrollment, and verification UI

## Getting Started

Add the dependency to your app's `pubspec.yaml`:

```yaml
dependencies:
  digit_face_verification: ^0.0.1
```

Register the BLoCs your flow needs — typically enrollment, verification, and liveness — near the root of your widget tree:

```dart
MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (_) => FaceEnrollmentBloc(),
    ),
    BlocProvider(
      create: (_) => FaceVerificationBloc(),
    ),
    BlocProvider(
      create: (_) => LivenessBloc(),
    ),
  ],
  child: const MyApp(),
);
```

### Enrolling a user

```dart
context.router.push(
  FaceEnrollmentRoute(individualId: individual.clientReferenceId),
);
```

### Verifying a user

```dart
context.router.push(
  FaceVerificationRoute(individualId: individual.clientReferenceId),
);
```

### Wrapping attendance actions

For attendance flows, wrap the guarded action in `FaceAttendanceWrapper` so the user must pass face verification before the action fires:

```dart
FaceAttendanceWrapper(
  individualId: individual.clientReferenceId,
  onVerified: () {
    // Mark attendance / trigger the guarded action
  },
  child: const AttendanceMarkButton(),
);
```

## Configuration

- The MobileFaceNet model and audio prompts ship as bundled assets under `assets/models/` and `assets/audio/`.
- Match-cutoff, liveness challenge sequence, and localization keys are driven from the app's MDMS face-auth config.
