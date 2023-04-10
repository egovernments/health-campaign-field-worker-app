import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaints.g.dart';

part 'complaints.freezed.dart';

@freezed
class ComplaintsDetailsModel with _$ComplaintsDetailsModel {
  const factory ComplaintsDetailsModel({
    String? id,
    DateTime? dateOfComplaint,
    String? administrativeArea,
    String? complaintRaisedFor,
    String? complainantName,
    String? complainantContactNumber,
    String? supervisorName,
    String? supervisorContactNumber,
    String? complaintDescription,
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
