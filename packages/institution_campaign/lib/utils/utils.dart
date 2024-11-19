//Singleton Class for Institution Campaign package where set data and get methods are defined
import 'package:digit_data_model/models/entities/boundary.dart';

class InstitutionCampaignSingleton {
  factory InstitutionCampaignSingleton() {
    return _singleton;
  }

  static final InstitutionCampaignSingleton _singleton =
      InstitutionCampaignSingleton._internal();

  InstitutionCampaignSingleton._internal();

  BoundaryModel? _boundary;

  void setBoundary({required BoundaryModel boundary}) {
    _boundary = boundary;
  }

  BoundaryModel? get boundary => _boundary;
}
