import 'package:digit_components/digit_components.dart';
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
              enableFixedButton: true,
              header: const Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                ),
              ]),
              footer: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                padding: const EdgeInsets.fromLTRB(
                  kPadding,
                  0,
                  kPadding,
                  0,
                ),
                child: DigitElevatedButton(
                  onPressed: () {
                    context.router.popUntilRouteWithName(HomeRoute.name);
                  },
                  child: Center(
                    child: Text(
                      localizations.translate(i18.common.corecommonclose),
                    ),
                  ),
                ),
              ),
              children: [
                state.maybeMap(
                  authenticated: (value) => Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.25,
                        height: MediaQuery.of(context).size.width / 1.25,
                        child: Padding(
                          padding: const EdgeInsets.all(kPadding),
                          child: Card(
                            child: QrImageView(
                              data: context.loggedInUserUuid,
                              version: QrVersions.auto,
                              size: MediaQuery.of(context).size.width / 1.25,
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
                          style: DigitTheme
                              .instance.mobileTheme.textTheme.headlineMedium
                              ?.apply(
                            color: DigitTheme.instance.colorScheme.shadow,
                          ),
                        ),
                      ),
                    ],
                  ),
                  orElse: () => const Offstage(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
