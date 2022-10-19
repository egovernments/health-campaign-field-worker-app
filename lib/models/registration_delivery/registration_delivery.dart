// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_delivery.freezed.dart';
part 'registration_delivery.g.dart';

@freezed
class RegistrationDeliveryMapperModel with _$RegistrationDeliveryMapperModel {
  const RegistrationDeliveryMapperModel._();

  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory RegistrationDeliveryMapperModel({
    String? administrativeArea,
    String? houseNumber,
    String? locality,
    String? landmark,
    String? latlng,
    DateTime? dateOfRegistration,
    int? numberOfMembers,
    String? nameOfIndividual,
    bool? isHeadOfFamily,
    String? idType,
    String? idNumber,
    String? dateOfBirth,
    String? gender,
    String? phone,
    num? numberDistributed,
    String? reasonIfNotDelivered,
  }) = _RegistrationDeliveryMapperModel;

  factory RegistrationDeliveryMapperModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDeliveryMapperModelFromJson(json);

  RegistrationDeliveryMapperModel merge(RegistrationDeliveryMapperModel model) {
    return copyWith(
      administrativeArea: model.administrativeArea ?? administrativeArea,
      houseNumber: model.houseNumber ?? houseNumber,
      locality: model.locality ?? locality,
      landmark: model.landmark ?? landmark,
      latlng: model.latlng ?? latlng,
      dateOfRegistration: model.dateOfRegistration ?? dateOfRegistration,
      numberOfMembers: model.numberOfMembers ?? numberOfMembers,
      nameOfIndividual: model.nameOfIndividual ?? nameOfIndividual,
      isHeadOfFamily: model.isHeadOfFamily ?? isHeadOfFamily,
      idType: model.idType ?? idType,
      idNumber: model.idNumber ?? idNumber,
      dateOfBirth: model.dateOfBirth ?? dateOfBirth,
      gender: model.gender ?? gender,
      phone: model.phone ?? phone,
      numberDistributed: model.numberDistributed ?? numberDistributed,
      reasonIfNotDelivered: model.reasonIfNotDelivered ?? reasonIfNotDelivered,
    );
  }
}
