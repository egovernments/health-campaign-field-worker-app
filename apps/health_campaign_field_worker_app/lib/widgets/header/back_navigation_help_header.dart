import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import '../../utils/utils.dart';

import '../../blocs/auth/auth.dart';
import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../showcase/showcase_button.dart';

class BackNavigationHelpHeaderWidget extends StatelessWidget {
  final bool showHelp;
  final bool showBackNavigation;
  final bool showLogoutCTA;
  final VoidCallback? helpClicked;
  final VoidCallback? handleback;
  final bool defaultPopRoute;
  final ShowcaseButton? showcaseButton;

  const BackNavigationHelpHeaderWidget({
    super.key,
    this.showHelp = true,
    this.showBackNavigation = true,
    this.showLogoutCTA = false,
    this.helpClicked,
    this.handleback,
    this.defaultPopRoute = true,
    this.showcaseButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (context.router.canPop() && showBackNavigation)
                  DigitBackButton(
                    digitBackButtonThemeData:
                        const DigitBackButtonThemeData().copyWith(
                      context: context,
                      backDigitButtonIcon: Icon(
                        Icons.arrow_left,
                        size: MediaQuery.of(context).size.width < 500
                            ? Theme.of(context).spacerTheme.spacer5
                            : Theme.of(context).spacerTheme.spacer6,
                        color: Theme.of(context).colorTheme.primary.primary2,
                      ),
                    ),
                    handleBack: () {
                      if (defaultPopRoute) {
                        context.router.maybePop();
                      }
                      handleback != null ? handleback!() : null;
                    },
                    label: AppLocalizations.of(context).translate(
                      i18.common.coreCommonBack,
                    ),
                  ),
                SizedBox(width: showBackNavigation ? 16 : 0),
                if (showLogoutCTA)
                  Flexible(
                    child: DigitButton(
                      capitalizeLetters: false,
                      onPressed: () async {
                        final isar = context.read<Isar>();
                        final userId = context.loggedInUserUuid;
                        final pendingCount = await isar.opLogs
                            .filter()
                            .createdByEqualTo(userId)
                            .syncedUpEqualTo(false)
                            .count();

                        if (!context.mounted) return;

                        if (pendingCount > 0) {
                          DigitSyncDialog.show(
                            context,
                            type: DialogType.inProgress,
                            label: AppLocalizations.of(context).translate(
                              i18.syncDialog.pendingSyncLabel,
                            ),
                            primaryAction: DigitDialogActions(
                              label: AppLocalizations.of(context).translate(
                                i18.home.syncDataLabel,
                              ),
                              action: (ctx) {
                                Navigator.pop(ctx);
                                performBackgroundService(
                                  context: context,
                                  stopService: false,
                                  isBackground: false,
                                );
                              },
                            ),
                            secondaryAction: DigitDialogActions(
                              label: AppLocalizations.of(context).translate(
                                i18.common.corecommonclose,
                              ),
                              action: (ctx) => Navigator.pop(ctx),
                            ),
                            barrierDismissible: false,
                          );
                        } else {
                          context
                              .read<AuthBloc>()
                              .add(const AuthLogoutEvent());
                        }
                      },
                      prefixIcon: Icons.logout_outlined,
                      label: AppLocalizations.of(context).translate(
                        i18.common.coreCommonLogout,
                      ),
                      type: DigitButtonType.tertiary,
                      size: DigitButtonSize.medium,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: showHelp ? 16 : 0),
          if (showHelp)
            DigitButton(
              isDisabled: helpClicked == null,
              label: AppLocalizations.of(context)
                  .translate(i18.common.coreCommonHelp),
              type: DigitButtonType.tertiary,
              size: DigitButtonSize.medium,
              suffixIcon: Icons.help_outline_outlined,
              // style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => helpClicked,
            ),
          SizedBox(width: showcaseButton != null ? spacer4 : 0),
          if (showcaseButton != null) showcaseButton!,
        ],
      ),
    );
  }
}
