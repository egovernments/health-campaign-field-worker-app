import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:attendance_management/blocs/app_localization.dart';
import '../../utils/i18_key_constants.dart' as i18;

class CustomAttendanceInfoCard extends StatelessWidget {
  final String name;
  final String individualNumber;
  final double? status;
  final VoidCallback onMarkPresent;
  final VoidCallback onMarkAbsent;
  final bool markManualAttendance;

  const CustomAttendanceInfoCard({
    super.key,
    required this.name,
    required this.individualNumber,
    required this.status,
    required this.onMarkPresent,
    required this.onMarkAbsent,
    required this.markManualAttendance,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    var localizations = AttendanceLocalization.of(context);

    String? getStatusText() {
      if (status == 1) {
        return localizations.translate(i18.attendance.markedAsPresent);
      }
      if (status == 0) {
        return localizations.translate(i18.attendance.markedAsAbsent);
      }
      return null;
    }

    Color? getStatusColor() {
      if (status == 1) return theme.colorTheme.alert.success;
      if (status == 0) return theme.colorTheme.alert.error;
      return null;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(),
        color: const DigitColors().light.paperSecondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: textTheme.headingS),
          Offstage(),
          Text(
            localizations.translate(i18.attendance.distributorLabel),
            style: textTheme.bodyXS,
          ),
          Offstage(),
          Text(
            getStatusText() ??
                localizations.translate(i18.attendance.markAttendanceLabel),
            style: textTheme.bodyXS.copyWith(
              color: getStatusColor() ?? theme.colorTheme.alert.warning,
            ),
          ),
<<<<<<< HEAD
          Offstage(),
=======
          const SizedBox(height: 2),
          Text(
            "Distributor",
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          if (markManualAttendance || status != null) ...[
            Text(
              getStatusText() ?? "Attendance Unmarked",
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: getStatusColor() ?? Colors.orange,
              ),
            ),
            const SizedBox(height: 6),
          ],
>>>>>>> ffdc662e42c5dcf57c4863455239890597cccc57
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(),
              color: const DigitColors().light.genericBackground,
            ),
            child: Center(
              child: Text(individualNumber, style: textTheme.bodyS),
            ),
          ),
          Offstage(),
          if (status == -1 || status == null)
            Row(
              children: [
                Expanded(
                  child: DigitButton(
                    prefixIcon: Icons.check,
                    label: localizations.translate(i18.attendance.present),
                    capitalizeLetters: true,
                    textColor: theme.colorTheme.alert.success,
                    iconColor: theme.colorTheme.alert.success,
                    isDisabled: false,
                    onPressed: onMarkPresent,
                    type: DigitButtonType.secondary,
                    size: DigitButtonSize.small,
                    digitButtonThemeData: DigitButtonThemeData(
                      DigitButtonColor: theme.colorTheme.alert.success,
                      disabledColor:
                          theme.colorTheme.alert.success.withOpacity(0.4),
                      borderWidth: 1.2,
                      radius: BorderRadius.circular(6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      DigitButtonHoverBoxShadow: [
                        BoxShadow(
                          color:
                              theme.colorTheme.alert.success.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 0.5,
                          offset: const Offset(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DigitButton(
                    prefixIcon: Icons.cancel,
                    label: localizations.translate(i18.attendance.absent),
                    capitalizeLetters: true,
                    textColor: theme.colorTheme.alert.error,
                    iconColor: theme.colorTheme.alert.error,
                    isDisabled: false,
                    onPressed: onMarkAbsent,
                    type: DigitButtonType.secondary,
                    size: DigitButtonSize.small,
                    digitButtonThemeData: DigitButtonThemeData(
                      DigitButtonColor: theme.colorTheme.alert.error,
                      disabledColor:
                          theme.colorTheme.alert.error.withOpacity(0.4),
                      borderWidth: 1.2,
                      radius: BorderRadius.circular(6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      DigitButtonHoverBoxShadow: [
                        BoxShadow(
                          color: theme.colorTheme.alert.error.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 0.5,
                          offset: const Offset(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
