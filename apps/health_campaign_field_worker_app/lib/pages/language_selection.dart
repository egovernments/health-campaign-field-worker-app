import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../router/app_router.dart';
import '../utils/utils.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<AppInitializationBloc, AppInitializationState>(
              builder: (context, state) {
                if (state is! AppInitialized) return const Offstage();
                final appConfig = state.appConfiguration;
                final languages = state.appConfiguration.languages;
                final localizationModulesList =
                    state.appConfiguration.backendInterface?.interfaces;
                if (languages == null) {
                  return const Offstage();
                }

                return BlocBuilder<LocalizationBloc, LocalizationState>(
                  builder: (context, localizationState) {
                    return localizationModulesList != null
                        ? DigitLanguageCard(
                            digitRowCardItems: languages.map((e) {
                              var index = languages.indexOf(e);

                              return DigitRowCardModel(
                                label: e.label,
                                value: e.value,
                                isSelected: getSelectedLanguage(
                                  state,
                                  index,
                                ),
                              );
                            }).toList(),
                            onLanguageChange: (value) async {
                              final info = await PackageInfo.fromPlatform();
                              Constants().initialize(info.version);
                              int index = languages.indexWhere(
                                (ele) =>
                                    ele.value.toString() ==
                                    value.value.toString(),
                              );

                              context.read<LocalizationBloc>().add(
                                    LocalizationEvent.onLoadLocalization(
                                      module: localizationModulesList
                                          .map((e) => e.name.toString())
                                          .join(',')
                                          .toString(),
                                      tenantId: appConfig.tenantId ?? "default",
                                      locale: value.value.toString(),
                                      path: Constants.localizationApiPath,
                                    ),
                                  );

                              context.read<LocalizationBloc>().add(
                                    OnUpdateLocalizationIndexEvent(
                                      index: index,
                                      code: value.value.toString(),
                                    ),
                                  );
                            },
                            onLanguageSubmit: () => context.router.push(
                              LoginRoute(),
                            ),
                            languageSubmitLabel: AppLocalizations.of(context)
                                .translate(i18.common.coreCommonContinue),
                          )
                        : const Offstage();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
