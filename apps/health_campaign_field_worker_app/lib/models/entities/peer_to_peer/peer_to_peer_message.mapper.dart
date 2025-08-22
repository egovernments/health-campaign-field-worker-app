// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'peer_to_peer_message.dart';

class PeerToPeerMessageModelMapper
    extends ClassMapperBase<PeerToPeerMessageModel> {
  PeerToPeerMessageModelMapper._();

  static PeerToPeerMessageModelMapper? _instance;
  static PeerToPeerMessageModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PeerToPeerMessageModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PeerToPeerMessageModel';

  static String _$messageType(PeerToPeerMessageModel v) => v.messageType;
  static const Field<PeerToPeerMessageModel, String> _f$messageType =
      Field('messageType', _$messageType);
  static String? _$confirmationType(PeerToPeerMessageModel v) =>
      v.confirmationType;
  static const Field<PeerToPeerMessageModel, String> _f$confirmationType =
      Field('confirmationType', _$confirmationType, opt: true);
  static String? _$status(PeerToPeerMessageModel v) => v.status;
  static const Field<PeerToPeerMessageModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String _$message(PeerToPeerMessageModel v) => v.message;
  static const Field<PeerToPeerMessageModel, String> _f$message =
      Field('message', _$message);
  static String? _$selectedBoundaryCode(PeerToPeerMessageModel v) =>
      v.selectedBoundaryCode;
  static const Field<PeerToPeerMessageModel, String> _f$selectedBoundaryCode =
      Field('selectedBoundaryCode', _$selectedBoundaryCode, opt: true);
  static int? _$offset(PeerToPeerMessageModel v) => v.offset;
  static const Field<PeerToPeerMessageModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$totalCount(PeerToPeerMessageModel v) => v.totalCount;
  static const Field<PeerToPeerMessageModel, int> _f$totalCount =
      Field('totalCount', _$totalCount, opt: true);
  static double? _$progress(PeerToPeerMessageModel v) => v.progress;
  static const Field<PeerToPeerMessageModel, double> _f$progress =
      Field('progress', _$progress, opt: true);

  @override
  final MappableFields<PeerToPeerMessageModel> fields = const {
    #messageType: _f$messageType,
    #confirmationType: _f$confirmationType,
    #status: _f$status,
    #message: _f$message,
    #selectedBoundaryCode: _f$selectedBoundaryCode,
    #offset: _f$offset,
    #totalCount: _f$totalCount,
    #progress: _f$progress,
  };
  @override
  final bool ignoreNull = true;

  static PeerToPeerMessageModel _instantiate(DecodingData data) {
    return PeerToPeerMessageModel(
        messageType: data.dec(_f$messageType),
        confirmationType: data.dec(_f$confirmationType),
        status: data.dec(_f$status),
        message: data.dec(_f$message),
        selectedBoundaryCode: data.dec(_f$selectedBoundaryCode),
        offset: data.dec(_f$offset),
        totalCount: data.dec(_f$totalCount),
        progress: data.dec(_f$progress));
  }

  @override
  final Function instantiate = _instantiate;

  static PeerToPeerMessageModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PeerToPeerMessageModel>(map);
  }

  static PeerToPeerMessageModel fromJson(String json) {
    return ensureInitialized().decodeJson<PeerToPeerMessageModel>(json);
  }
}

mixin PeerToPeerMessageModelMappable {
  String toJson() {
    return PeerToPeerMessageModelMapper.ensureInitialized()
        .encodeJson<PeerToPeerMessageModel>(this as PeerToPeerMessageModel);
  }

  Map<String, dynamic> toMap() {
    return PeerToPeerMessageModelMapper.ensureInitialized()
        .encodeMap<PeerToPeerMessageModel>(this as PeerToPeerMessageModel);
  }

  PeerToPeerMessageModelCopyWith<PeerToPeerMessageModel, PeerToPeerMessageModel,
          PeerToPeerMessageModel>
      get copyWith => _PeerToPeerMessageModelCopyWithImpl(
          this as PeerToPeerMessageModel, $identity, $identity);
  @override
  String toString() {
    return PeerToPeerMessageModelMapper.ensureInitialized()
        .stringifyValue(this as PeerToPeerMessageModel);
  }

  @override
  bool operator ==(Object other) {
    return PeerToPeerMessageModelMapper.ensureInitialized()
        .equalsValue(this as PeerToPeerMessageModel, other);
  }

  @override
  int get hashCode {
    return PeerToPeerMessageModelMapper.ensureInitialized()
        .hashValue(this as PeerToPeerMessageModel);
  }
}

extension PeerToPeerMessageModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PeerToPeerMessageModel, $Out> {
  PeerToPeerMessageModelCopyWith<$R, PeerToPeerMessageModel, $Out>
      get $asPeerToPeerMessageModel =>
          $base.as((v, t, t2) => _PeerToPeerMessageModelCopyWithImpl(v, t, t2));
}

abstract class PeerToPeerMessageModelCopyWith<
    $R,
    $In extends PeerToPeerMessageModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? messageType,
      String? confirmationType,
      String? status,
      String? message,
      String? selectedBoundaryCode,
      int? offset,
      int? totalCount,
      double? progress});
  PeerToPeerMessageModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PeerToPeerMessageModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PeerToPeerMessageModel, $Out>
    implements
        PeerToPeerMessageModelCopyWith<$R, PeerToPeerMessageModel, $Out> {
  _PeerToPeerMessageModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PeerToPeerMessageModel> $mapper =
      PeerToPeerMessageModelMapper.ensureInitialized();
  @override
  $R call(
          {String? messageType,
          Object? confirmationType = $none,
          Object? status = $none,
          String? message,
          Object? selectedBoundaryCode = $none,
          Object? offset = $none,
          Object? totalCount = $none,
          Object? progress = $none}) =>
      $apply(FieldCopyWithData({
        if (messageType != null) #messageType: messageType,
        if (confirmationType != $none) #confirmationType: confirmationType,
        if (status != $none) #status: status,
        if (message != null) #message: message,
        if (selectedBoundaryCode != $none)
          #selectedBoundaryCode: selectedBoundaryCode,
        if (offset != $none) #offset: offset,
        if (totalCount != $none) #totalCount: totalCount,
        if (progress != $none) #progress: progress
      }));
  @override
  PeerToPeerMessageModel $make(CopyWithData data) => PeerToPeerMessageModel(
      messageType: data.get(#messageType, or: $value.messageType),
      confirmationType:
          data.get(#confirmationType, or: $value.confirmationType),
      status: data.get(#status, or: $value.status),
      message: data.get(#message, or: $value.message),
      selectedBoundaryCode:
          data.get(#selectedBoundaryCode, or: $value.selectedBoundaryCode),
      offset: data.get(#offset, or: $value.offset),
      totalCount: data.get(#totalCount, or: $value.totalCount),
      progress: data.get(#progress, or: $value.progress));

  @override
  PeerToPeerMessageModelCopyWith<$R2, PeerToPeerMessageModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PeerToPeerMessageModelCopyWithImpl($value, $cast, t);
}
