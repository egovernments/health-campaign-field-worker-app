import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';

import 'post_gen.dart';
import 'pre_gen.dart';

class MasonEntityGenerator {
  // Function to run Mason template with provided JSON configuration
  Future<void> generateEntity(String jsonString) async {
    // Parse the JSON configuration
    final config = jsonDecode(jsonString);

    // Extract name and attributes from the config
    final name = config['name'];
    final attributes = config['attributes'];
    final enumValues = config['enumValues'];
    final isEnum = config['isEnum'];
    final customAttributes = config['customAttributes'];
    final persistBoundaryParameters = config['persistBoundaryParameters'];

    final homeDirectory = Platform.isWindows
        ? Platform.environment['USERPROFILE']
        : Platform.environment['HOME'];

    // Construct the path to the .pub-cache directory
    final pubCachePath = Directory(
      '$homeDirectory/.pub-cache/hosted/pub.dev/digit_data_model-1.0.7-dev.2/mason_templates',
    );

    // Set the current directory to the constructed path
    Directory.current = pubCachePath;

    print('Current directory set to: ${Directory.current.path}');

    var appDir = Directory.current.path;
    print('appDir: $appDir');

    final file = File(
        '../lib/data/local_store/sql_store/tables/${name.toString().snakeCase}.dart');

    if (!await file.exists()) {
      // Load the Mason brick for entity generation
      final brick = Brick.path("digit_entity"); // Path to the Mason brick
      final generator = await MasonGenerator.fromBrick(brick);

      // Specify the path where the code should be generated
      final customTargetDirectory = Directory("../lib");

      // Set the target directory for code generation
      final target = DirectoryGeneratorTarget(customTargetDirectory);

      // Define variables to pass into Mason template
      dynamic vars = {
        "name": name,
        "isEnum": isEnum,
        "attributes": attributes,
        "enumValues": enumValues,
        "customAttributes": customAttributes,
        "persistBoundaryParameters": persistBoundaryParameters
      };

      PreGen preGen = PreGen();

      vars = preGen.run(vars);

      // Run the generator with the variables
      await generator.generate(target, vars: vars);

      Directory.current = '../lib';

      Postgen postGen = Postgen();

      postGen.run(vars);
    } else {
      print("Table with the name ${name} already exists");
    }
  }
}
