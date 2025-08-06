import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout_renderer.dart';

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
      listener: (context, state) {
        if (state is FormsSubmittedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Successfully saved')),
          );
        }
      },
      child: screen,
    );
  }
}

class _FormScreenWrapper extends StatefulWidget {
  final String schemaKey;
  final Map<String, dynamic>? defaultValues;

  const _FormScreenWrapper({
    required this.schemaKey,
    this.defaultValues,
  });

  @override
  State<_FormScreenWrapper> createState() => _FormScreenWrapperState();
}

class _FormScreenWrapperState extends State<_FormScreenWrapper> {
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
          defaultValues: widget.defaultValues,
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
