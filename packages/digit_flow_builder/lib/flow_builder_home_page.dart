import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_crud_bloc/utils/utils.dart';
import 'package:digit_data_converter/utils/utils.dart';
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

  const FlowBuilderHomePage({super.key, required this.pageName});

  @override
  State<FlowBuilderHomePage> createState() => _FlowBuilderHomePageState();
}

class _FlowBuilderHomePageState extends State<FlowBuilderHomePage> {
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
        relationshipMap: [],
        nestedModelMappings: [],
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
            final crudService = CrudBlocSingleton().crudService;

            return FlowCrudBloc(
              flowConfig: config,
              service: crudService,
              onUpdate: (screenKey, state) {
                if (state is CrudStatePersisted) {
                  debugPrint('print ${state.entities}');
                }
              },
            );
          },
        ),
      ],
      child: ScreenBuilder(config: config),
    );
  }
}
