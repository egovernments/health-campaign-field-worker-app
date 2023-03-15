import 'package:isar/isar.dart';

part 'app_configuration.g.dart';

@Collection()
class AppConfiguration {
  Id id = Isar.autoIncrement;

  @Name("NETWORK_DETECTION")
  late String? networkDetection;

  @Name("PERSISTENCE_MODE")
  late String? persistenceMode;

  @Name("SYNC_METHOD")
  late String? syncMethod;

  @Name("SYNC_TRIGGER")
  late String? syncTrigger;

  @Name("LANGUAGES")
  late List<Languages>? languages;

  @Name("BACKEND_INTERFACE")
  late BackendInterface? backendInterface;

  @Name('GENDER_OPTIONS_POPULATOR')
  late List<GenderOptions>? genderOptions;

  @Name('CHECKLIST_TYPES')
  late List<ChecklistTypes>? checklistTypes;

  @Name('ID_TYPE_OPTIONS_POPULATOR')
  late List<IdTypeOptions>? idTypeOptions;

  @Name('DELIVERY_COMMENT_OPTIONS_POPULATOR')
  late List<DeliveryCommentOptions>? deliveryCommentOptions;

  @Name("TENANT_ID")
  late String? tenantId;
}

@embedded
class Languages {
  late String label;
  late String value;
}

@embedded
class BackendInterface {
  @Name("interfaces")
  late List<Interfaces> interfaces;
}

@embedded
class GenderOptions {
  late String name;
  late String code;
}

@embedded
class IdTypeOptions {
  late String name;
  late String code;
}

@embedded
class DeliveryCommentOptions {
  late String name;
  late String code;
}

@embedded
class Interfaces {
  late String type;
  late String name;
  late Config confg;
}

@embedded
class Config {
  late int localStoreTTL;
}

@embedded
class ChecklistTypes {
  late String name;
  late String code;
}
