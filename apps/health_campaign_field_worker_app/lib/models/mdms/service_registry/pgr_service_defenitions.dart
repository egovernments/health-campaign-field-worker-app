import 'package:freezed_annotation/freezed_annotation.dart';

part 'pgr_service_defenitions.freezed.dart';

part 'pgr_service_defenitions.g.dart';

@freezed
abstract class PGRServiceDefinitions with _$PGRServiceDefinitions {
  const factory PGRServiceDefinitions({
    @JsonKey(name: 'RAINMAKER-PGR')
        final ServiceDefinitionWrapper? serviceDefinitionWrapper,
  }) = _PGRServiceDefinitions;

  factory PGRServiceDefinitions.fromJson(Map<String, dynamic> json) =>
      _$PGRServiceDefinitionsFromJson(json);
}

@freezed
abstract class ServiceDefinitionWrapper with _$ServiceDefinitionWrapper {
  const factory ServiceDefinitionWrapper({
    @JsonKey(name: "ServiceDefs")
    @Default([])
        final List<Definition> definition,
  }) = _ServiceDefinitionWrapper;

  factory ServiceDefinitionWrapper.fromJson(Map<String, dynamic> json) =>
      _$ServiceDefinitionWrapperFromJson(json);
}

@freezed
abstract class Definition with _$Definition {
  const factory Definition({
    required String serviceCode,
    required String name,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}
