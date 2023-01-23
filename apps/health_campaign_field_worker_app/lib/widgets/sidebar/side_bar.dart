import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/localization/localization.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';

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
                        ? DigitRowCard(
                            onChanged: (value) {
                              int index = languages.indexWhere(
                                (ele) =>
                                    ele.value.toString() ==
                                    value.value.toString(),
                              );
                              context
                                  .read<LocalizationBloc>()
                                  .add(LocalizationEvent.onLoadLocalization(
                                    module: localizationModulesList.interfaces
                                        .where((element) =>
                                            element.type ==
                                            Modules.localizationModule)
                                        .map((e) => e.name.toString())
                                        .join(',')
                                        .toString(),
                                    tenantId: appConfig.tenantId ?? "default",
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
                                isSelected: index == localizationState.index,
                              );
                            }).toList(),
                            width: (MediaQuery.of(context).size.width *
                                    0.5 /
                                    languages.length) -
                                (4 * languages.length),
                          )
                        : const Offstage();
                  },
                ),
              ),
            );
          },
        ),
        DigitIconTile(
          title: 'Logout',
          icon: Icons.logout,
          onPressed: () {
            // TODO: Complete implementation
          },
        ),
      ],
    );
  }
}
