// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pgr_address.dart';

class PgrAddressModelMapper extends SubClassMapperBase<PgrAddressModel> {
  PgrAddressModelMapper._();

  static PgrAddressModelMapper? _instance;
  static PgrAddressModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrAddressModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PgrAddressModel';

  static String? _$tenantId(PgrAddressModel v) => v.tenantId;
  static const Field<PgrAddressModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$relatedClientReferenceId(PgrAddressModel v) =>
      v.relatedClientReferenceId;
  static const Field<PgrAddressModel, String> _f$relatedClientReferenceId =
      Field('relatedClientReferenceId', _$relatedClientReferenceId, opt: true);
  static String? _$doorNo(PgrAddressModel v) => v.doorNo;
  static const Field<PgrAddressModel, String> _f$doorNo =
      Field('doorNo', _$doorNo, opt: true);
  static String? _$plotNo(PgrAddressModel v) => v.plotNo;
  static const Field<PgrAddressModel, String> _f$plotNo =
      Field('plotNo', _$plotNo, opt: true);
  static String? _$id(PgrAddressModel v) => v.id;
  static const Field<PgrAddressModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$landmark(PgrAddressModel v) => v.landmark;
  static const Field<PgrAddressModel, String> _f$landmark =
      Field('landmark', _$landmark, opt: true);
  static String? _$city(PgrAddressModel v) => v.city;
  static const Field<PgrAddressModel, String> _f$city =
      Field('city', _$city, opt: true);
  static String? _$district(PgrAddressModel v) => v.district;
  static const Field<PgrAddressModel, String> _f$district =
      Field('district', _$district, opt: true);
  static String? _$region(PgrAddressModel v) => v.region;
  static const Field<PgrAddressModel, String> _f$region =
      Field('region', _$region, opt: true);
  static String? _$state(PgrAddressModel v) => v.state;
  static const Field<PgrAddressModel, String> _f$state =
      Field('state', _$state, opt: true);
  static String? _$country(PgrAddressModel v) => v.country;
  static const Field<PgrAddressModel, String> _f$country =
      Field('country', _$country, opt: true);
  static String? _$pincode(PgrAddressModel v) => v.pincode;
  static const Field<PgrAddressModel, String> _f$pincode =
      Field('pincode', _$pincode, opt: true);
  static String? _$buildingName(PgrAddressModel v) => v.buildingName;
  static const Field<PgrAddressModel, String> _f$buildingName =
      Field('buildingName', _$buildingName, opt: true);
  static String? _$street(PgrAddressModel v) => v.street;
  static const Field<PgrAddressModel, String> _f$street =
      Field('street', _$street, opt: true);
  static LocalityModel? _$locality(PgrAddressModel v) => v.locality;
  static const Field<PgrAddressModel, LocalityModel> _f$locality =
      Field('locality', _$locality, opt: true);
  static GeoLocation? _$geoLocation(PgrAddressModel v) => v.geoLocation;
  static const Field<PgrAddressModel, GeoLocation> _f$geoLocation =
      Field('geoLocation', _$geoLocation, opt: true);
  static Map<String, dynamic>? _$additionDetails(PgrAddressModel v) =>
      v.additionDetails;
  static const Field<PgrAddressModel, Map<String, dynamic>> _f$additionDetails =
      Field('additionDetails', _$additionDetails, opt: true);
  static bool? _$isDeleted(PgrAddressModel v) => v.isDeleted;
  static const Field<PgrAddressModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true);
  static int? _$rowVersion(PgrAddressModel v) => v.rowVersion;
  static const Field<PgrAddressModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(PgrAddressModel v) => v.auditDetails;
  static const Field<PgrAddressModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(PgrAddressModel v) =>
      v.clientAuditDetails;
  static const Field<PgrAddressModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrAddressModel> fields = const {
    #tenantId: _f$tenantId,
    #relatedClientReferenceId: _f$relatedClientReferenceId,
    #doorNo: _f$doorNo,
    #plotNo: _f$plotNo,
    #id: _f$id,
    #landmark: _f$landmark,
    #city: _f$city,
    #district: _f$district,
    #region: _f$region,
    #state: _f$state,
    #country: _f$country,
    #pincode: _f$pincode,
    #buildingName: _f$buildingName,
    #street: _f$street,
    #locality: _f$locality,
    #geoLocation: _f$geoLocation,
    #additionDetails: _f$additionDetails,
    #isDeleted: _f$isDeleted,
    #rowVersion: _f$rowVersion,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntityModelMapper.ensureInitialized();

  static PgrAddressModel _instantiate(DecodingData data) {
    return PgrAddressModel(
        tenantId: data.dec(_f$tenantId),
        relatedClientReferenceId: data.dec(_f$relatedClientReferenceId),
        doorNo: data.dec(_f$doorNo),
        plotNo: data.dec(_f$plotNo),
        id: data.dec(_f$id),
        landmark: data.dec(_f$landmark),
        city: data.dec(_f$city),
        district: data.dec(_f$district),
        region: data.dec(_f$region),
        state: data.dec(_f$state),
        country: data.dec(_f$country),
        pincode: data.dec(_f$pincode),
        buildingName: data.dec(_f$buildingName),
        street: data.dec(_f$street),
        locality: data.dec(_f$locality),
        geoLocation: data.dec(_f$geoLocation),
        additionDetails: data.dec(_f$additionDetails),
        isDeleted: data.dec(_f$isDeleted),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrAddressModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrAddressModel>(map);
  }

  static PgrAddressModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrAddressModel>(json);
  }
}

mixin PgrAddressModelMappable {
  String toJson() {
    return PgrAddressModelMapper.ensureInitialized()
        .encodeJson<PgrAddressModel>(this as PgrAddressModel);
  }

  Map<String, dynamic> toMap() {
    return PgrAddressModelMapper.ensureInitialized()
        .encodeMap<PgrAddressModel>(this as PgrAddressModel);
  }

  PgrAddressModelCopyWith<PgrAddressModel, PgrAddressModel, PgrAddressModel>
      get copyWith => _PgrAddressModelCopyWithImpl(
          this as PgrAddressModel, $identity, $identity);
  @override
  String toString() {
    return PgrAddressModelMapper.ensureInitialized()
        .stringifyValue(this as PgrAddressModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrAddressModelMapper.ensureInitialized()
                .isValueEqual(this as PgrAddressModel, other));
  }

  @override
  int get hashCode {
    return PgrAddressModelMapper.ensureInitialized()
        .hashValue(this as PgrAddressModel);
  }
}

extension PgrAddressModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrAddressModel, $Out> {
  PgrAddressModelCopyWith<$R, PgrAddressModel, $Out> get $asPgrAddressModel =>
      $base.as((v, t, t2) => _PgrAddressModelCopyWithImpl(v, t, t2));
}

abstract class PgrAddressModelCopyWith<$R, $In extends PgrAddressModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  LocalityModelCopyWith<$R, LocalityModel, LocalityModel>? get locality;
  GeoLocationCopyWith<$R, GeoLocation, GeoLocation>? get geoLocation;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionDetails;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {String? tenantId,
      String? relatedClientReferenceId,
      String? doorNo,
      String? plotNo,
      String? id,
      String? landmark,
      String? city,
      String? district,
      String? region,
      String? state,
      String? country,
      String? pincode,
      String? buildingName,
      String? street,
      LocalityModel? locality,
      GeoLocation? geoLocation,
      Map<String, dynamic>? additionDetails,
      bool? isDeleted,
      int? rowVersion,
      AuditDetails? auditDetails});
  PgrAddressModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrAddressModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrAddressModel, $Out>
    implements PgrAddressModelCopyWith<$R, PgrAddressModel, $Out> {
  _PgrAddressModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrAddressModel> $mapper =
      PgrAddressModelMapper.ensureInitialized();
  @override
  LocalityModelCopyWith<$R, LocalityModel, LocalityModel>? get locality =>
      $value.locality?.copyWith.$chain((v) => call(locality: v));
  @override
  GeoLocationCopyWith<$R, GeoLocation, GeoLocation>? get geoLocation =>
      $value.geoLocation?.copyWith.$chain((v) => call(geoLocation: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionDetails => $value.additionDetails != null
          ? MapCopyWith(
              $value.additionDetails!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(additionDetails: v))
          : null;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {Object? tenantId = $none,
          Object? relatedClientReferenceId = $none,
          Object? doorNo = $none,
          Object? plotNo = $none,
          Object? id = $none,
          Object? landmark = $none,
          Object? city = $none,
          Object? district = $none,
          Object? region = $none,
          Object? state = $none,
          Object? country = $none,
          Object? pincode = $none,
          Object? buildingName = $none,
          Object? street = $none,
          Object? locality = $none,
          Object? geoLocation = $none,
          Object? additionDetails = $none,
          Object? isDeleted = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (tenantId != $none) #tenantId: tenantId,
        if (relatedClientReferenceId != $none)
          #relatedClientReferenceId: relatedClientReferenceId,
        if (doorNo != $none) #doorNo: doorNo,
        if (plotNo != $none) #plotNo: plotNo,
        if (id != $none) #id: id,
        if (landmark != $none) #landmark: landmark,
        if (city != $none) #city: city,
        if (district != $none) #district: district,
        if (region != $none) #region: region,
        if (state != $none) #state: state,
        if (country != $none) #country: country,
        if (pincode != $none) #pincode: pincode,
        if (buildingName != $none) #buildingName: buildingName,
        if (street != $none) #street: street,
        if (locality != $none) #locality: locality,
        if (geoLocation != $none) #geoLocation: geoLocation,
        if (additionDetails != $none) #additionDetails: additionDetails,
        if (isDeleted != $none) #isDeleted: isDeleted,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  PgrAddressModel $make(CopyWithData data) => PgrAddressModel(
      tenantId: data.get(#tenantId, or: $value.tenantId),
      relatedClientReferenceId: data.get(#relatedClientReferenceId,
          or: $value.relatedClientReferenceId),
      doorNo: data.get(#doorNo, or: $value.doorNo),
      plotNo: data.get(#plotNo, or: $value.plotNo),
      id: data.get(#id, or: $value.id),
      landmark: data.get(#landmark, or: $value.landmark),
      city: data.get(#city, or: $value.city),
      district: data.get(#district, or: $value.district),
      region: data.get(#region, or: $value.region),
      state: data.get(#state, or: $value.state),
      country: data.get(#country, or: $value.country),
      pincode: data.get(#pincode, or: $value.pincode),
      buildingName: data.get(#buildingName, or: $value.buildingName),
      street: data.get(#street, or: $value.street),
      locality: data.get(#locality, or: $value.locality),
      geoLocation: data.get(#geoLocation, or: $value.geoLocation),
      additionDetails: data.get(#additionDetails, or: $value.additionDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  PgrAddressModelCopyWith<$R2, PgrAddressModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PgrAddressModelCopyWithImpl($value, $cast, t);
}

class GeoLocationMapper extends ClassMapperBase<GeoLocation> {
  GeoLocationMapper._();

  static GeoLocationMapper? _instance;
  static GeoLocationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GeoLocationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GeoLocation';

  static double? _$latitude(GeoLocation v) => v.latitude;
  static const Field<GeoLocation, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$longitude(GeoLocation v) => v.longitude;
  static const Field<GeoLocation, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static Map<String, dynamic>? _$additionalDetails(GeoLocation v) =>
      v.additionalDetails;
  static const Field<GeoLocation, Map<String, dynamic>> _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);

  @override
  final MappableFields<GeoLocation> fields = const {
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #additionalDetails: _f$additionalDetails,
  };
  @override
  final bool ignoreNull = true;

  static GeoLocation _instantiate(DecodingData data) {
    return GeoLocation(
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        additionalDetails: data.dec(_f$additionalDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static GeoLocation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GeoLocation>(map);
  }

  static GeoLocation fromJson(String json) {
    return ensureInitialized().decodeJson<GeoLocation>(json);
  }
}

mixin GeoLocationMappable {
  String toJson() {
    return GeoLocationMapper.ensureInitialized()
        .encodeJson<GeoLocation>(this as GeoLocation);
  }

  Map<String, dynamic> toMap() {
    return GeoLocationMapper.ensureInitialized()
        .encodeMap<GeoLocation>(this as GeoLocation);
  }

  GeoLocationCopyWith<GeoLocation, GeoLocation, GeoLocation> get copyWith =>
      _GeoLocationCopyWithImpl(this as GeoLocation, $identity, $identity);
  @override
  String toString() {
    return GeoLocationMapper.ensureInitialized()
        .stringifyValue(this as GeoLocation);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GeoLocationMapper.ensureInitialized()
                .isValueEqual(this as GeoLocation, other));
  }

  @override
  int get hashCode {
    return GeoLocationMapper.ensureInitialized().hashValue(this as GeoLocation);
  }
}

extension GeoLocationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GeoLocation, $Out> {
  GeoLocationCopyWith<$R, GeoLocation, $Out> get $asGeoLocation =>
      $base.as((v, t, t2) => _GeoLocationCopyWithImpl(v, t, t2));
}

abstract class GeoLocationCopyWith<$R, $In extends GeoLocation, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionalDetails;
  $R call(
      {double? latitude,
      double? longitude,
      Map<String, dynamic>? additionalDetails});
  GeoLocationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GeoLocationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GeoLocation, $Out>
    implements GeoLocationCopyWith<$R, GeoLocation, $Out> {
  _GeoLocationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GeoLocation> $mapper =
      GeoLocationMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionalDetails => $value.additionalDetails != null
          ? MapCopyWith(
              $value.additionalDetails!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(additionalDetails: v))
          : null;
  @override
  $R call(
          {Object? latitude = $none,
          Object? longitude = $none,
          Object? additionalDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (latitude != $none) #latitude: latitude,
        if (longitude != $none) #longitude: longitude,
        if (additionalDetails != $none) #additionalDetails: additionalDetails
      }));
  @override
  GeoLocation $make(CopyWithData data) => GeoLocation(
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude),
      additionalDetails:
          data.get(#additionalDetails, or: $value.additionalDetails));

  @override
  GeoLocationCopyWith<$R2, GeoLocation, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GeoLocationCopyWithImpl($value, $cast, t);
}
