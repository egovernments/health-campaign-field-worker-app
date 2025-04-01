import 'package:survey_form/survey_form.dart';
import 'package:complaints/complaints.dart';
import 'package:attendance_management/attendance_management.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:digit_data_model/data/local_store/no_sql/schema/entity_mapper_listener.dart';
import 'package:digit_data_model/data_model.dart';

/// The `EntityMapper` class extends `EntityMapperListener` and provides a concrete implementation
/// for the `getEntityMappers` method. This method is responsible for mapping a given entity type
/// to its corresponding entity model.
class EntityMapper extends EntityMapperListener {
  /// The `getEntityMappers` method takes two parameters:
  /// - `entityType`: A string that represents the type of the entity.
  /// - `entityString`: A string representation of the entity itself.
  ///
  /// The method uses a switch statement to determine the type of the entity and then calls the
  /// appropriate mapper's `fromJson` method to convert the `entityString` into the corresponding
  /// entity model.
  ///
  /// If the `entityType` does not match any of the predefined types, it defaults to using the
  /// `EntityModelMapper.fromJson` method.
  @override
  EntityModel getEntityMappers(String entityType, String entityString) {
    switch (entityType) {
      case "individual":
        final entity = IndividualModelMapper.fromJson(entityString);
        return entity;

      case "household":
        final entity = HouseholdModelMapper.fromJson(entityString);
        return entity;

      case "householdMember":
        final entity = HouseholdMemberModelMapper.fromJson(entityString);
        return entity;

      case "projectBeneficiary":
        final entity = ProjectBeneficiaryModelMapper.fromJson(entityString);
        return entity;

      case "task":
        final entity = TaskModelMapper.fromJson(entityString);
        return entity;

      case "sideEffect":
        final entity = SideEffectModelMapper.fromJson(entityString);
        return entity;

      case "referral":
        final entity = ReferralModelMapper.fromJson(entityString);
        return entity;

      case "stock":
        final entity = StockModelMapper.fromJson(entityString);
        return entity;

      case "stockReconciliation":
        final entity = StockReconciliationModelMapper.fromJson(entityString);
        return entity;

      case "attendance":
        final entity = AttendanceLogModelMapper.fromJson(entityString);
        return entity;

      case "complaints":
        final entity = PgrServiceModelMapper.fromJson(entityString);
        return entity;

      case "service":
        final entity = ServiceModelMapper.fromJson(entityString);
        return entity;

      default:
        final entity = EntityModelMapper.fromJson(entityString);
        return entity;
    }
  }
}
