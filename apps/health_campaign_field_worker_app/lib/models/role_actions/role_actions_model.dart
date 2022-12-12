// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_actions_model.freezed.dart';
part 'role_actions_model.g.dart';

@freezed
class RoleActionsWrapperModel with _$RoleActionsWrapperModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory RoleActionsWrapperModel({
    required String tenantId,
    required String moduleName,
    @JsonKey(name: 'roleactions')
    @Default([])
        List<RoleActionsModel> roleActions,
  }) = _RoleActionsWrapperModel;

  factory RoleActionsWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$RoleActionsWrapperModelFromJson(json);
}

@freezed
class RoleActionsModel with _$RoleActionsModel {
  @JsonSerializable(explicitToJson: true)
  const factory RoleActionsModel({
    @JsonKey(name: 'rolecode') required RoleCode roleCode,
    @JsonKey(name: 'actioncode') required String actionCode,
    @JsonKey(name: 'actionid') required int actionId,
    required String tenantId,
  }) = _RoleActionsModel;

  factory RoleActionsModel.fromJson(Map<String, dynamic> json) =>
      _$RoleActionsModelFromJson(json);
}

enum RoleCode {
  @JsonValue('EMPLOYEE')
  employee,
}
