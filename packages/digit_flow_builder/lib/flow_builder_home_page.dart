import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/utils/utils.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/flow_crud_bloc.dart';
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
    FlowCrudStateRegistry().dispose(widget.pageName);
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
      child: ScreenBuilder(
        config: config,
        navigationParams: widget.navigationParams,
      ),
    );
  }
}
