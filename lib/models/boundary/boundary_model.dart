import 'package:freezed_annotation/freezed_annotation.dart';

part 'boundary_model.freezed.dart';
part 'boundary_model.g.dart';

@freezed
class BoundaryModel with _$BoundaryModel {
  const factory BoundaryModel({
    required String code,
    required String name,
    required String label,
    required String latitude,
    required String longitude,
    required String area,
    required int boundaryNum,
    List? children,
  }) = _BoundaryModel;
  factory BoundaryModel.fromJson(Map<String, dynamic> json) =>
      _$BoundaryModelFromJson(json);
}
