import 'package:dart_mappable/dart_mappable.dart';
import '../data_model.dart';

@MappableClass()
class AddressRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? doorNo;
  final num? latitude;
  final num? longitude;
  final num? locationAccuracy;
  final AddressType? type;
  final String? addressLine1;
  final String? addressLine2;
  final String? landmark;
  final String? city;
  final String? pincode;
  final String? buildingName;
  final String? street;

  const AddressRequestModel({
    this.id,
    this.tenantId,
    this.doorNo,
    this.latitude,
    this.longitude,
    this.locationAccuracy,
    this.type,
    this.addressLine1,
    this.addressLine2,
    this.landmark,
    this.city,
    this.pincode,
    this.buildingName,
    this.street,
    super.auditDetails,
  });
}

@MappableClass()
class AddressModel extends DataModel implements AddressRequestModel {
  @override
  final String id;
  @override
  final String tenantId;
  @override
  final String doorNo;
  @override
  final num? latitude;
  @override
  final num? longitude;
  @override
  final num? locationAccuracy;
  @override
  final AddressType type;
  @override
  final String addressLine1;
  @override
  final String addressLine2;
  @override
  final String? landmark;
  @override
  final String city;
  @override
  final String pincode;
  @override
  final String? buildingName;
  @override
  final String street;

  const AddressModel({
    required this.id,
    required this.tenantId,
    required this.doorNo,
    this.latitude,
    this.longitude,
    this.locationAccuracy,
    required this.type,
    required this.addressLine1,
    required this.addressLine2,
    this.landmark,
    required this.city,
    required this.pincode,
    this.buildingName,
    required this.street,
    super.auditDetails,
  });
}

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum AddressType { permanent, correspondence }
