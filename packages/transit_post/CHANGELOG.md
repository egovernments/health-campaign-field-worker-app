## 1.0.2

* Added VACCINATION_FAILED filter and refreshed `transit_post_record_vaccination` and `transit_post_selection` pages
* Fixed UserAction oplog dedup to keep the latest entry per `clientReferenceId`
* Moved `TRANSIT_POST` `additionalFields` filter from local repository to bloc level
* Added Polio eligibility fix, `notExists` query support
* Added `listen` method on `user_action.dart`; oplog now handles update operations
* Atomic localization cache swap; O(1) `translate()` lookup
* Send `STOCK_BALANCE` oplog entries in `createdAt` ASC order
* Alert dialogs for Accept and Reject flows
* SMC insufficient-stock popup; drop stale root docs
* Modified transformer config; scanner builder captures `dateTime` in `additionalFields`

## 1.0.1

* Updated to latest packages

## 1.0.0

* Initial release for transit post
