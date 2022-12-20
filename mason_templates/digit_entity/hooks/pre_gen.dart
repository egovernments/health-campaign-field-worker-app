import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

import 'models/models.dart';

void run(HookContext context) async {
  final logger = context.logger;
  final variables = context.vars;

  final attributes = variables['attributes'];
  final customAttributes = variables['customAttributes'];
  final dateTimeAttributes = variables['dateTimeAttributes'];

  logger.info(attributes.toString());
  ConfigModel(name: '');
}