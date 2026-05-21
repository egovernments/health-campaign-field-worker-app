import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
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
    final compositeKey = resolved.compositeKey;

    if (compositeKey == null) {
      return NoResultCard(
        label: resolved.resolveText(json['label']),
        description: resolved.resolveText(json['description']),
      );
    }

    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(compositeKey),
      builder: (context, flowState, _) {
        final showOnEmptySearch = json['showOnEmptySearch'] == true;
        if (showOnEmptySearch) {
          final base = flowState?.base;
          final stateWrapper = flowState?.stateWrapper;
          final hasSearchCompleted = base is CrudStateLoaded;
          final hasNoResults = stateWrapper == null || stateWrapper.isEmpty;
          if (!hasSearchCompleted || !hasNoResults) {
            return const SizedBox.shrink();
          }
        }

        return NoResultCard(
          label: resolved.resolveText(json['label']),
          description: resolved.resolveText(json['description']),
        );
      },
    );
  }
}

class NoResultCard extends StatelessWidget {
  final String? label;
  final String? description;
  final AlignmentGeometry align;
  final double padding;

  const NoResultCard({
    super.key,
    this.align = Alignment.center,
    this.padding = spacer4,
    required this.label,
    this.description,
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
                ),
                if (description != null) ...[
                  const SizedBox(height: spacer1),
                  Text(
                    description!,
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            )),
      ),
    );
  }
}
