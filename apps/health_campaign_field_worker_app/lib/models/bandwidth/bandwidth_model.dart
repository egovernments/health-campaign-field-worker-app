import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bandwidth_model.freezed.dart';
part 'bandwidth_model.g.dart';

@freezed
class BandwidthModel with _$BandwidthModel {
  const factory BandwidthModel({
    required String userId,
    required int batchSize,
  }) = _BandwidthModel;

  factory BandwidthModel.fromJson(Map<String, dynamic> json) =>
      _$BandwidthModelFromJson(json);
}
