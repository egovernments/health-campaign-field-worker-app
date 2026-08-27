## 1.0.6

* Send `STOCK_BALANCE` oplog entries in `createdAt` ASC order so downstream reconciliation sees them in the order they were recorded
* Restore enum-index sort on sync-up type buckets so buckets flush in the intended sequence

## 1.0.5

* Added background sync lock check in `SyncService` to prevent overlapping runs
* Updated background service stop to route through `invoke`
* Improved sync bloc, `sync_down`, `sync_up`, and utils with extensive fixes; added tests
* Removed unused test package dependency
* Send `STOCK_BALANCE` oplog entries in `createdAt` ASC order
* Implemented DB encryption; added new `db_error` page and localized button/text/tag widgets
* Sync package now surfaces captured errors instead of swallowing them
* Post-1.8 merge fixes to form config and merge-conflict resolution

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
