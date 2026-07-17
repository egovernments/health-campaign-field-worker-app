## 1.0.5

* Added background sync lock check in `SyncService` to prevent overlapping runs
* Updated background service stop to route through `invoke`
* Improved sync bloc, `sync_down`, `sync_up`, and utils with extensive fixes; added tests
* Removed unused test package dependency

## 1.0.4

* Updated `digit_data_model` to latest version

## 1.0.3

* Updated sync error to return runtime type and error message

## 1.0.2

* Updated data_model version to latest
* Published new version

## 1.0.1-dev.3-enumeration

* Added singleUpdate based on the operationType SingleUpdate

## 1.0.1-dev.2-enumeration

* Added missing await in syncUp for bulk operations

## 1.0.1-dev.1-enumeration

* Added downsync of service to support enumeration

## 1.0.1

* Bug Fix:
    * Added missing await in syncUp

## 1.0.0

* Updated to latest package versions

## 0.0.1-dev.1

* Init release
