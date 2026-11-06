import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      padding: const EdgeInsets.fromLTRB(spacer4, spacer4, spacer4, 0),
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
                      // onPressed: () {
                      //   context.read<AuthBloc>().add(const AuthLogoutEvent());
                      // },
                      onPressed: () async {
                        // Same confirmation popup as the drawer's logout.
                        final shouldLogout = await showCustomPopup(
                          context: context,
                          builder: (ctx) => Popup(
                            title: AppLocalizations.of(context).translate(
                              i18.common.logoutConfirmationHeading,
                            ),
                            description: AppLocalizations.of(context).translate(
                              i18.common.logoutConfirmationDescription,
                            ),
                            onOutsideTap: () {
                              Navigator.of(ctx).pop(false);
                            },
                            onCrossTap: () {
                              Navigator.of(ctx).pop(false);
                            },
                            type: PopUpType.simple,
                            inlineActions: true,
                            actions: [
                              DigitButton(
                                  label: AppLocalizations.of(context).translate(
                                    i18.common.coreCommonLogout,
                                  ),
                                  onPressed: () {
                                    Navigator.of(ctx).pop(true);
                                  },
                                  type: DigitButtonType.primary,
                                  size: DigitButtonSize.large),
                              DigitButton(
                                  label: AppLocalizations.of(context).translate(
                                    i18.common.coreCommonCancel,
                                  ),
                                  onPressed: () {
                                    Navigator.of(ctx).pop(false);
                                  },
                                  type: DigitButtonType.secondary,
                                  size: DigitButtonSize.large)
                            ],
                          ),
                        );

                        if (shouldLogout == true && context.mounted) {
                          // Wait out the popup's exit transition (300ms in
                          // showCustomPopup) before logging out.
                          await Future.delayed(
                              const Duration(milliseconds: 300));
                          if (!context.mounted) return;
                          context.read<AuthBloc>().add(const AuthLogoutEvent());
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
