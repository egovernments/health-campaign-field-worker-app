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

    if (screenType == 'FORM') {
      final schemaKey = config['name'] ?? '';
      final defaultValues = config['defaultValues'] as Map<String, dynamic>?;

      return _FormScreenWrapper(
        schemaKey: schemaKey,
        defaultValues: defaultValues,
      );
    } else if (screenType == 'TEMPLATE') {
      return LayoutRendererPage(config: config);
    } else {
      return const Center(child: Text('Unsupported screen type'));
    }
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
  bool _schemaLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormsBloc, FormsState>(
      listener: (context, state) {
        if (state.initialSchemas[widget.schemaKey] != null) {
          setState(() {
            _schemaLoaded = true;
          });
        }
      },
      child: _schemaLoaded
          ? Builder(builder: (context) {
              final schemaObject = context
                  .read<FormsBloc>()
                  .state
                  .cachedSchemas[widget.schemaKey]!;

              // Derive pageName as first page key if none specified externally
              final pageName = schemaObject.pages.entries.first.key;
              return FormsRenderPage(
                pageName: pageName,
                currentSchemaKey: widget.schemaKey,
                defaultValues: widget.defaultValues,
              );
            })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
