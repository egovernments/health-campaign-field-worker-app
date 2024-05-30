import 'package:freezed_annotation/freezed_annotation.dart';

part 'beneficiary_statistics_model.freezed.dart';

@freezed
class BeneficiaryStatisticsWrapperModel
    with _$BeneficiaryStatisticsWrapperModel {
  const factory BeneficiaryStatisticsWrapperModel({
    required List<BeneficiaryStatisticsModel> beneficiaryStatisticsList,
  }) = _BeneficiaryStatisticsWrapperModel;
}

@freezed
class BeneficiaryStatisticsModel with _$BeneficiaryStatisticsModel {
  const factory BeneficiaryStatisticsModel({
    required String title,
    required String content,
  }) = _BeneficiaryStatisticsModel;
}
