// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roles_model.freezed.dart';
part 'roles_model.g.dart';

@freezed
class RolesWrapperModel with _$RolesWrapperModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory RolesWrapperModel({
    required String tenantId,
    required String moduleName,
    @Default([]) List<RolesModel> roles,
  }) = _RolesWrapperModel;

  factory RolesWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$RolesWrapperModelFromJson(json);
}

@freezed
class RolesModel with _$RolesModel {
  @JsonSerializable(explicitToJson: true)
  const factory RolesModel({
    required Code code,
    required String name,
    String? description,
  }) = _RolesModel;

  factory RolesModel.fromJson(Map<String, dynamic> json) =>
      _$RolesModelFromJson(json);
}

enum Code {
  @JsonValue('EMPLOYEE')
  employee,
}
