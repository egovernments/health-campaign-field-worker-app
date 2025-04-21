import 'dart:async';

import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../blocs/app_localization.dart';
import '../../blocs/unique_id/unique_id.dart';
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18;

void showLowIdsAlert(
    {required BuildContext context,
    required RegistrationDeliveryLocalization localizations,
    required Function(bool proceed) shouldProceedFurther}) {
  showCustomPopup(
      context: context,
      builder: (ctx) {
        return Popup(
          type: PopUpType.alert,
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
                i18.beneficiaryDetails.downloadBeneficiaryIds,
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
                i18.common.coreCommonSkipContinue,
              ),
            ),
          ],
          title: localizations
              .translate(i18.beneficiaryDetails.lowBeneficiaryIdsLabel),
          description: localizations
              .translate(i18.beneficiaryDetails.lowBeneficiaryIdsText),
        );
      });
}

void showNoIdsAlert(
    {required BuildContext context,
    required RegistrationDeliveryLocalization localizations}) {
  showCustomPopup(
      context: context,
      builder: (ctx) {
        return Popup(
          type: PopUpType.alert,
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
                i18.beneficiaryDetails.downloadBeneficiaryIds,
              ),
            ),
          ],
          title: localizations
              .translate(i18.beneficiaryDetails.noBeneficiaryIdsLabel),
          description: localizations
              .translate(i18.beneficiaryDetails.noBeneficiaryIdsText),
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
  RegistrationDeliveryLocalization? _localizations;
  ThemeData? _theme;

  /// Shows the progress popup (only once)
  Future<void> showProgressDialog({
    required BuildContext context,
    required RegistrationDeliveryLocalization localizations,
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
                progressValue == 1.0
                    ? Center(
                        child: Lottie.asset(
                          Constants.downloadSuccessAnimation,
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      )
                    : Center(
                        child: Lottie.asset(
                          Constants.downloadAnimation,
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ),
                Center(
                  child: Text(
                    _localizations!.translate(
                      i18.beneficiaryDetails.downloadBeneficiaryIds,
                    ),
                    style: _theme?.digitTextTheme(context).headingM.copyWith(
                          color: theme.colorTheme.primary.primary2,
                        ),
                  ),
                ),
                const SizedBox(height: spacer2 * 2),
                LinearProgressIndicator(
                  value: progressValue,
                  minHeight: spacer1,
                  color: _theme!.colorTheme.alert.success,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(spacer2)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    progressValue == 1.0
                        ? Text(
                            _localizations!.translate(
                                i18.beneficiaryDetails.downloadcompleted),
                            style: TextStyle(
                              fontSize: 15,
                              color: _theme!.colorTheme.text.primary,
                            ),
                          )
                        : Text(
                            _localizations!
                                .translate(i18.common.coreCommonDownloading),
                            style: TextStyle(
                              fontSize: 15,
                              color: _theme!.colorTheme.text.primary,
                            ),
                          ),
                    Text(
                      '$_currentCount/$_totalCount',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: _theme!.colorTheme.text.primary,
                      ),
                    ),
                  ],
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
                    : const Offstage()
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
