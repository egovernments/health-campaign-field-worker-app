import 'package:dart_mappable/dart_mappable.dart';

part 'scanned_individual_data.mapper.dart';

@MappableClass()
class ScannedIndividualDataModel with ScannedIndividualDataModelMappable {
  final String? individualId;
  final int? qrCreatedTime;
  final String? name;
  final String? locality; 
  final int? age;

  ScannedIndividualDataModel({
    this.individualId,
    this.qrCreatedTime,
    this.name,
    this.locality,
    this.age,
  });
}
