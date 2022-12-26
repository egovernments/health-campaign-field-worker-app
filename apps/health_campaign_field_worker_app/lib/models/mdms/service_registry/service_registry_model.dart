// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_registry_model.freezed.dart';
part 'service_registry_model.g.dart';

@freezed
class ServiceRegistryPrimaryWrapperModel
    with _$ServiceRegistryPrimaryWrapperModel {
  const factory ServiceRegistryPrimaryWrapperModel({
    @JsonKey(name: 'HCM-SERVICE-REGISTRY')
        final ServiceRegistrySecondaryWrapperModel? serviceRegitry,
  }) = _ServiceRegistryPrimaryWrapperModel;

  factory ServiceRegistryPrimaryWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ServiceRegistryPrimaryWrapperModelFromJson(json);
}

@freezed
class ServiceRegistrySecondaryWrapperModel
    with _$ServiceRegistrySecondaryWrapperModel {
  const factory ServiceRegistrySecondaryWrapperModel({
    @JsonKey(name: 'serviceRegistry')
        List<ServiceRegistryModel>? serviceRegistrylist,
  }) = _ServiceRegistrySecondaryWrapperModel;

  factory ServiceRegistrySecondaryWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ServiceRegistrySecondaryWrapperModelFromJson(json);
}

@freezed
class ServiceRegistryModel with _$ServiceRegistryModel {
  const factory ServiceRegistryModel({
    final String? service,
    final List<ActionsModel>? actions,
  }) = _ServiceRegistryModel;

  factory ServiceRegistryModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRegistryModelFromJson(json);
}

@freezed
class ActionsModel with _$ActionsModel {
  const factory ActionsModel({
    final String? create,
    final String? update,
    final String? login,
    final String? search,
  }) = _ActionsModel;

  factory ActionsModel.fromJson(Map<String, dynamic> json) =>
      _$ActionsModelFromJson(json);
}
