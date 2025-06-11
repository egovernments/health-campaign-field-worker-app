import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/app_initialization/app_initialization.dart';
import '../../router/app_router.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/non_mobile_user/non_mobile_user_card.dart';
import '../../widgets/non_mobile_user/show_qr_code_non_system_user.dart';

@RoutePage()
class NonMobileUserListPage extends LocalizedStatefulWidget {
  const NonMobileUserListPage({super.key});

  @override
  State<NonMobileUserListPage> createState() => _NonMobileUserListPageState();
}

class _NonMobileUserListPageState
    extends LocalizedState<NonMobileUserListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Scaffold(
      bottomNavigationBar:
          DigitCard(margin: const EdgeInsets.only(top: spacer2), children: [
        DigitButton(
          mainAxisSize: MainAxisSize.max,
          label: localizations.translate(
            i18.common.coreCommonGoback,
          ),
          type: DigitButtonType.primary,
          size: DigitButtonSize.large,
          onPressed: () {
            context.router.replace(HomeRoute());
          },
        ),
      ]),
      body: BlocBuilder<AppInitializationBloc, AppInitializationState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Offstage(),
            initialized: (
              appConfiguration,
              _,
              __,
            ) =>
                ScrollableContent(
              header: const BackNavigationHelpHeaderWidget(
                showHelp: false,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(spacer2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      localizations.translate(
                        //TODO: TO append the total count of non- system users
                        i18.nonMobileUser.nonMobileUserLabel,
                      ),
                      style: textTheme.headingXl
                          ?.copyWith(color: theme.colorScheme.primary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                ...List.generate(5, (x) {
                  return NonMobileUserCard(
                    userName: 'Pitabash $x',
                    role: 'distributor $x',
                    age: (x + 1).toString(),
                    onScanMe: (value) {
                      showQRForNonMobileUser(
                          context: context,
                          localizations: localizations,
                          textTheme: textTheme);
                    },
                    gender: "male",
                    mobilenumber: "+98 9898989890",
                  );
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
