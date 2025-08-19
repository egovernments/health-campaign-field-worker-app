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

  const ScreenBuilder({super.key, required this.config});

  @override
  State<ScreenBuilder> createState() => _ScreenBuilderState();
}

class _ScreenBuilderState extends State<ScreenBuilder> {
  @override
  void initState() {
    super.initState();

    if (mounted) {
      final initActions = widget.config['initActions'] as List? ?? [];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        for (final action in initActions) {
          final parsed = ActionConfig.fromJson(action); // you already have this
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
            if (state is FormsSubmittedState) {
              final onSubmit = widget.config['onSubmit'] as List<dynamic>?;

              Map<String, dynamic> contextData = {
                'formData': state.formData,
              };

              if (onSubmit != null) {
                context.read<FormsBloc>().add(
                      FormsEvent.clearForm(
                          schemaKey: widget.config['name'] ?? ''),
                    );
                for (final actionJson in onSubmit) {
                  final action = ActionConfig.fromJson(actionJson);
                  contextData =
                      await ActionHandler.execute(action, context, contextData);
                }
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

  const _FormScreenWrapper({
    required this.schemaKey,
    this.defaultValues,
  });

  @override
  State<_FormScreenWrapper> createState() => _FormScreenWrapperState();
}

class _FormScreenWrapperState extends LocalizedState<_FormScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsBloc, FormsState>(builder: (context, state) {
      if (state.initialSchemas[widget.schemaKey] != null) {
        final schemaObject = state.cachedSchemas[widget.schemaKey]!;

        // Derive pageName as first page key if none specified externally
        final pageName = schemaObject.pages.entries.first.key;
        return FormsRenderPage(
          pageName: pageName,
          currentSchemaKey: widget.schemaKey,
          // defaultValues: widget.defaultValues,
          /// TODO: adding default dummy data for create
          defaultValues: {
            'administrativeArea': localizations
                .translate(FlowBuilderSingleton().boundary?.code ?? ''),
            'availableIDs': {'DEFAULT': IdGen.instance.identifier}
          },
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
