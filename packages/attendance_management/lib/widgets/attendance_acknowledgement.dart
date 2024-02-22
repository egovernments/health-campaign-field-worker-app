import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:digit_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';

import '../../../widgets/localized.dart';
import '../blocs/app_localization.dart';
import '../utils/i18_key_constants.dart' as i18;

class AttendanceAcknowledgementPage extends LocalizedStatefulWidget {
  final String label;
  final String? subLabel;
  final String? description;
  final Widget? descriptionWidget;
  final IconData icon;
  final VoidCallback? action;
  final String? actionLabel;
  final Color color;
  final bool enableBackToSearch;
  final VoidCallback? secondaryAction;
  final String? secondaryLabel;

  AttendanceAcknowledgementPage({
    super.key,
    super.appLocalizations,
    required this.label,
    this.subLabel,
    this.description,
    this.descriptionWidget,
    this.action,
    this.actionLabel,
    IconData? icon,
    Color? color,
    this.enableBackToSearch = true,
    this.secondaryAction,
    this.secondaryLabel,
  })  : color = color ?? DigitTheme.instance.colors.darkSpringGreen,
        icon = icon ?? Icons.check_circle;

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
    final theme = Theme.of(context);
    var localizations = AttendanceLocalization.of(context);

    return Scaffold(
        body: ScrollableContent(
      children: [
        DigitCard(
          padding: EdgeInsets.zero,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kPadding * 2,
                vertical: kPadding * 4,
              ),
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height / 3,
              ),
              color: widget.color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    localizations.translate(
                      i18.attendance.attendanceSubmittedSuccessMsg,
                    ),
                    style: DigitTheme
                        .instance.mobileTheme.textTheme.displayMedium
                        ?.apply(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Padding(
                    padding: DigitTheme.instance.containerMargin,
                    child: Icon(
                      widget.icon,
                      size: 32,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: DigitTheme.instance.containerMargin,
              child: Align(
                alignment: Alignment.centerLeft,
                child: widget.descriptionWidget ??
                    Text(
                      widget.description ?? '',
                      style: theme.textTheme.bodyMedium,
                    ),
              ),
            ),
            if (widget.enableBackToSearch)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  kPadding,
                  kPadding,
                  kPadding,
                  kPadding * 2,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        DigitElevatedButton(
                          onPressed: widget.action,
                          child: Text(widget.actionLabel ?? ''),
                        ),
                        const SizedBox(
                          height: kPadding,
                        ),
                        if (widget.secondaryLabel != null)
                          DigitOutLineButton(
                            buttonStyle: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              minimumSize: Size(
                                MediaQuery.of(context).size.width / 1,
                                50,
                              ),
                              shape: null,
                            ),
                            label: widget.secondaryLabel ?? '',
                            onPressed: widget.secondaryAction,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
          ]),
        ),
      ],
    ));
  }
}
