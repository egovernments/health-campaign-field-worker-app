// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'inventory_facility.dart';

class InventoryFacilitySearchModelMapper
    extends ClassMapperBase<InventoryFacilitySearchModel> {
  InventoryFacilitySearchModelMapper._();

  static InventoryFacilitySearchModelMapper? _instance;
  static InventoryFacilitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = InventoryFacilitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'InventoryFacilitySearchModel';

  static List<String>? _$id(InventoryFacilitySearchModel v) => v.id;
  static const Field<InventoryFacilitySearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static bool? _$isPermanent(InventoryFacilitySearchModel v) => v.isPermanent;
  static const Field<InventoryFacilitySearchModel, bool> _f$isPermanent =
      Field('isPermanent', _$isPermanent, opt: true);
  static String? _$usage(InventoryFacilitySearchModel v) => v.usage;
  static const Field<InventoryFacilitySearchModel, String> _f$usage =
      Field('usage', _$usage, opt: true);
  static int? _$storageCapacity(InventoryFacilitySearchModel v) =>
      v.storageCapacity;
  static const Field<InventoryFacilitySearchModel, int> _f$storageCapacity =
      Field('storageCapacity', _$storageCapacity, opt: true);
  static String? _$tenantId(InventoryFacilitySearchModel v) => v.tenantId;
  static const Field<InventoryFacilitySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<InventoryFacilitySearchModel> fields = const {
    #id: _f$id,
    #isPermanent: _f$isPermanent,
    #usage: _f$usage,
    #storageCapacity: _f$storageCapacity,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static InventoryFacilitySearchModel _instantiate(DecodingData data) {
    return InventoryFacilitySearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        isPermanent: data.dec(_f$isPermanent),
        usage: data.dec(_f$usage),
        storageCapacity: data.dec(_f$storageCapacity),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static InventoryFacilitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InventoryFacilitySearchModel>(map);
  }

  static InventoryFacilitySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<InventoryFacilitySearchModel>(json);
  }
}

mixin InventoryFacilitySearchModelMappable {
  String toJson() {
    return InventoryFacilitySearchModelMapper.ensureInitialized()
        .encodeJson<InventoryFacilitySearchModel>(
            this as InventoryFacilitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return InventoryFacilitySearchModelMapper.ensureInitialized()
        .encodeMap<InventoryFacilitySearchModel>(
            this as InventoryFacilitySearchModel);
  }

  InventoryFacilitySearchModelCopyWith<InventoryFacilitySearchModel,
          InventoryFacilitySearchModel, InventoryFacilitySearchModel>
      get copyWith => _InventoryFacilitySearchModelCopyWithImpl(
          this as InventoryFacilitySearchModel, $identity, $identity);
  @override
  String toString() {
    return InventoryFacilitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as InventoryFacilitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            InventoryFacilitySearchModelMapper.ensureInitialized()
                .isValueEqual(this as InventoryFacilitySearchModel, other));
  }

  @override
  int get hashCode {
    return InventoryFacilitySearchModelMapper.ensureInitialized()
        .hashValue(this as InventoryFacilitySearchModel);
  }
}

extension InventoryFacilitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InventoryFacilitySearchModel, $Out> {
  InventoryFacilitySearchModelCopyWith<$R, InventoryFacilitySearchModel, $Out>
      get $asInventoryFacilitySearchModel => $base.as(
          (v, t, t2) => _InventoryFacilitySearchModelCopyWithImpl(v, t, t2));
}

abstract class InventoryFacilitySearchModelCopyWith<
    $R,
    $In extends InventoryFacilitySearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  $R call(
      {List<String>? id,
      bool? isPermanent,
      String? usage,
      int? storageCapacity,
      String? tenantId});
  InventoryFacilitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _InventoryFacilitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InventoryFacilitySearchModel, $Out>
    implements
        InventoryFacilitySearchModelCopyWith<$R, InventoryFacilitySearchModel,
            $Out> {
  _InventoryFacilitySearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InventoryFacilitySearchModel> $mapper =
      InventoryFacilitySearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? isPermanent = $none,
          Object? usage = $none,
          Object? storageCapacity = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (isPermanent != $none) #isPermanent: isPermanent,
        if (usage != $none) #usage: usage,
        if (storageCapacity != $none) #storageCapacity: storageCapacity,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  InventoryFacilitySearchModel $make(CopyWithData data) =>
      InventoryFacilitySearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          isPermanent: data.get(#isPermanent, or: $value.isPermanent),
          usage: data.get(#usage, or: $value.usage),
          storageCapacity:
              data.get(#storageCapacity, or: $value.storageCapacity),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  InventoryFacilitySearchModelCopyWith<$R2, InventoryFacilitySearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _InventoryFacilitySearchModelCopyWithImpl($value, $cast, t);
}

class InventoryFacilityModelMapper
    extends ClassMapperBase<InventoryFacilityModel> {
  InventoryFacilityModelMapper._();

  static InventoryFacilityModelMapper? _instance;
  static InventoryFacilityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InventoryFacilityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'InventoryFacilityModel';

  static String _$id(InventoryFacilityModel v) => v.id;
  static const Field<InventoryFacilityModel, String> _f$id = Field('id', _$id);
  static bool? _$isPermanent(InventoryFacilityModel v) => v.isPermanent;
  static const Field<InventoryFacilityModel, bool> _f$isPermanent =
      Field('isPermanent', _$isPermanent, opt: true);
  static String? _$usage(InventoryFacilityModel v) => v.usage;
  static const Field<InventoryFacilityModel, String> _f$usage =
      Field('usage', _$usage, opt: true);
  static int? _$storageCapacity(InventoryFacilityModel v) => v.storageCapacity;
  static const Field<InventoryFacilityModel, int> _f$storageCapacity =
      Field('storageCapacity', _$storageCapacity, opt: true);
  static bool? _$nonRecoverableError(InventoryFacilityModel v) =>
      v.nonRecoverableError;
  static const Field<InventoryFacilityModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String? _$tenantId(InventoryFacilityModel v) => v.tenantId;
  static const Field<InventoryFacilityModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(InventoryFacilityModel v) => v.rowVersion;
  static const Field<InventoryFacilityModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<InventoryFacilityModel> fields = const {
    #id: _f$id,
    #isPermanent: _f$isPermanent,
    #usage: _f$usage,
    #storageCapacity: _f$storageCapacity,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static InventoryFacilityModel _instantiate(DecodingData data) {
    return InventoryFacilityModel(
        id: data.dec(_f$id),
        isPermanent: data.dec(_f$isPermanent),
        usage: data.dec(_f$usage),
        storageCapacity: data.dec(_f$storageCapacity),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static InventoryFacilityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InventoryFacilityModel>(map);
  }

  static InventoryFacilityModel fromJson(String json) {
    return ensureInitialized().decodeJson<InventoryFacilityModel>(json);
  }
}

mixin InventoryFacilityModelMappable {
  String toJson() {
    return InventoryFacilityModelMapper.ensureInitialized()
        .encodeJson<InventoryFacilityModel>(this as InventoryFacilityModel);
  }

  Map<String, dynamic> toMap() {
    return InventoryFacilityModelMapper.ensureInitialized()
        .encodeMap<InventoryFacilityModel>(this as InventoryFacilityModel);
  }

  InventoryFacilityModelCopyWith<InventoryFacilityModel, InventoryFacilityModel,
          InventoryFacilityModel>
      get copyWith => _InventoryFacilityModelCopyWithImpl(
          this as InventoryFacilityModel, $identity, $identity);
  @override
  String toString() {
    return InventoryFacilityModelMapper.ensureInitialized()
        .stringifyValue(this as InventoryFacilityModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            InventoryFacilityModelMapper.ensureInitialized()
                .isValueEqual(this as InventoryFacilityModel, other));
  }

  @override
  int get hashCode {
    return InventoryFacilityModelMapper.ensureInitialized()
        .hashValue(this as InventoryFacilityModel);
  }
}

extension InventoryFacilityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InventoryFacilityModel, $Out> {
  InventoryFacilityModelCopyWith<$R, InventoryFacilityModel, $Out>
      get $asInventoryFacilityModel =>
          $base.as((v, t, t2) => _InventoryFacilityModelCopyWithImpl(v, t, t2));
}

abstract class InventoryFacilityModelCopyWith<
    $R,
    $In extends InventoryFacilityModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      bool? isPermanent,
      String? usage,
      int? storageCapacity,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion});
  InventoryFacilityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _InventoryFacilityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InventoryFacilityModel, $Out>
    implements
        InventoryFacilityModelCopyWith<$R, InventoryFacilityModel, $Out> {
  _InventoryFacilityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InventoryFacilityModel> $mapper =
      InventoryFacilityModelMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? isPermanent = $none,
          Object? usage = $none,
          Object? storageCapacity = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (isPermanent != $none) #isPermanent: isPermanent,
        if (usage != $none) #usage: usage,
        if (storageCapacity != $none) #storageCapacity: storageCapacity,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  InventoryFacilityModel $make(CopyWithData data) => InventoryFacilityModel(
      id: data.get(#id, or: $value.id),
      isPermanent: data.get(#isPermanent, or: $value.isPermanent),
      usage: data.get(#usage, or: $value.usage),
      storageCapacity: data.get(#storageCapacity, or: $value.storageCapacity),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  InventoryFacilityModelCopyWith<$R2, InventoryFacilityModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _InventoryFacilityModelCopyWithImpl($value, $cast, t);
}
