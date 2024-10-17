import 'dart:io';
import 'package:digit_data_model/mason_templates/script.dart';

void main() async {
  String folderPath = 'jsonFiles';
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
  print(generator.directoryPath());

  // Iterate over each JSON file
  for (final jsonFile in jsonFiles) {
    print('Processing ${jsonFile.path}...');
    try {
      final jsonString = await jsonFile.readAsString();

      // print(jsonString);
      await generator.generateEntity(jsonString);
    }  catch (e, stackTrace) {
      print('Error processing file ${jsonFile.path}: $e');
      print(stackTrace); // To log the stack trace for debugging
    }
  }
}
