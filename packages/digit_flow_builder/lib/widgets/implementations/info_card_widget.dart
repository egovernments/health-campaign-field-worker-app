import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_info_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class InfoCardWidget implements FlowWidget {
  @override
  String get format => 'infoCard';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final items = crudCtx?.stateData?.rawState ?? [];
    if (items.isNotEmpty) return const SizedBox.shrink();
    return InfoCard(
      type: InfoType.info,
      title: json['label'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
