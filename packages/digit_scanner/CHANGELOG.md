## 1.0.7

* Refactored scanner bloc — simplified `DigitScannerBloc` with cleaner state management
* Added `ScannerValidation` model for config-driven validation rules (scanLimit, isGS1, pattern)
    * Exported from `digit_scanner.dart` barrel file
    * Added `ScannerValidationListExt` extension for convenient access to validation values
* Updated `DigitScannerPage` with new parameters:
    * `validations` — list of `ScannerValidation` for dynamic config-driven rules
    * `initialQrCodes` and `initialBarcodeData` — support for edit mode with pre-populated data
    * `scannerId` — unique identifier to prevent multiple scanner fields from conflicting
    * Added effective getters (`effectiveQuantity`, `effectiveIsGS1code`, `effectiveRegex`,
      `effectiveSingleValue`) that resolve from validations or legacy params
* Added GS1 barcode edit support with inline editing of scanned data
* Added camera permission handling with `permission_handler`
    * Added permission denied dialog with "Open Settings" action
    * New i18n keys: `cameraPermissionDenied`, `cameraPermissionDeniedDesc`, `openSettings`,
      `cameraPermissionRequired`, `unableToScan`
* Improved camera initialization with error handling and fallback to first available camera
* Added `WidgetsBindingObserver` to scanner page for lifecycle-aware permission re-checking
* Added scrollable UI for scanned data display
* Added helper methods for GS1 barcode serialization and deserialization
* Refactored `scanner_utils.dart` — simplified GS1 normalization and AI parsing
* Fixed scanner crash issues and back state navigation
* Added `sentenceCaseEnabled` prop support
* Updated dependencies:
    * Added `collection: ^1.17.0`
    * Added `permission_handler: ^11.3.1`
    * Updated `digit_ui_components` to `^0.3.0`

## 0.0.2-console

* Improved error handling to show validation errors only once
* Fixed continuous error display issue when scanning reaches quantity limit
* Moved i18n constants for scanner error messages (scan limit, duplicate, pattern mismatch, invalid
  GS1)
* Optimized scanner to stop processing after reaching maximum quantity
* Enhanced bloc state management to prevent duplicate error emissions

## 0.0.1-console

* Added dynamic validations

## 1.0.6+2

* Updated component of input with DigitInput

## 1.0.6+1

* Modified scanner page with method to override and incorporate attendance features

## 1.0.6

* Updated with new fields for manual entry for gs1 codes
* Updated dynamic capturing of gs1 codes

## 1.0.5+1

* Updated to latest package versions

## 1.0.5

* Updated to latest package versions
* Ui update

## 1.0.4

* Updated to latest package versions
* Updated flutter version to 3.22
* Migrated to digit_ui_components

## 1.0.3+1

* Updated Digit_Components

## 1.0.3

* Manual code entry fixes with stable version

## 1.0.3-dev.1

* Fix for manual entry result not reflecting

## 1.0.2

* UI Fixes
* Added audio to correct scan and invalid scan

## 1.0.1

* Updated digit_components to latest version

## 1.0.0+1

* Initial stable Release

## 1.0.0

* GS1 Barcodes-Removed Enter Manual Code

## 0.0.0-dev.7

Reverted disable button change

## 0.0.0-dev.6

Updated digit_components version for dropdown fix

## 0.0.0-dev.5

Updated repository and homepage url

## 0.0.0-dev.4

Removed flutter localizations dependency

## 0.0.0-dev.3

Added Flutter version constraints

## 0.0.0-dev.2

Digit Scanner Package Setup and Initialization

## 0.0.0-dev.1