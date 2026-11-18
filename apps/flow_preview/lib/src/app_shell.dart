import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/helper_widget/digit_profile.dart';
import 'package:digit_ui_components/widgets/molecules/hamburger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'digit_account.dart';
import 'embed/embed.dart';
import 'localization.dart';
import 'router.dart';

/// The app bar every signed-in screen has in the field worker app
/// (pages/authenticated.dart, AuthenticatedPageWrapper): primary2 colour,
/// and on Home the hamburger menu with the profile, Home and Logout.
/// Wraps the whole navigator, so flow, form and scanner screens get it too.
class AppShell extends StatelessWidget {
  final StackRouter router;
  final Widget child;

  const AppShell({super.key, required this.router, required this.child});

  /// Screens shown before sign-in or outside the app (developer page).
  static const _noAppBar = {
    EmbedRoute.name,
    PreviewEntryRoute.name,
    AppLoginRoute.name,
    PreviewHomeRoute.name,
  };

  @override
  Widget build(BuildContext context) {
    final account = context.read<DigitAccount>();
    return ListenableBuilder(
      listenable: Listenable.merge([router, account]),
      builder: (context, _) {
        final top = router.topRoute.name;
        final show = account.signedIn && !_noAppBar.contains(top);
        debugPrint('AppShell top=$top signedIn=${account.signedIn} show=$show');
        if (!show) return child;
        final theme = Theme.of(context);
        // Same rule as the app (pages/authenticated.dart): the drawer is on
        // every signed-in page except project and boundary selection.
        final showDrawer =
            top != AppProjectsRoute.name && top != AppBoundaryRoute.name;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.colorTheme.primary.primary2,
            foregroundColor: theme.colorTheme.paper.primary,
            automaticallyImplyLeading: showDrawer,
          ),
          drawer: showDrawer ? _drawer(context, account) : null,
          body: child,
        );
      },
    );
  }

  Widget _drawer(BuildContext context, DigitAccount account) {
    String t(String key) => context.read<PreviewMessages>().translate(key);
    final user = account.user;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: Builder(
          builder: (drawerContext) => SideBar(
            profile: ProfileWidget(
              title: user?.name ?? account.userName,
              description: user?.mobileNumber,
            ),
            sidebarItems: [
              SidebarItem(
                title: t('CORE_COMMON_HOME'),
                icon: Icons.home,
                onPressed: () {
                  Scaffold.of(drawerContext).closeDrawer();
                  router.replaceAll([const AppHomeRoute()]);
                },
              ),
            ],
            logOutDigitButtonLabel: t('CORE_COMMON_LOGOUT'),
            onLogOut: () {
              Scaffold.of(drawerContext).closeDrawer();
              account.signOut();
              if (isEmbedded) {
                EmbedController.instance.reset();
                router.replaceAll([const EmbedRoute()]);
              } else {
                router.replaceAll([const AppLoginRoute()]);
              }
            },
          ),
        ),
      ),
    );
  }
}
