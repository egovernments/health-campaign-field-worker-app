import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaints.freezed.dart';
part 'complaints.g.dart';

@freezed
class ComplaintsDetailsModel with _$ComplaintsDetailsModel {
  const factory ComplaintsDetailsModel({
    required DateTime dateOfComplaint,
    required String administrativeArea,
    required String complaintRaisedFor,
    required String complainantName,
    required String complainantContactNumber,
    required String complaintDescription,
    String? supervisorName,
    String? supervisorContactNumber,
  }) = _ComplaintsDetailsModel;

  factory ComplaintsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ComplaintsDetailsModelFromJson(json);
}

@freezed
class ComplaintsInboxItem with _$ComplaintsInboxItem {
  const factory ComplaintsInboxItem({
    String? complaintNumber,
    String? complaintType,
    String? dateOfComplaint,
    String? area,
    String? status,
    String? complaintRaisedBy,
  }) = _ComplaintsInboxItem;

  factory ComplaintsInboxItem.fromJson(Map<String, dynamic> json) =>
      _$ComplaintsInboxItemFromJson(json);
}
