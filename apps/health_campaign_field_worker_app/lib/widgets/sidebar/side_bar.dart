import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/auth/auth.dart';
import '../../blocs/localization/localization.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final userObject = await localSecureStore.userRequestModel;

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Column(
        children: [
          Container(
            color: theme.colorScheme.secondary.withOpacity(0.12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: state.maybeMap(
                authenticated: (value) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.userModel.name.toString(),
                      style: theme.textTheme.displayMedium,
                    ),

                    // const SizedBox(
                    //   height: 8,
                    // ),
                    Text(
                      value.userModel.mobileNumber.toString(),
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
                orElse: () => const Offstage(),
              ),
            ),
          ),
          DigitIconTile(
            title: 'Home',
            icon: Icons.home,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              context.router.replace(HomeRoute());
            },
          ),
          BlocBuilder<AppInitializationBloc, AppInitializationState>(
            builder: (context, state) {
              if (state is! AppInitialized) return const Offstage();

              final appConfig = state.appConfiguration;
              final languages = state.appConfiguration.languages;
              final localizationModulesList =
                  state.appConfiguration.backendInterface;

              return DigitIconTile(
                title: 'Language',
                icon: Icons.language,
                onPressed: () {
                  // TODO: Complete implementation
                },
                content: Offstage(
                  offstage: languages == null,
                  child: BlocBuilder<LocalizationBloc, LocalizationState>(
                    builder: (context, localizationState) {
                      return localizationModulesList != null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: DigitRowCard(
                                onChanged: (value) {
                                  int index = languages.indexWhere(
                                    (ele) =>
                                        ele.value.toString() ==
                                        value.value.toString(),
                                  );
                                  context
                                      .read<LocalizationBloc>()
                                      .add(LocalizationEvent.onLoadLocalization(
                                        module: localizationModulesList
                                            .interfaces
                                            .where((element) =>
                                                element.type ==
                                                Modules.localizationModule)
                                            .map((e) => e.name.toString())
                                            .join(',')
                                            .toString(),
                                        tenantId:
                                            appConfig.tenantId ?? "default",
                                        locale: value.value.toString(),
                                        path: Constants.localizationApiPath,
                                      ));

                                  context.read<LocalizationBloc>().add(
                                        OnUpdateLocalizationIndexEvent(
                                          index: index,
                                          code: value.value.toString(),
                                        ),
                                      );
                                },
                                rowItems: languages!.map((e) {
                                  var index = languages.indexOf(e);

                                  return DigitRowCardModel(
                                    label: e.label,
                                    value: e.value,
                                    isSelected:
                                        index == localizationState.index,
                                  );
                                }).toList(),
                                width: (MediaQuery.of(context).size.width *
                                        0.56 /
                                        languages.length) -
                                    (4 * languages.length),
                              ),
                            )
                          : const Offstage();
                    },
                  ),
                ),
              );
            },
          ),
          // DigitIconTile(
          //   title: 'Edit Profile',
          //   icon: Icons.perm_contact_calendar,
          //   onPressed: () {
          //     // TODO: Complete implementation
          //   },
          // ),
          // DigitIconTile(
          //   title: 'Projects',
          //   icon: Icons.folder,
          //   onPressed: () {
          //     // TODO: Complete implementation
          //   },
          // ),
          DigitIconTile(
            title: 'Logout',
            icon: Icons.logout,
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogoutEvent());
            },
          ),
          const PoweredByDigit(),
        ],
      );
    });
  }
}
