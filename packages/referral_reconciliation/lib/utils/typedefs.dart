import 'package:digit_data_model/data_model.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';

typedef HFReferralDataRepository
    = DataRepository<HFReferralModel, HFReferralSearchModel>;
typedef ServiceDataRepository
    = DataRepository<ServiceModel, ServiceSearchModel>;
typedef ServiceDefinitionDataRepository
    = DataRepository<ServiceDefinitionModel, ServiceDefinitionSearchModel>;
