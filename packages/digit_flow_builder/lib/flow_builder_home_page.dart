import 'package:auto_route/annotations.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:flutter/material.dart';

import 'flow_builder.dart';

@RoutePage()
class FlowBuilderHomePage extends LocalizedStatefulWidget {
  final String pageName;

  const FlowBuilderHomePage({super.key, required this.pageName});

  @override
  State<FlowBuilderHomePage> createState() => _FlowBuilderHomePageState();
}

class _FlowBuilderHomePageState extends State<FlowBuilderHomePage> {
  @override
  Widget build(BuildContext context) {
    final config = FlowRegistry.getByName(widget.pageName);
    if (config == null) return const Center(child: Text('Page not found'));

    return ScreenBuilder(config: config);
  }
}
