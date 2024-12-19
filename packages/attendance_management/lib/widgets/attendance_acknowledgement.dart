import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../../../widgets/localized.dart';
import '../blocs/app_localization.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class AttendanceAcknowledgementPage extends LocalizedStatefulWidget {
  final String label;
  final String? subLabel;
  final String? description;
  final Widget? descriptionWidget;
  final VoidCallback? action;
  final String? actionLabel;
  final bool enableBackToSearch;
  final VoidCallback? secondaryAction;
  final String? secondaryLabel;

  const AttendanceAcknowledgementPage({
    super.key,
    super.appLocalizations,
    required this.label,
    this.subLabel,
    this.description,
    this.descriptionWidget,
    this.action,
    this.actionLabel,
    this.enableBackToSearch = true,
    this.secondaryAction,
    this.secondaryLabel,
  });

  @override
  State<AttendanceAcknowledgementPage> createState() =>
      _AttendanceAcknowledgementPageState();
}

class _AttendanceAcknowledgementPageState
    extends State<AttendanceAcknowledgementPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var localizations = AttendanceLocalization.of(context);

    return Scaffold(
        body: ScrollableContent(
      children: [
        PanelCard(
            type: PanelType.success,
            title: widget.label,
            description: widget.description ??
                localizations.translate(
                  i18.acknowledgementSuccess.acknowledgementDescriptionText,
                ),
            actions: [
              DigitButton(
                label: widget.actionLabel ?? '',
                onPressed: widget.action ?? () {},
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
              ),
              DigitButton(
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large,
                label: widget.secondaryLabel ?? '',
                onPressed: widget.secondaryAction ?? () {},
              ),
            ]),
      ],
    ));
  }
}
