# Sync Service Package

The `sync_service` provides access to sync service related configurations and listeners -
SyncEntityMapperListener, syncDownRetryCount, persistenceConfiguration

## Features

SyncBloc: Handles refresh and syncup

Data:
The `SyncEntityMapperListener` is an abstract class that defines methods for handling sync entity
mapping. This class provides methods for writing to the entity database, getting the sync count,
handling entity responses, and updating entities.
The `SyncService` class provides methods to perform sync operations - performSync, writeToEntityDB,
getPendingSyncRecordsCount, filterEntityByBandwidth, filterOpLogByBandwidth, SyncError class

Repositories -
RepositoryType - provides methods to get the remote and local repositories for a given data model
type - getRemoteForType, getLocalForType
PerformSyncDown - provides a method to perform a sync down operation.
PerformSyncUp - provides a method to perform a sync up operation.

Models: Bandwidth Model

## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  sync_service: ^latest
```

## Usage

Here are some examples of how to use the DataModel package in your project:

Extend the `SyncUpOperation` implement the required methods.

```dart
    class CustomSyncRegistry implements SyncUpOperation {
  CustomSyncRegistry({
    this.remote
  });
}
```

Extend the `SyncEntityMapperListener` class and implement the required methods.

```dart
    class SyncServiceMapper extends SyncEntityMapperListener {
}
```