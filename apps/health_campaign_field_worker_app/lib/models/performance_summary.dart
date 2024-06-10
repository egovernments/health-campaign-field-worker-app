import 'data_model.dart';

class PerformanceSummary extends EntityModel {
  int individualCount;
  int householdCount;
  int taskCount;

  PerformanceSummary({
    required this.individualCount,
    required this.householdCount,
    required this.taskCount,
  }) : super();

  @override
  // TODO: implement copyWith
  EntityModelCopyWith<EntityModel, EntityModel, EntityModel> get copyWith =>
      throw UnimplementedError();

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
