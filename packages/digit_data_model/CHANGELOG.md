## 1.0.6-dev.1

* This change is for Bauchi campaign
* Added additionalProjectType in additionalFields of project

## 1.0.6

* Added localityCode in attendance table
* Added relatedClientReferenceId in service table
* Added household type in household table to support CLF
* Updated migration script

## 1.0.5-dev.3

* Added household type in household table to support CLF

## 1.0.5-dev.2

* Added localityCode in attendance table and modified migration script
* Added relatedClientReferenceId in service table and modified migration script

## 1.0.5

* Upgrade to Flutter 3.22
* Added project_type in Project Table
* Changed isActive to bool in Service Attribute table

## 1.0.5-dev.1

* Merged pgr and survey_form package changes

## 1.0.4+1

* Bug Fix:
    * Updated syncRetryCount,syncRetryInterval and errorPath to dynamic

## 1.0.4

* Added user_action entity for digit_location_tracker package

## 1.0.3+3

* Added tenant id to query params and RequestInfo for security gateway fixes
* Updated additionalDetails field to service definition attributes model
* Changed the object type of additionalDetails in Service model from String to Map

## 1.0.3+2

* Updated beneficiary type target model and table to string
* Updated project type beneficiary type model and table to BeneficiaryType enum

## 1.0.3+1

* Updated oplog transactions to synchronous - fix for write transaction lock

## 1.0.4-dev.4

* synced with 1.0.4-dev.3 changes

## 1.0.4-dev.3

* Updated oplog transactions to synchronous - fix for write transaction lock
* Same change in 1.0.3-hotfix, 1.0.4-dev.3

## 1.0.4-dev.2

* Removed Service and Service Definition models
    - Removed Service repositories and Service blocs to integrate in checklist package

## 1.0.4-dev.1

* Separated PGR Package
* Moved Models, Bloc, Repositories related to PGR Package

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