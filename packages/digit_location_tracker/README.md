Device Tracking :
This package is used to capture the device location using device GPS. Based on the GPS detection By given interval and given condition if it returns true then it starts capturing the location and stores in the File. Background service reads the records directly from the file and creates an Oplog. Sync service based on batch size and sends records to the server. If the response is 200 then against those records it will be marked as synced true in Oplog.

## Features
Capture the device location using device GPS.
Configurable time interval, start and end dates

![Device Tracker](https://github.com/user-attachments/assets/fbcec14f-a1be-4ff9-9ec1-9383532927c4)


## Getting started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  digit_location_tracker: ^any
```

## Usage
Digit Location Tracker requires below data to be passed from main app:

LocationTrackerSingleton().setInitialData(
          projectId: context.projectId,
          loggedInUserUuid: context.loggedInUserUuid,
        );


triggerLocationTracker(
        'com.digit.location_tracker',
        startAfterTimestamp: startAfterTimestamp.millisecondsSinceEpoch,
        locationUpdateInterval: 60 * 1000, // TODO: Read from config
        stopAfterTimestamp: project.endDate ??
            now.add(const Duration(hours: 8)).millisecondsSinceEpoch,
      );
      
## Additional Required information

Create location service file in your android folder and replace main activity similar to this 
1. https://github.com/egovernments/health-campaign-field-worker-app/blob/location_tracker/apps/health_campaign_field_worker_app/android/app/src/main/kotlin/com/digit/hcm/MainActivity.kt 
2. https://github.com/egovernments/health-campaign-field-worker-app/blob/location_tracker/apps/health_campaign_field_worker_app/android/app/src/main/kotlin/com/digit/hcm/location_service.kt
