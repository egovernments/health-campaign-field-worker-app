import 'package:hooks/models.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final logger = context.logger;
  final variables = context.vars;

  final model = Mapper.fromMap<ConfigModel>(variables);
  logger.info(model.toJson());
  context.vars = model.toMap();
}
