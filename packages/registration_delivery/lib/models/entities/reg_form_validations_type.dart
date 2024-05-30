// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'reg_form_validations_type.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum RegFormValidations {
  @MappableValue("required")
  required,
  @MappableValue("min")
  min,
  @MappableValue("max")
  max,
  @MappableValue("maxLength")
  maxLength,
  @MappableValue("minLength")
  minLength,
}
