import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../action_handler/action_config.dart';
import '../resolved_flow_widget.dart';

class NoResultCardWidget extends ResolvedFlowWidget {
  @override
  String get format => 'noResultCard';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    // Visibility already checked by base class
    return NoResultCard(label: resolved.resolveText(json['label']));
  }
}

class NoResultCard extends StatelessWidget {
  final String? label;
  final AlignmentGeometry align;
  final double padding;

  const NoResultCard({
    super.key,
    this.align = Alignment.center,
    this.padding = spacer4,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const String noResultSvg = 'assets/icons/svg/no_result.svg';

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(spacer1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(noResultSvg),
                Text(
                  label ?? '',
                  style: theme.textTheme.bodyMedium,
                )
              ],
            )),
      ),
    );
  }
}
