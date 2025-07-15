import 'package:auto_route/auto_route.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_crud_bloc/service/crud_service.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:registration_delivery/blocs/registration_wrapper/registration_wrapper_bloc.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';
import 'package:survey_form/blocs/service_definition.dart';
import 'package:survey_form/models/entities/service_definition.dart';

import '../blocs/unique_id/unique_id.dart';
import '../data/repositories/remote/unique_id_pool.dart';
import '../models/entities/household.dart';
import '../models/entities/household_member.dart';
import '../models/entities/project_beneficiary.dart';
import '../models/entities/task.dart';
import '../models/entities/unique_id_pool.dart';
import '../utils/utils.dart';

@RoutePage()
class RegistrationDeliveryWrapperPage extends StatelessWidget {
  const RegistrationDeliveryWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceDefinition = context.repository<ServiceDefinitionModel,
        ServiceDefinitionSearchModel>(context);

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (_) => FormsBloc(),
          // ),
          BlocProvider(
            create: (context) {
              return RegistrationBloc(
                service: RegistrationService(
                  relationshipMap: [
                    const RelationshipMapping(
                        from: 'name',
                        to: 'individual',
                        localKey: 'individualClientReferenceId',
                        foreignKey: 'clientReferenceId'),
                    const RelationshipMapping(
                        from: 'identifier',
                        to: 'individual',
                        localKey: 'individualClientReferenceId',
                        foreignKey: 'clientReferenceId'),
                    const RelationshipMapping(
                        from: 'householdMember',
                        to: 'individual',
                        localKey: 'individualClientReferenceId',
                        foreignKey: 'clientReferenceId'),
                    const RelationshipMapping(
                        from: 'address',
                        to: 'household',
                        localKey: 'relatedClientReferenceId',
                        foreignKey: 'clientReferenceId'),
                    const RelationshipMapping(
                        from: 'householdMember',
                        to: 'household',
                        localKey: 'householdClientReferenceId',
                        foreignKey: 'clientReferenceId'),
                    const RelationshipMapping(
                        from: 'projectBeneficiary',
                        to: 'task',
                        localKey: 'clientReferenceId',
                        foreignKey: 'projectBeneficiaryClientReferenceId'),
                    // Conditional mapping
                    if (RegistrationDeliverySingleton().beneficiaryType ==
                        BeneficiaryType.household)
                      const RelationshipMapping(
                        from: 'projectBeneficiary',
                        to: 'household',
                        localKey: 'beneficiaryClientReferenceId',
                        foreignKey: 'clientReferenceId',
                      )
                    else
                      const RelationshipMapping(
                        from: 'projectBeneficiary',
                        to: 'individual',
                        localKey: 'beneficiaryClientReferenceId',
                        foreignKey: 'clientReferenceId',
                      ),
                  ],
                  nestedModelMappings: [
                    const NestedModelMapping(
                      rootModel: 'individual',
                      fields: {
                        'name': NestedFieldMapping(
                          table: 'name',
                          localKey: 'clientReferenceId',
                          foreignKey: 'individualClientReferenceId',
                          type: NestedMappingType.one,
                        ),
                        'address': NestedFieldMapping(
                          table: 'address',
                          localKey: 'clientReferenceId',
                          foreignKey: 'relatedClientReferenceId',
                          type: NestedMappingType.many,
                        ),
                        'identifiers': NestedFieldMapping(
                          table: 'identifier',
                          localKey: 'clientReferenceId',
                          foreignKey: 'individualClientReferenceId',
                          type: NestedMappingType.many,
                        ),
                      },
                    ),
                    const NestedModelMapping(
                      rootModel: 'household',
                      fields: {
                        'address': NestedFieldMapping(
                          table: 'address',
                          localKey: 'clientReferenceId',
                          foreignKey: 'relatedClientReferenceId',
                          type: NestedMappingType.one,
                        ),
                      },
                    ),
                    const NestedModelMapping(
                      rootModel: 'task',
                      fields: {
                        'resource': NestedFieldMapping(
                          table: 'resource',
                          localKey: 'taskclientReferenceId',
                          foreignKey: 'clientReferenceId',
                          type: NestedMappingType.many,
                        ),
                      },
                    ),
                  ],
                  projectBeneficiaryRepository: context.repository<
                      ProjectBeneficiaryModel,
                      ProjectBeneficiarySearchModel>(context),
                  householdMemberRepository: context.repository<
                      HouseholdMemberModel,
                      HouseholdMemberSearchModel>(context),
                  householdRepository:
                      context.repository<HouseholdModel, HouseholdSearchModel>(
                          context),
                  individualRepository: context.repository<IndividualModel,
                      IndividualSearchModel>(context),
                  taskDataRepository:
                      context.repository<TaskModel, TaskSearchModel>(context),
                  searchEntityRepository:
                      context.read<SearchEntityRepository>(),
                ),
              );
            },
          ),
          BlocProvider(
            create: (context) {
              return RegistrationWrapperBloc(
                  globalRegistrationBloc: context.read<RegistrationBloc>());
            },
          ),
          BlocProvider(
            create: (_) => ServiceDefinitionBloc(
              const ServiceDefinitionEmptyState(),
              serviceDefinitionDataRepository: serviceDefinition,
            )..add(const ServiceDefinitionFetchEvent()),
          ),
          BlocProvider(
            create: (_) => LocationBloc(location: Location()),
          ),
          BlocProvider(
            create: (context) => UniqueIdBloc(
                uniqueIdPoolLocalRepository: context.read<
                    LocalRepository<UniqueIdPoolModel,
                        UniqueIdPoolSearchModel>>(),
                uniqueIdPoolRemoteRepository:
                    context.read<UniqueIdPoolRemoteRepository>()),
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }
}
