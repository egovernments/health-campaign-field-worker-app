import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/utils/utils.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/utils/screen_protection_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool _formSchemaLoaded = false;
  bool _isForm = false;
  bool _preventScreenCapture = false;

  @override
  void initState() {
    super.initState();
    final config = FlowRegistry.getByName(widget.pageName);
    _isForm = config?['screenType'] == 'FORM';
    _preventScreenCapture = config?['preventScreenCapture'] == true;

    // For TEMPLATE screens, register with ScreenProtectionManager
    // FORM screens are handled by FormsRenderPage
    if (!_isForm) {
      ScreenProtectionManager()
          .registerPage(widget.pageName, _preventScreenCapture);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load form schema only once when dependencies are available
    if (!_formSchemaLoaded) {
      _loadFormSchemaIfNeeded();
    }
  }

  void _loadFormSchemaIfNeeded() {
    final config = FlowRegistry.getByName(widget.pageName);
    if (config?['screenType'] == 'FORM') {
      final normalized = transformJson(config!);
      final schemaJsonString = jsonEncode(normalized);
      context
          .read<FormsBloc>()
          .add(FormsEvent.load(schemas: [schemaJsonString]));
      _formSchemaLoaded = true;
    }
  }

  @override
  void dispose() {
    // For TEMPLATE screens, unregister from ScreenProtectionManager
    if (!_isForm) {
      ScreenProtectionManager().unregisterPage(widget.pageName);
    }
    FlowCrudStateRegistry().dispose(widget.pageName);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = FlowRegistry.getByName(widget.pageName);
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
