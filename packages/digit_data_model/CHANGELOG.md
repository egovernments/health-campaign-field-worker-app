## 1.0.4-dev.10-uniqueId

* Bug Fix:
    * Updated syncRetryCount,syncRetryInterval and errorPath to dynamic

## 1.0.4-dev.9-uniqueId

* Stock and facility related changes
    * Added dateOfEntry in stock model
    * Added name in facility model

## 1.0.4-dev.8-uniqueId

* Changed additionalDetails of ServiceModel to Map<String, dynamic>

## 1.0.4-dev.7-uniqueId

* Modified identifierType of unique beneficiary id

## 1.0.4-dev.6-uniqueId

* Added additionalDetails field to service definition attributes model

## 1.0.4-dev.5-uniqueId

* Added identifierType enum entity
* Added identifierType and id as primary key to identifier table

* Updated oplog transactions to synchronous - fix for write transaction lock
* Same change in 1.0.3-hotfix, 1.0.4-dev.3

## 1.0.3+2

* Updated beneficiary type target model and table to string
* Updated project type beneficiary type model and table to BeneficiaryType enum

## 1.0.3+1

* Updated oplog transactions to synchronous - fix for write transaction lock

## 1.0.4-dev.3

* Updated oplog transactions to synchronous - fix for write transaction lock
* Same change in 1.0.3-hotfix, 1.0.4-dev.3

## 1.0.3

* Added localization table
* Updated individual local search results with user uuid mapping

## 1.0.3-dev.4

* Updated individual local search results with user uuid mapping

## 1.0.3-dev.3

* Created localization table
    - Creation of the localization table.

## 1.0.3-dev.2

* Reverted user_actions db changes to accommodate closed_household flow changes
    - Reverted user_actions database changes to support closed_household flow changes.

## 1.0.3-dev.1

* Added new user_actions db
    - Added a new user_actions database.

## 1.0.2

* Added try catch for local repository to handle db lock
    - Implemented try-catch for local repository to handle database locks.

## 1.0.1

* Added Service and Service Definition Bloc
    - Introduction of Service and Service Definition Bloc.

## 1.0.0

* Initial stable release
    - First stable release of the Digit Data Model.

## 0.0.0-dev.3

* Supports boundary v2 and updated single entities to list for all search models
    - Added support for boundary v2 and updated single entities to lists for all search models.

## 0.0.0-dev.2

* Boundary v2 Integrated, to use Boundary v1 0.0.0-dev.1 version can be used
    - Integration of Boundary v2 with the option to use Boundary v1 version 0.0.0-dev.1.

## 0.0.0-dev.1

* Digit Data Model Initial Release
    - This marks the initial release of the Digit Data Model.