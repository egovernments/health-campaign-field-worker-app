import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_flow_builder/utils/scanner_comparison_utils.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flow_builder.dart';

class ScreenKeyListener extends StatelessWidget {
  final String screenKey;
  final Widget Function(BuildContext context, FlowCrudState? state) builder;

  const ScreenKeyListener({
    super.key,
    required this.screenKey,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FlowCrudStateRegistry().listen(screenKey),
      builder: (context, _, __) {
        final state = FlowCrudStateRegistry().get(screenKey);
        return builder(context, state);
      },
    );
  }
}

class ScreenBuilder extends StatefulWidget {
  final Map<String, dynamic> config;
  final Map<String, dynamic>? navigationParams;
  final String instanceId;

  const ScreenBuilder({
    super.key,
    required this.config,
    this.navigationParams,
    required this.instanceId,
  });

  @override
  State<ScreenBuilder> createState() => _ScreenBuilderState();
}

dynamic resolveTemplates(dynamic input, Map<String, dynamic> nav) {
  if (input is String) {
    return input.replaceAllMapped(RegExp(r'{{(.*?)}}'), (match) {
      final key = match.group(1)!.trim();
      if (key.startsWith('navigation.')) {
        final paramKey = key.split('.').last;
        return nav[paramKey]?.toString() ?? '';
      }
      return match.group(0)!; // leave as-is
    });
  } else if (input is Map) {
    // force keys to String here 👇
    return input.map(
      (k, v) => MapEntry(k.toString(), resolveTemplates(v, nav)),
    );
  } else if (input is List) {
    return input.map((v) => resolveTemplates(v, nav)).toList();
  }
  return input; // numbers, bools, null untouched
}

class _ScreenBuilderState extends State<ScreenBuilder> {
  late final String _instanceId;
  late final String _schemaKey;
  late final String _compositeKey;
  bool _isRegistered = false;

  @override
  void initState() {
    super.initState();
    _schemaKey = widget.config['name'] ?? '';

    // Use instanceId passed from FlowBuilderHomePage to ensure consistency
    _instanceId = widget.instanceId;
    _compositeKey = createCompositeKey(_schemaKey, _instanceId);

    // Register instance for backward compatibility with executors using screenKey lookup
    FlowCrudStateRegistry().registerInstance(_schemaKey, _instanceId);
    SearchStateManager().registerInstance(_schemaKey, _instanceId);

    if (mounted) {
      final initActions = widget.config['initActions'] as List? ?? [];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Initialize FormSubmissionRegistry if not already done
        _initializeFormSubmissionRegistry();

        // Register form submission handler
        _registerFormHandler();

        final resolvedActions =
            resolveTemplates(initActions, widget.navigationParams ?? {});

        for (final action in resolvedActions) {
          final parsed = ActionConfig.fromJson(
            Map<String, dynamic>.from(action as Map),
          );
          ActionHandler.execute(parsed, context, {
            'wrappers': const [],
          });
        }
      });
    }
  }

  void _initializeFormSubmissionRegistry() {
    // Initialize the registry with FormsBloc (only happens once due to singleton)
    final formsBloc = context.read<FormsBloc>();
    FormSubmissionRegistry().initialize(formsBloc);
  }

  void _registerFormHandler() {
    if (widget.config['screenType'] == 'FORM' && _schemaKey.isNotEmpty) {
      _isRegistered = FormSubmissionRegistry().register(
        schemaKey: _schemaKey,
        instanceId: _instanceId,
        handler: _handleFormSubmission,
      );
    }
  }

  Future<void> _handleFormSubmission(Map<String, dynamic> formData) async {
    if (!mounted) return;

    final onSubmit = widget.config['onAction'] as List<dynamic>?;

    // Merge widget.navigationParams with registry params (registry takes precedence)
    final mergedNavParams = {
      ...?widget.navigationParams,
    };

    // Get entities from registry state (from initActions SEARCH_EVENT)
    final registryState = FlowCrudStateRegistry().get(_compositeKey);
    List<dynamic> entities = [];
    final base = registryState?.base;
    if (base is CrudStateLoaded) {
      for (final entityList in base.results.values) {
        entities.addAll(entityList);
      }
    }
    if (entities.isEmpty) {
      entities = registryState?.stateWrapper ?? [];
    }

    Map<String, dynamic> contextData = {
      'formData': formData,
      'navigation': mergedNavParams,
      if (entities.isNotEmpty) 'entities': entities,
    };

    if (onSubmit != null) {
      // Clear form state via registry
      FormSubmissionRegistry().clearForm(_schemaKey);

      contextData = await ActionHandler.executeActions(
        onSubmit,
        context,
        contextData,
      );
    }
  }

  @override
  void dispose() {
    if (_isRegistered) {
      FormSubmissionRegistry().unregister(
        schemaKey: _schemaKey,
        instanceId: _instanceId,
      );
    }
    // Note: State disposal is handled by FlowBuilderHomePage using composite key
    // This ensures each page instance's state is disposed correctly
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenType = widget.config['screenType'];
    final screenKey = widget.config['name'];

    // No longer using BlocListener here - form submissions are handled centrally
    // Use compositeKey for FlowCrudStateRegistry to support multiple instances
    return ScreenKeyListener(
      screenKey: _compositeKey,
      builder: (context, crudState) {
        return _buildScreen(
          context,
          screenType,
          widget.config,
          crudState,
          screenKey,
        );
      },
    );
  }

  Widget _buildScreen(
    BuildContext context,
    String screenType,
    Map<String, dynamic> config,
    FlowCrudState? crudState,
    String screenKey,
  ) {
    if (screenType == 'FORM') {
      final schemaKey = config['name'] ?? '';
      final defaultValues = config['defaultValues'] as Map<String, dynamic>?;

      // Build secondary action callback from screen-level onSecondaryAction
      final secondaryActions = config['onSecondaryAction'] as List<dynamic>?;
      VoidCallback? onSecondaryAction;
      if (secondaryActions != null) {
        onSecondaryAction = () {
          final navParams = {
            ...?widget.navigationParams,
          };

          // Get entities from registry - try base results first, then stateWrapper
          final registryState = FlowCrudStateRegistry().get(_compositeKey);
          List<dynamic> entities = [];
          final base = registryState?.base;
          if (base is CrudStateLoaded) {
            for (final entityList in base.results.values) {
              entities.addAll(entityList);
            }
          }
          if (entities.isEmpty) {
            entities = registryState?.stateWrapper ?? [];
          }

          // Get form data from registry
          final formData = registryState?.formData ?? {};

          ActionHandler.executeActions(
            secondaryActions,
            context,
            {
              'formData': formData,
              'navigation': navParams,
              'entities': entities,
            },
          );
        };
      }

      return _FormScreenWrapper(
        schemaKey: schemaKey,
        defaultValues: defaultValues,
        navigationParams: widget.navigationParams,
        compositeKey: _compositeKey,
        onSecondaryAction: onSecondaryAction,
      );
    } else if (screenType == 'TEMPLATE') {
      return LayoutRendererPage(
        config: config,
        compositeKey: _compositeKey,
      );
    } else {
      return const Center(child: Text('Unsupported screen type'));
    }
  }
}

class _FormScreenWrapper extends LocalizedStatefulWidget {
  final String schemaKey;
  final Map<String, dynamic>? defaultValues;
  final Map<String, dynamic>? navigationParams;
  final String compositeKey;
  final VoidCallback? onSecondaryAction;

  const _FormScreenWrapper({
    required this.schemaKey,
    this.defaultValues,
    this.navigationParams,
    required this.compositeKey,
    this.onSecondaryAction,
  });

  @override
  State<_FormScreenWrapper> createState() => _FormScreenWrapperState();
}

class _FormScreenWrapperState extends LocalizedState<_FormScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    // Use compositeKey passed from ScreenBuilder for consistency
    final compositeKey = widget.compositeKey;

    // Listen to FlowCrudStateRegistry for formData changes (from REVERSE_TRANSFORM action)
    return ValueListenableBuilder(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, _, __) {
        final flowState = FlowCrudStateRegistry().get(compositeKey);

        // Get the latest navigation params from registry (may have been updated by actions)
        // Try multiple key formats for robust retrieval
        final registryNavParams =
            FlowCrudStateRegistry().getNavigationParams(compositeKey);

        // Extract instanceId from compositeKey (format: screenKey::instanceId)
        final instanceId =
            compositeKey.contains('::') ? compositeKey.split('::').last : null;

        // Merge widget.navigationParams with registry params (registry takes precedence)
        // Include _instanceId to ensure FormsRenderPage can use it as key for fresh FormGroup
        final mergedNavParams = <String, dynamic>{
          ...?widget.navigationParams,
          ...?registryNavParams,
          if (instanceId != null) '_instanceId': instanceId,
        };

        return BlocBuilder<FormsBloc, FormsState>(builder: (context, state) {
          if (state.initialSchemas[widget.schemaKey] != null) {
            final schemaObject = state.cachedSchemas[widget.schemaKey]!;

            // [OPTIONAL] Support for startPage navigation parameter.
            // If 'startPage' is provided in navigation params and exists in the schema,
            // use it as the initial page. Otherwise, fall back to the first page.
            // This allows CONDITIONAL_NAVIGATION to skip to a specific page in a flow.
            // To disable this feature, simply don't pass 'startPage' in navigation params.
            final startPage = mergedNavParams['startPage'] as String?;
            final pageName = (startPage != null &&
                    startPage.isNotEmpty &&
                    schemaObject.pages.containsKey(startPage))
                ? startPage
                : schemaObject.pages.entries.first.key;

            // Determine isEdit from merged navigation params (set by NAVIGATION action)
            final isEdit = mergedNavParams['isEdit'] == true ||
                mergedNavParams['isEdit'] == 'true';

            // Get formData from FlowCrudStateRegistry (set by REVERSE_TRANSFORM action)
            final registryFormData = flowState?.formData ?? {};

            return ScannerComparisonProvider(
              duplicateCheckFn: (fieldName, scannedValue, formValues) {
                // Read the latest cached schema at call time (not build time)
                // to ensure cross-page field values are up to date.
                final latestSchema = context
                    .read<FormsBloc>()
                    .state
                    .cachedSchemas[widget.schemaKey];
                return ScannerComparisonUtils.executeDuplicateCheck(
                  latestSchema ?? schemaObject,
                  widget.compositeKey,
                  fieldName,
                  scannedValue,
                  formValues,
                  mergedNavParams,
                );
              },
              duplicateErrorMessage: (fieldName) =>
                  ScannerComparisonUtils.getDuplicateErrorMessage(
                      schemaObject, fieldName),
              child: FormsRenderPage(
                pageName: pageName,
                navigationParams: mergedNavParams,
                currentSchemaKey: widget.schemaKey,
                isEdit: isEdit,
                onSecondaryAction: widget.onSecondaryAction,
                // Pass custom components from registry with enhanced state access
                customComponents: _buildCustomComponents(
                  context,
                  flowState,
                ),
                // defaultValues priority (lowest to highest):
                // 1. widget.defaultValues - config-defined defaults
                // 2. mergedNavParams - navigation data merged from widget and registry
                // 3. registryFormData - data from REVERSE_TRANSFORM action (highest priority for prefill)
                // 4. System values like administrativeArea, availableIDs
                defaultValues: {
                  ...?widget.defaultValues,
                  ...mergedNavParams,
                  if (isEdit) ...registryFormData,
                  // System values always present
                  'administrativeArea': localizations
                      .translate(FlowBuilderSingleton().boundary?.code ?? ''),
                  'availableIDs': {'DEFAULT': IdGen.instance.identifier},
                  'loggedInUserName': FlowBuilderSingleton().loggedInUser?.name,
                  'loggedInUserUuid': FlowBuilderSingleton().loggedInUser?.uuid,
                  'loggedInUserMobileNumber':
                      FlowBuilderSingleton().loggedInUser?.mobileNumber,
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
      },
    );
  }

  /// Build custom components with enhanced state access
  List<Map<String, Widget>>? _buildCustomComponents(
    BuildContext context,
    FlowCrudState? flowState,
  ) {
    if (CustomComponentRegistry().isEmpty) return null;

    final Map<String, Widget> components = {};
    final registry = CustomComponentRegistry();

    // Use the correct screen key format for FORM screens
    final screenKey = widget.schemaKey;

    // For each component, create a PageStateAccessor for this page
    for (final componentKey in registry.getRegisteredKeys()) {
      final stateAccessor = PageStateAccessor(screenKey);

      final component = registry.buildComponent(
        componentKey,
        context,
        screenKey, // Use full screen key format
      );

      if (component != null) {
        components[componentKey] = component;
      }
    }

    return components.isNotEmpty ? [components] : null;
  }
}
