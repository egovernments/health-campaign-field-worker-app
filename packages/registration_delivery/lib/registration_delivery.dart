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
export 'data/repositories/local/household_base.dart';
export 'data/repositories/local/referral.dart';
export 'data/repositories/local/project_beneficiary.dart';
export 'data/repositories/local/project_beneficiary_base.dart';
export 'data/repositories/local/household_member.dart';
export 'data/repositories/local/household_member_base.dart';
export 'data/repositories/local/side_effect.dart';
export 'data/repositories/local/side_effect_base.dart';

export 'data/repositories/remote/household.dart';
export 'data/repositories/remote/household_member.dart';

export 'models/entities/task.dart';
export 'models/entities/target.dart';
export 'models/entities/household.dart';
export 'models/entities/household_member.dart';
export 'models/entities/referral.dart';
export 'models/entities/project_beneficiary.dart';
export 'models/entities/task_resource.dart';
export 'models/entities/project_type.dart';
export 'models/entities/downsync.dart';
export 'models/entities/side_effect.dart';

export 'blocs/beneficiary_registration/beneficiary_registration.dart';
export 'blocs/delivery_intervention/deliver_intervention.dart';
export 'blocs/household_details/household_details.dart';
export 'blocs/household_location/household_location.dart';
export 'blocs/household_overview/household_overview.dart';
export 'blocs/referral_management/referral_management.dart';
export 'blocs/search_households/search_by_head.dart';
export 'blocs/search_households/search_households.dart';
export 'blocs/search_households/tag_by_search.dart';
export 'blocs/search_households/proximity_search.dart';
export 'blocs/search_households/search_bloc_common_wrapper.dart';
export 'blocs/service/service.dart';
export 'blocs/service_definition/service_definition.dart';
export 'blocs/side_effects/side_effects.dart';

export 'widgets/progress_bar/beneficiary_progress.dart';
export 'widgets/beneficiary/beneficiary_card.dart';
export 'widgets/beneficiary/beneficiary_statistics_card.dart';

export 'utils/utils.dart' show RegistrationDeliverySingleton;
export 'utils/typedefs.dart';

export 'router/registration_delivery_router.dart';