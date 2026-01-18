import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_flow_builder/blocs/search_state_manager.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
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

  const ScreenBuilder({super.key, required this.config, this.navigationParams});

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
  bool _isRegistered = false;

  @override
  void initState() {
    super.initState();
    _schemaKey = widget.config['name'] ?? '';
    _instanceId =
        '${_schemaKey}_${hashCode}_${DateTime.now().millisecondsSinceEpoch}';

    // Clear SearchStateManager for this screen on init
    // This ensures fresh state when same page is pushed again
    final screenType = widget.config['screenType'] ?? 'TEMPLATE';
    final fullScreenKey = '$screenType::$_schemaKey';
    SearchStateManager().clear(fullScreenKey);

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

    // Get navigation params
    final screenKey = 'FORM::$_schemaKey';
    final registryNavParams =
        FlowCrudStateRegistry().getNavigationParams(screenKey) ??
            FlowCrudStateRegistry().getNavigationParams(_schemaKey) ??
            {};
    final mergedNavParams = {
      ...?widget.navigationParams,
      ...registryNavParams,
    };

    Map<String, dynamic> contextData = {
      'formData': formData,
      'navigation': mergedNavParams,
    };

    final pages = widget.config['pages'] as List<dynamic>?;

    debugPrint('FORM_SUBMIT: formData keys: ${formData.keys.toList()}');
    debugPrint('FORM_SUBMIT: navigation params: $mergedNavParams');
    debugPrint('FORM_SUBMIT: pages count: ${pages?.length ?? 0}');

    if (pages != null && pages.isNotEmpty) {
      // Collect all MERGE_UPDATE actions from pages that have data in formData
      final mergeActions = <Map<String, dynamic>>[];
      Map<String, dynamic>? lastPageWithData;
      double lastPageOrder = -1;

      for (final page in pages) {
        if (page is Map<String, dynamic>) {
          final pageName = page['page'] as String?;
          final pageOrder = (page['order'] as num?)?.toDouble() ?? 0;
          final pageOnAction = page['onAction'] as List<dynamic>?;

          debugPrint('FORM_SUBMIT: Checking page $pageName, order: $pageOrder, hasOnAction: ${pageOnAction != null}');

          if (pageName == null) continue;

          // Check if this page has data in formData
          // formData is structured as: { "pageName": { "field1": value, "field2": value } }
          final pageData = formData[pageName];
          final hasPageData = pageData != null &&
              pageData is Map &&
              pageData.isNotEmpty;

          debugPrint('FORM_SUBMIT: Page $pageName hasPageData: $hasPageData, pageData: $pageData');

          if (hasPageData && pageOnAction != null) {
            debugPrint('FORM_SUBMIT: Found data for page $pageName');

            // Collect MERGE_UPDATE_ADDITIONAL_FIELDS actions
            for (final action in pageOnAction) {
              if (action is Map<String, dynamic> &&
                  action['actionType'] == 'MERGE_UPDATE_ADDITIONAL_FIELDS') {
                mergeActions.add(action);
              }
            }

            // Track the last page with data (by order)
            if (pageOrder > lastPageOrder) {
              lastPageOrder = pageOrder;
              lastPageWithData = page;
            }
          }
        }
      }

      // Clear form state via registry
      FormSubmissionRegistry().clearForm(_schemaKey);

      // Execute all MERGE_UPDATE actions first
      if (mergeActions.isNotEmpty && mounted) {
        debugPrint('FORM_SUBMIT: Executing ${mergeActions.length} merge actions');
        contextData = await ActionHandler.executeActions(
          mergeActions,
          context,
          contextData,
        );
      }

      // Execute non-merge actions from the last page with data
      if (lastPageWithData != null && mounted) {
        final lastPageOnAction = lastPageWithData['onAction'] as List<dynamic>?;
        if (lastPageOnAction != null) {
          final nonMergeActions = lastPageOnAction
              .where((action) =>
                  action is Map<String, dynamic> &&
                  action['actionType'] != 'MERGE_UPDATE_ADDITIONAL_FIELDS')
              .toList();

          if (nonMergeActions.isNotEmpty && mounted) {
            debugPrint('FORM_SUBMIT: Executing ${nonMergeActions.length} non-merge actions from ${lastPageWithData['page']}');
            contextData = await ActionHandler.executeActions(
              nonMergeActions,
              context,
              contextData,
            );
          }
        }
      }
    } else {
      // Fallback to flow-level onAction if no pages
      final onSubmit = widget.config['onAction'] as List<dynamic>?;
      if (onSubmit != null && mounted) {
        FormSubmissionRegistry().clearForm(_schemaKey);
        contextData = await ActionHandler.executeActions(
          onSubmit,
          context,
          contextData,
        );
      }
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

    // Clean up state when page is removed from stack
    final screenType = widget.config['screenType'] ?? 'TEMPLATE';
    final fullScreenKey = '$screenType::$_schemaKey';

    // Clear SearchStateManager (filters, orderBy, pagination, callbacks)
    SearchStateManager().dispose(fullScreenKey);

    // Clear FlowCrudStateRegistry (formData, widgetData, stateWrapper)
    // Dispose both full screen key AND plain schema key to ensure all navigation params are cleared
    // Navigation params are stored with both keys (e.g., "FORM::ADD_MEMBER" and "ADD_MEMBER")
    FlowCrudStateRegistry().dispose(fullScreenKey);
    if (_schemaKey != fullScreenKey) {
      FlowCrudStateRegistry().dispose(_schemaKey);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenType = widget.config['screenType'];
    final screenKey = '$screenType::${widget.config['name']}';

    // No longer using BlocListener here - form submissions are handled centrally
    return ScreenKeyListener(
      screenKey: screenKey,
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

      return _FormScreenWrapper(
        schemaKey: schemaKey,
        defaultValues: defaultValues,
        navigationParams: widget.navigationParams,
      );
    } else if (screenType == 'TEMPLATE') {
      return LayoutRendererPage(
        config: config,
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

  const _FormScreenWrapper({
    required this.schemaKey,
    this.defaultValues,
    this.navigationParams,
  });

  @override
  State<_FormScreenWrapper> createState() => _FormScreenWrapperState();
}

class _FormScreenWrapperState extends LocalizedState<_FormScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    // Use the correct screen key format for FORM screens
    final screenKey = 'FORM::${widget.schemaKey}';

    // Listen to FlowCrudStateRegistry for formData changes (from REVERSE_TRANSFORM action)
    return ValueListenableBuilder(
      valueListenable: FlowCrudStateRegistry().listen(screenKey),
      builder: (context, _, __) {
        final flowState = FlowCrudStateRegistry().get(screenKey);

        // Get the latest navigation params from registry (may have been updated by actions)
        // Try multiple key formats for robust retrieval
        final registryNavParams =
            FlowCrudStateRegistry().getNavigationParams(screenKey) ??
                FlowCrudStateRegistry().getNavigationParams(widget.schemaKey) ??
                {};

        // Merge widget.navigationParams with registry params (registry takes precedence)
        final mergedNavParams = <String, dynamic>{
          ...?widget.navigationParams,
          ...registryNavParams,
        };

        return BlocBuilder<FormsBloc, FormsState>(builder: (context, state) {
          if (state.initialSchemas[widget.schemaKey] != null) {
            final schemaObject = state.cachedSchemas[widget.schemaKey]!;

            // Use startPage from navigation params if available, otherwise use first page
            final startPage = mergedNavParams['startPage'] as String?;
            final pageName = startPage != null &&
                    schemaObject.pages.containsKey(startPage)
                ? startPage
                : schemaObject.pages.entries.first.key;

            // Determine isEdit/isUpdate from merged navigation params (set by NAVIGATION action)
            // Support both 'isEdit' and 'isUpdate' flags for backward compatibility
            final isEdit = mergedNavParams['isEdit'] == true ||
                mergedNavParams['isEdit'] == 'true' ||
                mergedNavParams['isUpdate'] == true ||
                mergedNavParams['isUpdate'] == 'true';

            // Get formData from FlowCrudStateRegistry (set by REVERSE_TRANSFORM action)
            final registryFormData = flowState?.formData ?? {};

            debugPrint('FormScreen: isEdit=$isEdit, registryFormData keys: ${registryFormData.keys.toList()}');

            return FormsRenderPage(
              pageName: pageName,
              navigationParams: mergedNavParams,
              currentSchemaKey: widget.schemaKey,
              isEdit: isEdit,
              // Pass custom components from registry with enhanced state access
              customComponents: _buildCustomComponents(
                context,
                flowState,
              ),
              // defaultValues priority (lowest to highest):
              // 1. mergedNavParams - navigation data merged from widget and registry
              // 2. widget.defaultValues - config-defined defaults
              // 3. registryFormData - data from REVERSE_TRANSFORM action (highest priority for prefill)
              // 4. System values like administrativeArea, availableIDs
              defaultValues: {
                ...mergedNavParams,
                ...?widget.defaultValues,
                if(isEdit) ...registryFormData,
                // System values always present
                'administrativeArea': localizations
                    .translate(FlowBuilderSingleton().boundary?.code ?? ''),
                'availableIDs': {'DEFAULT': IdGen.instance.identifier},
                'loggedInUserName': FlowBuilderSingleton().loggedInUser?.name,
                'loggedInUserUuid': FlowBuilderSingleton().loggedInUser?.uuid,
                'loggedInUserMobileNumber':
                    FlowBuilderSingleton().loggedInUser?.mobileNumber,
              },
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
    final screenKey = 'FORM::${widget.schemaKey}';

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
