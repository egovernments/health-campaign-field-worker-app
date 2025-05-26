import 'package:delivery/models/entities/referral.dart';
import 'package:delivery/models/entities/side_effect.dart';
import 'package:delivery/models/entities/task.dart';
import 'package:digit_data_model/data_model.dart';

typedef TaskDataRepository = DataRepository<TaskModel, TaskSearchModel>;
typedef SideEffectDataRepository
    = DataRepository<SideEffectModel, SideEffectSearchModel>;
typedef ReferralDataRepository
    = DataRepository<ReferralModel, ReferralSearchModel>;
typedef ProjectResourceDataRepository
    = DataRepository<ProjectResourceModel, ProjectResourceSearchModel>;
typedef ProductVariantDataRepository
    = DataRepository<ProductVariantModel, ProductVariantSearchModel>;
