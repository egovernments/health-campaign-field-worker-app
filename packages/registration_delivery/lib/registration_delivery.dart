@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library registration_delivery;

import 'package:dart_mappable/dart_mappable.dart';

export 'data/local_store/tables/household.dart';
export 'data/local_store/tables/household_member.dart';
export 'data/local_store/tables/referral.dart';
export 'data/local_store/tables/task.dart';
export 'data/local_store/tables/task_resource.dart';
export 'data/local_store/tables/target.dart';

export 'data/repositories/local/task_base.dart';
export 'data/repositories/local/task.dart';
export 'data/repositories/local/household.dart';
export 'data/repositories/local/referral.dart';
export 'data/repositories/local/project_beneficiary.dart';
export 'data/repositories/local/project_beneficiary_base.dart';
export 'data/repositories/local/project_facility.dart';
export 'data/repositories/local/project_facility_base.dart';
export 'data/repositories/local/facility.dart';
export 'data/repositories/local/facility_base.dart';

export 'models/entities/task.dart';
export 'models/entities/target.dart';
export 'models/entities/household.dart';
export 'models/entities/household_member.dart';
export 'models/entities/referral.dart';
export 'models/entities/project_beneficiary.dart';
export 'models/entities/task_resource.dart';
export 'models/entities/product_variant.dart';
export 'models/entities/project_product_variant.dart';
export 'models/entities/project_type.dart';

export 'blocs/search_households/search_by_head.dart';
export 'blocs/search_households/search_households.dart';
export 'blocs/search_households/tag_by_search.dart';
export 'blocs/search_households/proximity_search.dart';
export 'blocs/search_households/search_bloc_common_wrapper.dart';
export 'blocs/facility/facility.dart';
export 'blocs/project_facility/project_facility.dart';

export 'widgets/progress_bar/beneficiary_progress.dart';
export 'widgets/beneficiary/beneficiary_card.dart';
export 'widgets/beneficiary/beneficiary_statistics_card.dart';

export 'utils/utils.dart';