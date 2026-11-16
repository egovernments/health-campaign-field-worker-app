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

  /// Called when a flow screen is entered. [config] is the screen's flow
  /// configuration (name, category, screenType, body, ...) when registered.
  static void Function(
    String pageName,
    Map<String, dynamic> params,
    Map<String, dynamic>? config,
  )? onFlowStart;

  /// Called when a flow screen is exited (disposed).
  static void Function(String pageName)? onFlowEnd;

  /// Called when the flow screen's data state changes.
  /// [isLoading] true = fetch started, false = loaded or error.
  /// [recordCount] number of records loaded (-1 if unknown).
  /// [isPersisted] true when a CREATE/UPDATE completed.
  /// [errorMessage] non-null when an error occurred.
  static void Function(
    String screenKey,
    bool isLoading,
    int recordCount,
    bool isPersisted,
    String? errorMessage,
  )? onFlowDataUpdate;

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

    FlowBuilderHomePage.onFlowStart?.call(
      widget.pageName,
      widget.navigationParams ?? {},
      config == null ? null : Map<String, dynamic>.from(config),
    );
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
    FlowBuilderHomePage.onFlowEnd?.call(widget.pageName);
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
              instanceId: _instanceId,
              onUpdate: (screenKey, state) {
                if (FlowBuilderHomePage.onFlowDataUpdate == null) return;
                final isPersisted =
                    state.base?.runtimeType.toString() == 'CrudStatePersisted';
                final isError =
                    state.base?.runtimeType.toString() == 'CrudStateError';
                FlowBuilderHomePage.onFlowDataUpdate?.call(
                  screenKey,
                  state.isLoading,
                  state.stateWrapper?.length ?? -1,
                  isPersisted,
                  isError ? state.base.toString() : null,
                );
              },
            )..add(const CrudEventInitialize());
          },
        ),
      ],
      child: ScreenBuilder(
        config: config,
        navigationParams: widget.navigationParams,
        instanceId: _instanceId,
      ),
    );
  }
}
