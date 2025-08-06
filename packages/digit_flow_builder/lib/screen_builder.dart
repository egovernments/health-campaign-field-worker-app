import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flow_builder.dart';

class ScreenBuilder extends StatelessWidget {
  final Map<String, dynamic> config;

  const ScreenBuilder({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final screenType = config['screenType'];

    Widget screen;

    if (screenType == 'FORM') {
      final schemaKey = config['name'] ?? '';
      final defaultValues = config['defaultValues'] as Map<String, dynamic>?;

      screen = _FormScreenWrapper(
        schemaKey: schemaKey,
        defaultValues: defaultValues,
      );
    } else if (screenType == 'TEMPLATE') {
      screen = LayoutRendererPage(config: config);
    } else {
      screen = const Center(child: Text('Unsupported screen type'));
    }

    return BlocListener<FormsBloc, FormsState>(
      listener: (context, state) async {
        if (state is FormsSubmittedState) {
          final onSubmit = config['onSubmit'] as List<dynamic>?;

          // Build initial contextData (add more as needed)
          Map<String, dynamic> contextData = {
            'formData': state.formData,
            // Add user, project, etc. here if needed
          };

          if (onSubmit != null) {
            for (final actionJson in onSubmit) {
              final action = ActionConfig.fromJson(actionJson);
              contextData =
                  await ActionHandler.execute(action, context, contextData);
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Successfully saved')),
            );
          }
        }
      },
      child: screen,
    );
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
