import 'package:auto_route/auto_route.dart';
import 'package:complaints/blocs/complaint_wrapper/complaint_wrapper_bloc.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_crud_bloc/utils/utils.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/digit_crud_service.dart';
import '../../data/digit_data_converter.dart';

@RoutePage()
class ComplaintsInboxWrapperPage extends StatelessWidget {
  const ComplaintsInboxWrapperPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CrudBlocSingleton().setData(
      crudService: DigitCrudService(
        context: context,
        relationshipMap: [
          const RelationshipMapping(
              from: 'pgrComplainant',
              to: 'pgrService',
              localKey: 'complaintClientReferenceId',
              foreignKey: 'clientReferenceId'),
        ],
        nestedModelMappings: [
          const NestedModelMapping(
            rootModel: 'pgrService',
            fields: {
              'user': NestedFieldMapping(
                table: 'pgrComplainant',
                localKey: 'clientReferenceId',
                foreignKey: 'complaintClientReferenceId',
                type: NestedMappingType.one,
              ),
              'address': NestedFieldMapping(
                table: 'address',
                localKey: 'clientReferenceId',
                foreignKey: 'relatedClientReferenceId',
                type: NestedMappingType.one,
              )
            },
          ),
        ],
        searchEntityRepository: context.read<SearchEntityRepository>(),
      ),
      dynamicEntityModelListener: EntityModelMapMapper(),
    );

    DataConverterSingleton()
        .setData(dynamicEntityModelListener: EntityModelJsonMapper());

    return MultiBlocProvider(
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
            return ComplaintWrapperBloc(
                globalCrudBloc: context.read<CrudBloc>()
                  ..add(const CrudEventInitialize()));
          },
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
