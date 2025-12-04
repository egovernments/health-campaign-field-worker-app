import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/flow_crud_bloc.dart';
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
  @override
  void initState() {
    super.initState();

    if (mounted) {
      final initActions = widget.config['initActions'] as List? ?? [];
      WidgetsBinding.instance.addPostFrameCallback((_) {
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

  @override
  Widget build(BuildContext context) {
    final screenType = widget.config['screenType'];
    final screenKey = '$screenType::${widget.config['name']}';
    return ScreenKeyListener(
      screenKey: screenKey,
      builder: (context, crudState) {
        return BlocListener<FormsBloc, FormsState>(
          listener: (context, state) async {
            debugPrint('SCREEN_BUILDER: FormsBloc state changed: ${state.runtimeType}');
            if (state is FormsSubmittedState) {
              debugPrint('SCREEN_BUILDER: FormsSubmittedState - activeSchemaKey=${state.activeSchemaKey}, config name=${widget.config['name']}');
            }
            if (state is FormsSubmittedState &&
                widget.config['name'] == state.activeSchemaKey) {
              debugPrint('SCREEN_BUILDER: Matched! Executing onAction...');
              // final config = FlowRegistry.getByName(state.schema[]);///////
              final onSubmit = widget.config['onAction'] as List<dynamic>?;

              Map<String, dynamic> contextData = {
                'formData': state.formData,
                'navigation': widget.navigationParams ?? {},
              };

              debugPrint('SCREEN_BUILDER: onSubmit actions count: ${onSubmit?.length ?? 0}');
              debugPrint('SCREEN_BUILDER: navigation params: ${widget.navigationParams}');

              if (onSubmit != null) {
                context.read<FormsBloc>().add(
                      FormsEvent.clearForm(
                          schemaKey: widget.config['name'] ?? ''),
                    );
                contextData = await ActionHandler.executeActions(
                  onSubmit,
                  context,
                  contextData,
                );
              }
            }
          },
          child: _buildScreen(
            context,
            screenType,
            widget.config,
            crudState,
            screenKey,
          ),
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

        return BlocBuilder<FormsBloc, FormsState>(builder: (context, state) {
          if (state.initialSchemas[widget.schemaKey] != null) {
            final schemaObject = state.cachedSchemas[widget.schemaKey]!;

            // Derive pageName as first page key if none specified externally
            final pageName = schemaObject.pages.entries.first.key;

            // Determine isEdit from navigation params (set by NAVIGATION action)
            final isEdit = widget.navigationParams?['isEdit'] == true ||
                widget.navigationParams?['isEdit'] == 'true';

            // Get formData from FlowCrudStateRegistry (set by REVERSE_TRANSFORM action)
            final registryFormData = flowState?.formData ?? {};

            return FormsRenderPage(
              pageName: pageName,
              navigationParams: widget.navigationParams,
              currentSchemaKey: widget.schemaKey,
              isEdit: isEdit,
              // Pass custom components from registry with enhanced state access
              customComponents: _buildCustomComponents(
                context,
                flowState,
              ),
              // defaultValues priority (lowest to highest):
              // 1. navigationParams - basic navigation data
              // 2. widget.defaultValues - config-defined defaults
              // 3. registryFormData - data from REVERSE_TRANSFORM action (highest priority for prefill)
              // 4. System values like administrativeArea, availableIDs
              defaultValues: {
                ...?widget.navigationParams,
                ...?widget.defaultValues,
                ...registryFormData,
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
