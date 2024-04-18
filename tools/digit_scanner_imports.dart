import 'dart:io';

void main() {
  var appDir = Directory.current.path;

  // Define the paths
  var appRoot = '$appDir/apps/health_campaign_field_worker_app/lib';
  var localizationDelegatesFilePath =
      '$appRoot/utils/localization_delegates.dart';

  _createLocalizationDelegatesFile(localizationDelegatesFilePath);

  // Run dart format on the localization_delegates.dart file
  Process.run('dart', ['format', localizationDelegatesFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });
}

void _createLocalizationDelegatesFile(String localizationDelegatesFilePath) {
  // Define the import statement and delegate
  var importStatement =
      "import 'package:digit_scanner/blocs/app_localization.dart'\n    as scanner_localization;";
  var delegate =
      "scanner_localization.ScannerLocalization.getDelegate(\n      getLocalizationString(\n        isar,\n        selectedLocale,\n      ),\n      appConfig.languages!,\n    ),";

  // Read the localization delegates file
  var localizationDelegatesFile = File(localizationDelegatesFilePath);
  var localizationDelegatesFileContent =
      localizationDelegatesFile.readAsStringSync();

  // Check if the import statement and delegate already exist in the file
  if (!localizationDelegatesFileContent.contains(importStatement)) {
    localizationDelegatesFileContent =
        '$importStatement\n$localizationDelegatesFileContent';
    print('The import statement was added.');
  }

  if (!localizationDelegatesFileContent.contains(delegate)) {
    localizationDelegatesFileContent =
        localizationDelegatesFileContent.replaceFirst('];', '  $delegate\n];');
    print('The delegate was added.');
  }

  // Write the updated content back to the file
  localizationDelegatesFile.writeAsStringSync(localizationDelegatesFileContent);
}
