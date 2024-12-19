// Importing the necessary packages
import 'package:freezed_annotation/freezed_annotation.dart';

// Part statements are used in Dart to create libraries that can spread over several files
part 'bandwidth_model.freezed.dart';
part 'bandwidth_model.g.dart';

// The @freezed annotation marks this class as immutable and generates the necessary code
@freezed
// BandwidthModel class with a mixin of _$BandwidthModel
class BandwidthModel with _$BandwidthModel {
  // Factory constructor for creating a new BandwidthModel instance
  // The required keyword means that the parameter is mandatory
  const factory BandwidthModel({
    required String userId,
    required int batchSize,
  }) = _BandwidthModel;

  // Factory constructor for creating a new BandwidthModel instance from a JSON map
  factory BandwidthModel.fromJson(Map<String, dynamic> json) =>
      _$BandwidthModelFromJson(json);
}
