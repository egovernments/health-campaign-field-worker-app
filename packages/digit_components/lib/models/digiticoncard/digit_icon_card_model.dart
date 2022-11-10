// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'digit_icon_card_model.freezed.dart';

@freezed
class DigitIconCardWrapperModel with _$DigitIconCardWrapperModel {
  const factory DigitIconCardWrapperModel({
    @Default([]) List<DigitIconCardModel> digitIconCards,
  }) = _DigitIconCardWrapperModel;
}

@freezed
class DigitIconCardModel with _$DigitIconCardModel {
  const factory DigitIconCardModel({
    required String title,
    required String subtitle,
    required String widgetKey,
    VoidCallback? callback,
    required int icon,
  }) = _DigitIconCardModel;
}
