import 'dart:convert';
import 'dart:io';
import 'package:digit_data_model/post_gen.dart';
import 'package:mason/mason.dart';
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

    // Directory.current = '../packages/digit_data_model/mason_templates';
    Directory.current = Directory('/home/admin1/.pub-cache/hosted/pub.dev/digit_data_model-1.0.4-dev.8/mason_templates');

    final file = File('../lib/data/local_store/sql_store/tables/${name.toString().snakeCase}.dart');

    if (!await file.exists()) {
      // Load the Mason brick for entity generation
      final brick = Brick.path("digit_entity");  // Path to the Mason brick
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

      PreGen preGen = new PreGen();

      vars = preGen.run(vars);

      // Run the generator with the variables
      await generator.generate(target, vars: vars);

      Directory.current = '../lib';

      Postgen postGen = new Postgen();

      postGen.run(vars);
    }
    else {
      print("Table with the name ${name} already exists");
    }
  }
}
