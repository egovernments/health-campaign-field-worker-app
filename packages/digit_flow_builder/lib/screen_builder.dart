import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:flutter/material.dart';

import 'layout_renderer.dart';

class ScreenBuilder extends StatelessWidget {
  final Map<String, dynamic> config;

  const ScreenBuilder({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final screenType = config['screenType'];

    if (screenType == 'FORM') {
      return const FormsRenderPage(
        pageName: '',
      );
    } else if (screenType == 'TEMPLATE') {
      return LayoutRendererPage(config: config);
    } else {
      return const Center(child: Text('Unsupported screen type'));
    }
  }
}
