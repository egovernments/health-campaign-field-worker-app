import 'dart:io';

import 'package:digit_data_model/utils/entity_creation/entity_generator.dart';

// Run this script in tools directory
void main() async {
  // Get the current script URI
  Uri scriptUri = Platform.script;
  var appDir = Directory.current.path;

  // Convert it to a Directory (typically project root is the parent of 'bin' or 'lib' or wherever this script is)
  Directory.current = appDir + '/tools';

  String folderPath = 'json_files';
  final directory = Directory(folderPath);

  if (!directory.existsSync()) {
    print('Directory $folderPath does not exist');
    return;
  }

  // List all .json files in the directory
  final jsonFiles = directory
      .listSync()
      .where((file) => file.path.endsWith('.json') && file is File)
      .cast<File>();

  if (jsonFiles.isEmpty) {
    print('No JSON files found in $folderPath');
    return;
  }

  MasonEntityGenerator generator = new MasonEntityGenerator();

  // Iterate over each JSON file
  for (final jsonFile in jsonFiles) {
    // Get the current script URI
    scriptUri = Platform.script;

    // Convert it to a Directory (typically project root is the parent of 'bin' or 'lib' or wherever this script is)
    Directory.current = appDir + '/tools';

    print(Directory.current);

    print('Processing ${jsonFile.path}...');
    try {
      final jsonString = await jsonFile.readAsString();

      // Process the JSON file
      await generator.generateEntity(jsonString);
    } catch (e, stackTrace) {
      print('Error processing file ${jsonFile.path}: $e');
      print(stackTrace); // To log the stack trace for debugging
    }
  }
}
