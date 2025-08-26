import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_crud_bloc/utils/utils.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/models/entities/beneficiary_type.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/flow_crud_bloc.dart';
import 'data/digit_crud_service.dart';
import 'data/digit_data_converter.dart';
import 'flow_builder.dart';

@RoutePage()
class FlowBuilderHomePage extends LocalizedStatefulWidget {
  final String pageName;
  final Map<String, dynamic>? navigationParams;

  const FlowBuilderHomePage(
      {super.key, required this.pageName, this.navigationParams});

  @override
  State<FlowBuilderHomePage> createState() => _FlowBuilderHomePageState();
}

class _FlowBuilderHomePageState extends State<FlowBuilderHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final config = FlowRegistry.getByName(widget.pageName);
    if (config?['screenType'] == 'FORM') {
      final normalized = transformJson(config!);
      final schemaJsonString = jsonEncode(normalized);
      context
          .read<FormsBloc>()
          .add(FormsEvent.load(schemas: [schemaJsonString]));
    }
    final params = FlowCrudStateRegistry().getNavigationParams(widget.pageName);
    debugPrint("➡️ Navigation params: $params");
  }

  @override
  void dispose() {
    FlowCrudStateRegistry().clear(widget.pageName);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = FlowRegistry.getByName(widget.pageName);
    if (config?['screenType'] == 'FORM') {
      /// TODO: NEED TO REMOVE TRANSFORMATION FROM HERE::: AS THIS WILL HAPPEN FROM MAIN APP
      final normalized = transformJson(config!);
      final schemaJsonString = jsonEncode(normalized);
      context
          .read<FormsBloc>()
          .add(FormsEvent.load(schemas: [schemaJsonString]));
    }
    if (config == null) return const Center(child: Text('Page not found'));

    CrudBlocSingleton().setData(
      crudService: DigitCrudService(
        context: context,
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
          if (FlowBuilderSingleton().beneficiaryType ==
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
        searchEntityRepository: context.read<SearchEntityRepository>(),
      ),
      dynamicEntityModelListener: EntityModelMapMapper(),
    );

    DataConverterSingleton()
        .setData(dynamicEntityModelListener: EntityModelJsonMapper());

    return MultiBlocProvider(
      providers: [
        BlocProvider<CrudBloc>(
          create: (context) {
            final crudService = CrudBlocSingleton().crudService;

            return FlowCrudBloc(
              flowConfig: config,
              service: crudService,
              onUpdate: (screenKey, state) {},
            )..add(const CrudEventInitialize());
          },
        ),
      ],
      child: ScreenBuilder(config: config),
    );
  }
}
