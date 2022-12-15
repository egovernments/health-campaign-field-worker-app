import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.alert('{{name}}');
  context.logger.info('Creating {{name}}!');
}