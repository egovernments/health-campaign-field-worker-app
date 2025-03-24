import 'dart:io';

import 'package:digit_data_model/utils/entity_creation/models.dart';
import 'package:mason/mason.dart';

import 'post_gen.dart';
import 'pre_gen.dart';

class MasonEntityGenerator {
  // Function to run Mason template with provided JSON configuration
  Future<void> generateEntity(String jsonString) async {
    ConfigModelMapper.ensureInitialized();
    AttributeModelMapper.ensureInitialized();
    EnumValuesMapper.ensureInitialized();
    TableReferenceModelMapper.ensureInitialized();

    ConfigModel configModel = ConfigModelMapper.fromJson(jsonString);

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
        '../lib/data/local_store/sql_store/tables/${configModel.name.toString().snakeCase}.dart');

    if (!await file.exists()) {
      // Load the Mason brick for entity generation
      final brick = Brick.path("digit_entity"); // Path to the Mason brick
      final generator = await MasonGenerator.fromBrick(brick);

      // Specify the path where the code should be generated
      final customTargetDirectory = Directory("../lib");

      // Set the target directory for code generation
      final target = DirectoryGeneratorTarget(customTargetDirectory);

      PreGen preGen = PreGen();
      print('📌 Before PreGen: ' + configModel.toMap().toString());

      var vars = preGen.run(configModel);

      print("📌 Vars passed to Mason: $vars");

      // Run the generator with the variables
      await generator.generate(target, vars: vars.toMap());

      Directory.current = '../lib';

      Postgen postGen = Postgen();
      print('📌 Before Postgen: ' + vars.toString());

      postGen.run(vars);
      print("✅ After PostGen, sqlAttributes: ${vars.sqlAttributes}");

      print(file.readAsStringSync());
    } else {
      print("Table with the name ${configModel.name} already exists");
    }
  }
}
