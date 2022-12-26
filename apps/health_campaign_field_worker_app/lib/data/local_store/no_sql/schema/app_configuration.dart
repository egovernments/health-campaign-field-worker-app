import 'package:isar/isar.dart';

part 'app_configuration.g.dart';

@Collection()
class AppConiguration {
  Id id = Isar.autoIncrement;

  @Name("NETWORK_DETECTION")
  late String networkDetection;

  @Name("PERSISTENCE_MODE")
  late String persistenceMode;

  @Name("SYNC_METHOD")
  late String syncMethod;

  @Name("SYNC_TRIGGER")
  late String syncTrigger;

  @Name("LANGUAGES")
  late List<Languages> languages;

  @Name("LOCALIZATION_MODULES")
  late List<LocalizationModules> localizationModules;
}

@embedded
class Languages {
  late String label;
  late String value;
}

@embedded
class LocalizationModules {
  late String label;
  late String value;
}
