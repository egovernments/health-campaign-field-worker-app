import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tab.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../blocs/auth/auth.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

@RoutePage()
class UserQRDetailsPage extends LocalizedStatefulWidget {
  const UserQRDetailsPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<UserQRDetailsPage> createState() => _UserQRDetailsPageState();
}

class _UserQRDetailsPageState extends LocalizedState<UserQRDetailsPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        context.router.replaceAll([HomeRoute()]);
      },
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return ScrollableContent(
              enableFixedDigitButton: true,
              header: Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  handleback: () {
                    context.router.replaceAll([HomeRoute()]);
                  },
                  defaultPopRoute: false,
                ),
              ]),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    DigitButton(
                      label:
                          localizations.translate(i18.common.corecommonclose),
                      size: DigitButtonSize.large,
                      type: DigitButtonType.primary,
                      mainAxisSize: MainAxisSize.max,
                      onPressed: () {
                        context.router.replaceAll([HomeRoute()]);
                      },
                    ),
                  ]),
              children: [
                DigitTabBar(
                    initialIndex: selectedIndex,
                    tabs: ['INVENTORY', 'ATTENDANCE'],
                    onTabSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    }),
                selectedIndex == 0
                    ? state.maybeMap(
                        authenticated: (value) => Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.25,
                              height: MediaQuery.of(context).size.width / 1.25,
                              child: Padding(
                                padding: const EdgeInsets.all(spacer2),
                                child: Card(
                                  child: QrImageView(
                                    data: context.loggedInUserUuid,
                                    version: QrVersions.auto,
                                    size: MediaQuery.of(context).size.width /
                                        1.25,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: Text(
                                value.userModel.name.toString(),
                                style: DigitTheme.instance.mobileTheme.textTheme
                                    .headlineMedium
                                    ?.apply(
                                  color: DigitTheme.instance.colorScheme.shadow,
                                ),
                              ),
                            ),
                          ],
                        ),
                        orElse: () => const Offstage(),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.25,
                            height: MediaQuery.of(context).size.width / 1.25,
                            child: Padding(
                              padding: const EdgeInsets.all(spacer2),
                              child: Card(
                                child: QrImageView(
                                  data: DataMapEncryptor().encryptWithRandomKey(
                                      context.loggedInIndividualId!),
                                  version: QrVersions.auto,
                                  size:
                                      MediaQuery.of(context).size.width / 1.25,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: Text(
                              context.loggedInUser.name!,
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.headlineMedium
                                  ?.apply(
                                color: DigitTheme.instance.colorScheme.shadow,
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
