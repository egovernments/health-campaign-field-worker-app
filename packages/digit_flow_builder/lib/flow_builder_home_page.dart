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
import 'utils/utils.dart';

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
  late final String _instanceId;
  late final String _compositeKey;

  @override
  void initState() {
    super.initState();
    final config = FlowRegistry.getByName(widget.pageName);
    _isForm = config?['screenType'] == 'FORM';
    _preventScreenCapture = config?['preventScreenCapture'] == true;

    // Get or generate instanceId for this page instance
    final screenType = config?['screenType'] ?? 'TEMPLATE';
    _instanceId = getOrGenerateInstanceId(
      widget.navigationParams,
      widget.pageName,
    );
    _compositeKey = createCompositeKey(widget.pageName, _instanceId);

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
    // Dispose state using the composite key (pageName::instanceId)
    // This ensures only this page instance's state is disposed
    FlowCrudStateRegistry().disposeByCompositeKey(_compositeKey);
    SearchStateManager().disposeByCompositeKey(_compositeKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = FlowRegistry.getByName(widget.pageName);
    if (config == null) return const Center(child: Text('Page not found'));

    final canPop = config['canPop'] ?? true;

    DataConverterSingleton()
        .setData(dynamicEntityModelListener: EntityModelJsonMapper());

    return PopScope(
      canPop: canPop is bool ? canPop : true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CrudBloc>(
            create: (context) {
              final crudService = CrudBlocSingleton().crudService;

              return FlowCrudBloc(
                flowConfig: config,
                service: crudService,
                instanceId: _instanceId,
                onUpdate: (screenKey, state) {},
              )..add(const CrudEventInitialize());
            },
          ),
        ],
        child: ScreenBuilder(
          config: config,
          navigationParams: widget.navigationParams,
          instanceId: _instanceId,
        ),
      ),
    );
  }
}
