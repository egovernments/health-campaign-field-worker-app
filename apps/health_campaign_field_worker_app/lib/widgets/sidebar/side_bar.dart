import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/localization/localization.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../router/app_router.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScrollableContent(
      footer: const PoweredByDigit(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Carlos',
                style: theme.textTheme.displayMedium,
              ),
              Text(
                '+258 6387387',
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ),
        DigitIconTile(
          title: 'Home',
          icon: Icons.home,
          onPressed: () => context.router.replace(const HomeRoute()),
        ),
        DigitIconTile(
          title: 'Language',
          icon: Icons.language,
          content: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BlocBuilder<AppInitializationBloc, AppInitializationState>(
              builder: (context, state) {
                final languages = state.appConiguration?.languages;

                if (languages == null) {
                  return const Offstage();
                }

                return BlocBuilder<LocalizationBloc, LocalizationState>(
                  builder: (context, localizationState) {
                    return DigitLanguageCard(
                      digitRowCardItems: languages.map((e) {
                        var index = languages.indexOf(e);

                        return DigitRowCardModel(
                          label: e.label,
                          value: e.value,
                          isSelected: index == localizationState.index,
                        );
                      }).toList(),
                      onLanguageChange: (value) async {
                        int index = languages.indexWhere(
                          (ele) =>
                              ele.value.toString() == value.value.toString(),
                        );

                        context
                            .read<LocalizationBloc>()
                            .add(LocalizationEvent.onLoadLocalization(
                              module: 'hcm-common',
                              tenantId: "pb",
                              locale: value.value.toString(),
                              path: 'localization/messages/v1/_search',
                            ));

                        context.read<LocalizationBloc>().add(
                              OnUpdateLocalizationIndexEvent(
                                index: index,
                                code: value.value.toString(),
                              ),
                            );
                      },
                      onLanguageSubmit: () =>
                          context.router.push(const LoginRoute()),
                      languageSubmitLabel: AppLocalizations.of(context)
                          .translate(i18.common.coreCommonContinue),
                    );
                  },
                );
              },
            ),
          ),
          onPressed: () {},
        ),
        DigitIconTile(
          title: 'Logout',
          icon: Icons.logout,
          onPressed: () {},
        ),
      ],
    );
  }
}
