import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/molecules/language_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../router/app_router.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';

@RoutePage()
class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  bool isDialogVisible = false;

  @override
  void dispose() {
    isDialogVisible = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.colorTheme.primary.primary2,
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

                return BlocConsumer<LocalizationBloc, LocalizationState>(
                  listener: (context, state) {
                    if (state.loading && !isDialogVisible) {
                      isDialogVisible = true;
                      DigitLoaders.overlayLoader(context: context);
                    } else if (!state.loading && isDialogVisible) {
                      isDialogVisible = false;
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    if (!state.loading &&
                        !isDialogVisible &&
                        state.retryModule != null) {
                      DigitSyncDialog.show(
                        context,
                        type: DialogType.failed,
                        label: i18.common.failedToFetch,
                        primaryAction: DigitDialogActions(
                          label: AppLocalizations.of(context).translate(
                            i18.common.coreCommonRetry,
                          ),
                          action: (ctx) {
                            context.read<LocalizationBloc>().add(
                                LocalizationEvent.onLoadLocalization(
                                    module: state.retryModule.toString(),
                                    tenantId: envConfig.variables.tenantId ?? "default",
                                    locale: AppSharedPreferences()
                                        .getSelectedLocale
                                        .toString(),
                                    path: Constants.localizationApiPath));
                            Navigator.pop(ctx);
                          },
                        ),
                        secondaryAction: DigitDialogActions(
                          label: AppLocalizations.of(context).translate(
                            i18.common.corecommonclose,
                          ),
                          action: (ctx) => Navigator.pop(ctx),
                        ),
                      );
                    }
                  },
                  builder: (context, localizationState) {
                    return localizationModulesList != null
                        ? DigitLanguageCard(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: spacer2),
                            rowItemWidth:
                                MediaQuery.of(context).size.width * .272,
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
                              triggerLanguageChange(
                                index,
                                localizationModulesList,
                                envConfig.variables.tenantId ?? "default",
                                value.value.toString(),
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

  void triggerLanguageChange(
    int index,
    List<Interfaces> localizationModulesList,
    String tenantId,
    String locale,
  ) {
    setState(() {});
    context.read<LocalizationBloc>().add(
          LocalizationEvent.onLoadLocalization(
            module:
                'hcm-boundary-${envConfig.variables.hierarchyType.toLowerCase()},${localizationModulesList.map((e) => e.name.toString()).join(',').toString()}',
            tenantId: tenantId,
            locale: locale,
            path: Constants.localizationApiPath,
          ),
        );

    context.read<LocalizationBloc>().add(
          OnUpdateLocalizationIndexEvent(
            index: index,
            code: locale,
          ),
        );
  }
}
