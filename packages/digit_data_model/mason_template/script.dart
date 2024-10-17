import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';

void main() async {
  // Load JSON configuration
  final jsonFile = File('mason_template/data.json');
  final config = jsonDecode(await jsonFile.readAsString());

  // Extract name and fields from the config
  final name = config['name'];
  final attributes = config['attributes'];

  // Load the Mason brick for entity generation
  final brick = Brick.path('mason_template/digit_entity');  // Updated API to load a brick from a path
  final generator = await MasonGenerator.fromBrick(brick);

  // Specify the path where you want the code to be generated
  final customTargetDirectory = Directory('lib');

  // Set the target directory for code generation
  final target = DirectoryGeneratorTarget(customTargetDirectory);

  // Define variables to pass into Mason template
  final vars = {
    "name": name,
    "isEnum": false,
    "attributes": attributes
  };

  print(target);

  // Run the generator with the variables
  await generator.generate(target, vars: vars);
}
