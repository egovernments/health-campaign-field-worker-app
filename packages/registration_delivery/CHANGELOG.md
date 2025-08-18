## 1.1.0-dev.9-console

* Updated forms-engine package
* Updated transformer config for mobile number fix

## 1.1.0-dev.8-console

* Update localization for bednet condition
* Updated the digit crud bloc version

## 1.1.0-dev.7-console

* BugFix:
    * Fixed index issue for resource card

## 1.1.0-dev.6-console

* Added limitation for max count for resource card

## 1.1.0-dev.5-console

* Added configuration for resource card
* Updated digit_ui_components to latest version

## 1.1.0-dev.4-console

* BugFix:
    * Formula parser bug fix
    * Updated normalizeKnownFlatFieldsRecursively for nested mapping for audit,clientAudit and
      locality

## 1.1.0-dev.3-console

* BugFix:
    * Fixed only single resource was showing issue
    * Fixed flow for register household of any other project
* Updated dependencies to latest versions

## 1.1.0-dev.2-console

* Updated formula parser utils function to capture error and values

## 1.1.0-dev.1-console

* Revamped with configuration based flow
* Integrated with digit_crud_bloc, digit_data_converter, digit_forms_engine
    * Limitations:
        * Depends on form configuration and template configuration
        * Supports single round delivery
        * Supports single filter search
* Integrated with digit_formula_parser for custom formula

## 1.0.7+1

* Updated lister of searchState with stream
* Updated individualGlobalSearch to include all members tasks during filter search
* Updated ViewBeneficiaryCard to support new ineligible status

## 1.0.7

* Updated IdGen, Enumeration, Ineligible flow, Referred Search
* Updated digit_data_model, digit_ui_components, survey_form

## 1.0.7-dev.6-enumeration

* Passing member relation type from ui to bloc

## 1.0.7-dev.5-enumeration

* BugFix:
    * Fixed child delete sync issue

## 1.0.7-dev.4-enumeration

* Updated global search to fetch services related to household and member

## 1.0.7-dev.3-enumeration

* Enabled edit flow

## 1.0.7-dev.2-enumeration

* Updated member repository to update relationship
* Updated check with household type to restrict checklist in clf

## 1.0.7-dev.1-enumeration

* Added Checklist for household and individual page
* Added member relationship model and db

## 1.0.7-dev.2-idGen

* Modified individual search query with individualClientReferenceId
* BugFix:
    * Fetching existing ID if present and prefilling on form during ID change
    * Fixed multiple ID update to individual

## 1.0.7-dev.1-idGen

* IdGen:
    * Added new screen for down-syncing unique ID's
    * Modified search beneficiary page to check for ID's and show specific alerts
    * Modified search by UniqueId by toggle
    * Modified individual page to fetch new ID's and un-used unique Id

## 1.0.6+3

* BugFix:
    * If there is no checklist redirect to BeneficiaryDetailsRoute instead of
      DeliverInterventionRoute

## 1.0.6+2

* BugFix:
    * Refused label change
    * Label change for action buttons in delivery intervention and summary
    * Updated member count to match min value according to children count and pregnant women count

## 1.0.6+1

* Updated to latest packages

## 1.0.6

* Added support for Eligibility checklist
* Modified ServiceAttributes referenceId and ServiceModel clientId to IdGen and passing
  relatedClientReference in additionalFields
* UI/UX fixes
* Updated to latest packages

## 1.0.5+2-dev.1

* Added support for Eligibility checklist
* Modified ServiceAttributes referenceId and ServiceModel clientId to IdGen and passing
  relatedClientReference in additionalFields

## 1.0.5+2

* Action label and status change with projectType

## 1.0.5+1

* householdOverViewActionText localization fix

## 1.0.5

* Upgrade to Flutter 3.22
* Updated latest version's of digit_data_model, survey_form, digit_scanner
* Migrated to digit_ui_components

## 1.0.3+4

* Delivery action label and administered_success status update based on the project

## 1.0.4-dev.5

* Updated digit_data_model to latest version
* Updated survey_form to latest version
* Migrated to digit_ui_components

## 1.0.3+3

* Updated Service model additionalDetails objectType in digit_data_model package

## 1.0.4-dev.1

* Integrated survey_form package

## 1.0.4-dev.3-search-fix

* Bug Fix -
    * Individual, Household search for child query fix

## 1.0.4-dev.2-uniqueId

* Unique Beneficiary Id link to identifier
* Updated digit_data_model package

## 1.0.4-dev.1-uniqueId

* Added BeneficiaryInEligible status
* Added utils function to get unique beneficiary id

## 1.0.3+2

* Bug Fix -
    * fixed wrong status map of beneficiaryRefused in utils
* Sorting tasks based on createTime

## 1.0.4-dev.1

* Integrated survey_form package

## 1.0.3+1

* Bug Fixes -
    * Reload fix after edit
    * Project Beneficiary create for all members if not registered for campaign
* Updated digit_scanner package, digit_components, digit_data_model

## 1.0.3

* IRS Campaign changes
* New HouseDetails screen to capture structure of the house
* New Summary page for registration and delivery
* Introduced Filter search which can be configured through MDMS
* Constructed a global query executor based on project type - Household and Individual
* Getting precise location on registry and delivery
* Updated digit_scanner, data_model package

## 1.0.3-dev.11

* Updated search to include project id for individual and household

## 1.0.3-dev.10

* Removed stepper if number of deliveries is greater than 1

## 1.0.3-dev.9

* Updated localization key
* Resolved taskStatus key from task table entity

## 1.0.3-dev.8

* Reverted 1.0.3-dev.7

## 1.0.3-dev.7

* Updated status to taskStatus in Task model

## 1.0.3-dev.6

* Updated delivery status enums

## 1.0.3-dev.5

* Added count for filter search
* Bug fixes

## 1.0.3-dev.4

* Cache build fix for registration_bloc

## 1.0.3-dev.3

* Closed household flow change

## 1.0.3-dev.2

* Closed household search fixes
* Tasks status fixes on beneficiary card and overview page
* Updated digit_components and digit_scanner versions

## 1.0.3-dev.1

* Fixed filter search bug fixes and improvements
* Updated task status on view_beneficiary card
* Implemented closed household flow filter and update

## 0.0.0-dev.10

* Added pagination for filter search
* Updated PageState class to public for customization
* Updated digit_components

## 0.0.0-dev.9

* Updated individual details file for exposing individual state
* Updated household_overview for BeneficiaryChecklistRoute

## 0.0.0-dev.8

* Added query builder and registry updated changes
* Added New screens - house details

## 1.0.2+1

* Get Precise location on Submitting latitude longitude details

## 1.0.2

* Added try catch for local repository to handle db lock
* Localisation support added for missing fields
* Bug fixes and enhancements

## 1.0.1

* Moved service and service definition bloc to digit_data_model package
* Removed downsync model
* Added HouseholdDetailsBloc in registration_delivery_wrapper page
* Updated digit_data_model to latest version

## 1.0.0+1

* Updated digit_showcase to latest version

## 1.0.0

* Initial stable version

## 0.0.0-dev.7

* Fixed Duplicate routing issue

## 0.0.0-dev.6

* Updated digit_scanner to latest version

## 0.0.0-dev.5

* Facility dialog empty pop up fix on initial load

## 0.0.0-dev.4

* Added null check for fetching product variants

## 0.0.0-dev.3

* Updated digit_data_model to latest version

## 0.0.0-dev.2

* Boundary v2 Integrated, to use Boundary v1 0.0.0-dev.1 version can be used

## 0.0.0-dev.1

* Registration and Delivery Initial Release