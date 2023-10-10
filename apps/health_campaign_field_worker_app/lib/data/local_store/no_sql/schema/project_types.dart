import 'package:isar/isar.dart';

part 'project_types.g.dart';

@Collection()
class ProjectTypeListCycle {
  Id id = Isar.autoIncrement;

  @Name("projectTypeId")
  late String projectTypeId;

  @Name("name")
  late String name;

  @Name("code")
  late String code;

  @Name("group")
  late String group;

  @Name("beneficiaryType")
  late String beneficiaryType;

  @Name("observationStrategy")
  String? observationStrategy;

  @Name("resources")
  List<ProductVariants>? resources;

  @Name("cycles")
  List<Cycles>? cycles;
}

@embedded
class Cycles {
  String? mandatoryWaitSinceLastCycleInDays;
  int? startDate;
  int? endDate;
  int? id;
  List<Deliveries>? deliveries;
}

@embedded
class Deliveries {
  @Name("doseCriteria")
  List<DoseCriteria>? doseCriteriaModel;
  @Name("mandatoryWaitSinceLastDeliveryInDays")
  String? mandatoryWaitSinceLastDeliveryInDays;
  @Name("deliveryStrategy")
  String? deliveryStrategy;
}

@embedded
class DoseCriteria {
  @Name("condition")
  String? condition;
  @Name("ProductVariants")
  List<ProductVariants>? productVariants;
}

@embedded
class ProductVariants {
  String? productVariantId;
  String? quantity;
}
