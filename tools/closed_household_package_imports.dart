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
  // Define the import statement and delegate for localization
  var importStatement =
      "import 'package:closed_household/blocs/app_localization.dart'\n    as closed_household_localization;";
  var delegate =
      "closed_household_localization.ClosedHouseholdLocalization.getDelegate(\n      getLocalizationString(\n        isar,\n        selectedLocale,\n      ),\n      appConfig.languages!,\n    ),";

  // Read the localization delegates file
  var localizationDelegatesFile = File(localizationDelegatesFilePath);
  var localizationDelegatesFileContent =
  localizationDelegatesFile.readAsStringSync();

  var normalizedFileContent =
  localizationDelegatesFileContent.replaceAll(RegExp(r'\s'), '');

  // Check if the import statement and delegate already exist in the file
  // If not, add them to the file
  if (!normalizedFileContent
      .contains(importStatement.replaceAll(RegExp(r'\s'), ''))) {
    localizationDelegatesFileContent =
    '$importStatement\n$localizationDelegatesFileContent';
    print('The import statement was added.');
  }

  if (!normalizedFileContent.contains(delegate.replaceAll(RegExp(r'\s'), ''))) {
    var lastDelegateIndex =
    localizationDelegatesFileContent.lastIndexOf(RegExp(r','));
    if (lastDelegateIndex != -1) {
      localizationDelegatesFileContent =
          localizationDelegatesFileContent.substring(0, lastDelegateIndex + 1) +
              '\n  $delegate' +
              localizationDelegatesFileContent.substring(lastDelegateIndex + 1);
      print('The delegate was added.');
    }
  }

  // Write the updated content back to the file
  localizationDelegatesFile.writeAsStringSync(localizationDelegatesFileContent);
}
