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
    @Default([]) List<RoleActionsModel> roleactions,
  }) = _RoleActionsWrapperModel;

  factory RoleActionsWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$RoleActionsWrapperModelFromJson(json);
}

@freezed
class RoleActionsModel with _$RoleActionsModel {
  @JsonSerializable(explicitToJson: true)
  const factory RoleActionsModel({
    required String rolecode,
    required String actioncode,
    required int actionid,
    required String tenantId,
  }) = _RoleActionsModel;

  factory RoleActionsModel.fromJson(Map<String, dynamic> json) =>
      _$RoleActionsModelFromJson(json);
}
