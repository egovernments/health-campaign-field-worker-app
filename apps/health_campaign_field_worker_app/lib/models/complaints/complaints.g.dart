// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplaintsDetailsModelImpl _$$ComplaintsDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplaintsDetailsModelImpl(
      dateOfComplaint: DateTime.parse(json['dateOfComplaint'] as String),
      administrativeArea: json['administrativeArea'] as String,
      complaintRaisedFor: json['complaintRaisedFor'] as String,
      complainantName: json['complainantName'] as String,
      complainantContactNumber: json['complainantContactNumber'] as String,
      complaintDescription: json['complaintDescription'] as String,
      supervisorName: json['supervisorName'] as String?,
      supervisorContactNumber: json['supervisorContactNumber'] as String?,
    );

Map<String, dynamic> _$$ComplaintsDetailsModelImplToJson(
        _$ComplaintsDetailsModelImpl instance) =>
    <String, dynamic>{
      'dateOfComplaint': instance.dateOfComplaint.toIso8601String(),
      'administrativeArea': instance.administrativeArea,
      'complaintRaisedFor': instance.complaintRaisedFor,
      'complainantName': instance.complainantName,
      'complainantContactNumber': instance.complainantContactNumber,
      'complaintDescription': instance.complaintDescription,
      'supervisorName': instance.supervisorName,
      'supervisorContactNumber': instance.supervisorContactNumber,
    };

_$ComplaintsInboxItemImpl _$$ComplaintsInboxItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplaintsInboxItemImpl(
      complaintNumber: json['complaintNumber'] as String?,
      complaintType: json['complaintType'] as String?,
      dateOfComplaint: json['dateOfComplaint'] as String?,
      area: json['area'] as String?,
      status: json['status'] as String?,
      complaintRaisedBy: json['complaintRaisedBy'] as String?,
    );

Map<String, dynamic> _$$ComplaintsInboxItemImplToJson(
        _$ComplaintsInboxItemImpl instance) =>
    <String, dynamic>{
      'complaintNumber': instance.complaintNumber,
      'complaintType': instance.complaintType,
      'dateOfComplaint': instance.dateOfComplaint,
      'area': instance.area,
      'status': instance.status,
      'complaintRaisedBy': instance.complaintRaisedBy,
    };
