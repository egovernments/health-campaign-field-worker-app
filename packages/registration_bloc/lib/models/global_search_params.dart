import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:digit_data_model/models/entities/household_type.dart';

part 'global_search_params.freezed.dart';
part 'global_search_params.g.dart';
@freezed
class GlobalSearchParameters with _$GlobalSearchParameters {
  const factory GlobalSearchParameters({
    String? householdClientReferenceId,
    bool? isProximityEnabled,
    double? latitude,
    double? longitude,
    double? maxRadius,
    String? projectId,
    String? nameSearch,
    int? offset,
    int? limit,
    List<String>? filter,
    int? totalCount,
    HouseholdType? householdType,
  }) = _GlobalSearchParameters;

  factory GlobalSearchParameters.fromJson(Map<String, dynamic> json) =>
      _$GlobalSearchParametersFromJson(json);
}
