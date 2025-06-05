import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/app_initialization/app_initialization.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../router/app_router.dart';
import '../../widgets/non_system_user/non_system_user_card.dart';

@RoutePage()
class NonSystemUserListPage extends LocalizedStatefulWidget {
  const NonSystemUserListPage({super.key});

  @override
  State<NonSystemUserListPage> createState() => _NonSystemUserListPageState();
}

class _NonSystemUserListPageState
    extends LocalizedState<NonSystemUserListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Scaffold(
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
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    DigitButton(
                      mainAxisSize: MainAxisSize.max,
                      label: localizations.translate(
                        i18.acknowledgementSuccess.goToHome,
                      ),
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      onPressed: () {
                        context.router.replace(HomeRoute());
                      },
                    ),
                  ]),
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
                        "Non system users (5)",
                      ),
                      style: textTheme.headingXl,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                ...List.generate(5, (x) {
                  return const NonSystemUserCard();
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
