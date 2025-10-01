import 'package:auto_route/auto_route.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:referral_reconciliation/data/digit_crud_service.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';
import 'package:referral_reconciliation/utils/extensions/extensions.dart';
import 'package:referral_reconciliation/utils/utils.dart';
import 'package:survey_form/survey_form.dart';

import '../blocs/referral_wrapper/hf_referral_reconciliation_bloc.dart';
import '../data/digit_data_converter.dart';

@RoutePage()
class HFReferralWrapperPage extends StatelessWidget {
  const HFReferralWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.repository<ServiceDefinitionModel, ServiceDefinitionSearchModel>(
        context);

    CrudBlocSingleton().setData(
      crudService: DigitCrudService(
        context: context,
        relationshipMap: [],
        nestedModelMappings: [],
        searchEntityRepository: context.read<SearchEntityRepository>(),
      ),
      dynamicEntityModelListener: EntityModelMapMapper(),
    );

    DataConverterSingleton()
        .setData(dynamicEntityModelListener: EntityModelJsonMapper());

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return CrudBloc(
                service: CrudBlocSingleton().crudService,
              );
            },
          ),
          BlocProvider(
            create: (context) {
              return HFReferalWrapperBloc(
                  globalHFReferalBloc: context.read<CrudBloc>());
            },
          ),
          BlocProvider<ProjectFacilityBloc>(
            create: (_) => ProjectFacilityBloc(
              const ProjectFacilityEmptyState(),
              projectFacilityDataRepository: context.repository<
                  ProjectFacilityModel, ProjectFacilitySearchModel>(context),
            )..add(ProjectFacilityLoadEvent(
                query: ProjectFacilitySearchModel(
                    projectId: [ReferralReconSingleton().projectId]))),
          )
        ],
        child: const AutoRouter(),
      ),
    );
  }

  static DataRepository<EntityModel, EntitySearchModel> getRepositoryForEntity(
      BuildContext context, EntityModel entity) {
    if (entity is HFReferralModel) {
      return context
          .repository<HFReferralModel, HFReferralSearchModel>(context);
    } else {
      return context
          .repository<HFReferralModel, HFReferralSearchModel>(context);
    }
  }
}
