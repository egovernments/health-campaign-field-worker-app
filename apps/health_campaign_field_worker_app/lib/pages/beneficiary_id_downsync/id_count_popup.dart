import 'dart:async';

import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/unique_beneficiary_id/unique_id.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/download_progress/download_progress_content.dart';

void showLowIdsAlert(
    {required BuildContext context,
      required AppLocalizations localizations,
      required int availableCount,
      required Function(bool proceed) shouldProceedFurther}) {
  showCustomPopup(
      context: context,
      builder: (ctx) {
        return Popup(
          type: PopUpType.alert,
          onCrossTap: () {
            Navigator.of(ctx).pop();
          },
          actions: [
            DigitButton(
              capitalizeLetters: false,
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              onPressed: () {
                Navigator.of(ctx).pop();
                context.read<UniqueIdBloc>().add(
                  const UniqueIdEvent.fetchUniqueIdsFromServer(),
                );
              },
              prefixIcon: Icons.download,
              label: localizations.translate(
                i18.beneficiaryId.downloadBeneficiaryIds,
              ),
            ),
            DigitButton(
              capitalizeLetters: false,
              type: DigitButtonType.tertiary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              onPressed: () {
                Navigator.of(ctx).pop();
                shouldProceedFurther(true);
              },
              label: localizations.translate(
                i18.home.coreCommonSkipContinue,
              ),
            ),
          ],
          title: localizations
              .translate(i18.beneficiaryId.lowBeneficiaryIdsLabel),
          description: localizations
              .translate(i18.beneficiaryId.lowBeneficiaryIdsAlertText)
              .replaceAll('{}', availableCount.toString()),
        );
      });
}

void showNoIdsAlert(
    {required BuildContext context,
      required AppLocalizations localizations,
      required bool showSkip,
      required Function(bool proceed) shouldProceedFurther}) {
  showCustomPopup(
      context: context,
      builder: (ctx) {
        return Popup(
          type: PopUpType.alert,
          onCrossTap: () {
            Navigator.of(ctx).pop();
          },
          actions: [
            DigitButton(
              capitalizeLetters: false,
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              mainAxisSize: MainAxisSize.max,
              onPressed: () {
                Navigator.of(ctx).pop();
                context.read<UniqueIdBloc>().add(
                  const UniqueIdEvent.fetchUniqueIdsFromServer(),
                );
              },
              prefixIcon: Icons.download,
              label: localizations.translate(
                i18.beneficiaryId.downloadBeneficiaryIds,
              ),
            ),
            if (showSkip)
              DigitButton(
                capitalizeLetters: false,
                type: DigitButtonType.tertiary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                onPressed: () {
                  Navigator.of(ctx).pop();
                  shouldProceedFurther(true);
                },
                label: localizations.translate(
                  i18.home.coreCommonSkipContinue,
                ),
              ),
          ],
          title: localizations
              .translate(i18.beneficiaryId.noBeneficiaryIdsLabel),
          description: localizations
              .translate(i18.beneficiaryId.noBeneficiaryIdsText),
        );
      });
}

class ProgressDialog {
  static final ProgressDialog _instance = ProgressDialog._internal();

  factory ProgressDialog() => _instance;

  ProgressDialog._internal();

  bool _isDialogShowing = false;
  BuildContext? _dialogContext;
  StateSetter? _setState;

  int _currentCount = 0;
  int _totalCount = 0;
  AppLocalizations? _localizations;
  ThemeData? _theme;

  /// Shows the progress popup (only once)
  Future<void> showProgressDialog({
    required BuildContext context,
    required AppLocalizations localizations,
    required int currentCount,
    required int totalCount,
    required ThemeData theme,
  }) async {
    if (_isDialogShowing) return;

    _isDialogShowing = true;
    _currentCount = currentCount;
    _totalCount = totalCount;
    _localizations = localizations;
    _theme = theme;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        _dialogContext = dialogContext;
        return StatefulBuilder(
          builder: (ctx, setState) {
            _setState = setState;

            double progressValue =
            (_currentCount / _totalCount).clamp(0.0, 1.0);

            return Popup(
              type: PopUpType.simple,
              title: '',
              additionalWidgets: [
                DownloadProgressContent(
                  title: _localizations!.translate(
                    i18.beneficiaryId.downloadBeneficiaryIds,
                  ),
                  progress: progressValue,
                  countLabel: '$_currentCount/$_totalCount',
                ),
                progressValue == 1.0
                    ? DigitButton(
                        capitalizeLetters: false,
                        type: DigitButtonType.secondary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          context
                              .read<UniqueIdBloc>()
                              .add(const UniqueIdEvent.fetchIdCount());
                        },
                        label: localizations.translate(
                          i18.common.corecommonclose,
                        ),
                      )
                    : const Offstage(),
              ],
            );
          },
        );
      },
    ).whenComplete(() {
      _isDialogShowing = false;
      _dialogContext = null;
      _setState = null;
    });
  }

  /// Updates the progress inside the same dialog
  void updateProgressDialog({
    required int currentCount,
    required int totalCount,
  }) {
    if (_isDialogShowing && _setState != null) {
      _currentCount = currentCount;
      _totalCount = totalCount;
      _setState!.call(() {});
    }
  }

  /// Closes the dialog safely
  void closeProgressDialog() {
    if (_isDialogShowing && _dialogContext != null) {
      Navigator.of(_dialogContext!, rootNavigator: true).pop();
      _isDialogShowing = false;
      _dialogContext = null;
      _setState = null;
    }
  }

  void dispose() {
    _isDialogShowing = false;
    _dialogContext = null;
    _setState = null;
  }

  bool get isShowing => _isDialogShowing;
}