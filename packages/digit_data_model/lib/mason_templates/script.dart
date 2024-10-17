import 'dart:io';

class MasonEntityGenerator {
  // Function to run Mason template with provided JSON configuration
  Future<void> generateEntity(String json) async {
    Directory.current = '../packages/digit_data_model/lib/mason_templates';
    // Define the file path
    final tempFile = File('tempFile.json');

    // Create the directory if it doesn't exist
    if (!(await tempFile.exists())) {
      await tempFile.create(recursive: true);
    }

    // Write to the file
    await tempFile.writeAsString(json);
      // Run Mason make command with the config file
      final result = await Process.run(
        'mason',
        ['make', 'digit_entity', '-o', '../mason_templates', '-c', tempFile.path],
      );
      // Check if the process succeeded
      if (result.exitCode == 0) {
        print('successful');
        print(result.stdout); // Print build output (optional)
      } else {
        print('failed');
        print(result.stderr); // Print error message
      }

    // Delete the temporary file
    await tempFile.delete();
    // // Parse the JSON configuration
    // final config = jsonDecode(json);
    //
    // // Extract name and attributes from the config
    // final name = config['name'];
    // final attributes = config['attributes'];
    // final enumValues = config['enumValues'];
    // final isEnum = config['isEnum'];
    //
    // // Load the Mason brick for entity generation
    // final brick = Brick.path("./mason_template");  // Path to the Mason brick
    // final generator = await MasonGenerator.fromBrick();
    //
    // // Specify the path where the code should be generated
    // final customTargetDirectory = Directory(targetDirectory);
    //
    // // Set the target directory for code generation
    // final target = DirectoryGeneratorTarget(customTargetDirectory);
    //
    // // Define variables to pass into Mason template
    // final vars = {
    //   "name": name,
    //   "isEnum": isEnum,
    //   "attributes": attributes,
    //   "enumValues": enumValues
    // };
    //
    // // Run the generator with the variables
    // await generator.generate(target, vars: vars);

    // Directory.current = "../packages/digit_data_model";
    //
    // // Define the data_model related lines
    // var entityExportStatement = "export 'models/entities/${name.toString().snakeCase}.dart';";
    //
    // // Check if the data_model.dart file exists
    // var dataModelFile = File("lib/data_model.dart");
    //
    // // Read the data_model.dart file
    // var dataModelFileContent = dataModelFile.readAsStringSync();
    //
    // // Normalize the whitespace in the file content
    // var normalizedFileContent = dataModelFileContent.replaceAll(RegExp(r'\s'), '');
    //
    // // Check if the export statement already exist in the file
    // // If not, add them to the file
    // if (!normalizedFileContent
    //     .contains(entityExportStatement.replaceAll(RegExp(r'\s'), ''))) {
    //   var libraryIndex = dataModelFileContent.indexOf("// Export statements for various files that are part of the data model.");
    //   if (libraryIndex != -1) {
    //     var endOfLibrary = libraryIndex +
    //         dataModelFileContent.substring(libraryIndex).indexOf(';') +
    //         1;
    //     dataModelFileContent = dataModelFileContent.substring(0, endOfLibrary + 1) +
    //         '\n' +
    //         entityExportStatement + '\n' +
    //         dataModelFileContent.substring(endOfLibrary + 1);
    //
    //     // Write the updated content back to the utils.dart file
    //     dataModelFile.writeAsStringSync(dataModelFileContent);
    //     print('The export statement was added.');
    //   }
    // } else {
    //   print('The export statement already exists.');
    // }

    // final buildClean = await Process.run('dart', ['run', 'build_runner', 'clean']);
    //
    // // Check if the process succeeded
    // if (buildClean.exitCode == 0) {
    //   print('Cleaning successful');
    //   print(buildClean.stdout); // Print build output (optional)
    // } else {
    //   print('Cleaning failed');
    //   print(buildClean.stderr); // Print error message
    // }
    //
    // await Process.run('flutter', ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'])
    //     .then((ProcessResult results) {
    //   print(results.stdout);
    //   print(results.stderr);
    // });
  }

  String directoryPath() {
    return Directory.current.path;
  }
}
