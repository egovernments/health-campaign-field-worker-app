import 'package:dart_mappable/dart_mappable.dart';
import 'name.dart';

class NameModelConverter extends MapperBase<NameModel>{
  const NameModelConverter();

  @override
  NameModel fromMap(Map<String, dynamic> map) {
    return NameModel(
      id: map['id'] as String?,
      individualClientReferenceId: map['individualClientReferenceId'] as String?,
      givenName: map['givenName'] as String?,
      familyName: map['familyName'] as String?,
      otherNames: map['otherNames'] as String?,
      nonRecoverableError: map['nonRecoverableError'] as bool?,
      tenantId: map['tenantId'] as String?,
      rowVersion: map['rowVersion'] as int?,
      additionalFields: map['additionalFields'] as NameAdditionalFields?,
    );
  }

  @override
  Map<String, dynamic> toMap(NameModel instance) {
    return <String, dynamic>{
      'id': instance.id,
      'individualClientReferenceId': instance.individualClientReferenceId,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'otherNames': instance.otherNames,
      'nonRecoverableError': instance.nonRecoverableError,
      'tenantId': instance.tenantId,
      'rowVersion': instance.rowVersion,
      'additionalFields': instance.additionalFields,
    };
  }

  @override
  NameModel? fromMapList(List<dynamic>? list) {
    if (list == null) {
      return null;
    }

    return NameModel(
      id: list[0] as String?,
      individualClientReferenceId: list[1] as String?,
      givenName: list[2] as String?,
      familyName: list[3] as String?,
      otherNames: list[4] as String?,
      nonRecoverableError: list[5] as bool?,
      tenantId: list[6] as String?,
      rowVersion: list[7] as int?,
      additionalFields: list[8] as NameAdditionalFields?,
    );
  }

  @override
  List<dynamic>? toMapList(NameModel? instance) {
    if (instance == null) {
      return null;
    }

    return <dynamic>[
      instance.id,
      instance.individualClientReferenceId,
      instance.givenName,
      instance.familyName,
      instance.otherNames,
      instance.nonRecoverableError,
      instance.tenantId,
      instance.rowVersion,
      instance.additionalFields,
    ];
  }

  @override
  NameModel? fromMapAsIs(Map<String, dynamic> map) {
    return NameModel(
      id: map['id'] as String?,
      individualClientReferenceId: map['individualClientReferenceId'] as String?,
      givenName: map['givenName'] as String?,
      familyName: map['familyName'] as String?,
      otherNames: map['otherNames'] as String?,
      nonRecoverableError: map['nonRecoverableError'] as bool?,
      tenantId: map['tenantId'] as String?,
      rowVersion: map['rowVersion'] as int?,
      additionalFields: map['additionalFields'] as NameAdditionalFields?,
    );
  }

  @override
  Map<String, dynamic> toMapAsIs(NameModel? instance) {
    if (instance == null) {
      return <String, dynamic>{};
    }

    return <String, dynamic>{
      'id': instance.id,
      'individualClientReferenceId': instance.individualClientReferenceId,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'otherNames': instance.otherNames,
      'nonRecoverableError': instance.nonRecoverableError,
      'tenantId': instance.tenantId,
      'rowVersion': instance.rowVersion,
      'additionalFields': instance.additionalFields,
    };
  }
}