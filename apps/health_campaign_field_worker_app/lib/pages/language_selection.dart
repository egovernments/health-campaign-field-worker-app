import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../router/app_router.dart';
import '../utils/constants.dart';
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

                return BlocConsumer<LocalizationBloc, LocalizationState>(
                  listener: (context, state) {
                    if (state.loading && !isDialogVisible) {
                      isDialogVisible = true;
                      DigitComponentsUtils().showLocalizationLoadingDialog(
                        context,
                        DigitSyncDialogType.inProgress,
                      );
                    } else if (!state.loading && isDialogVisible) {
                      isDialogVisible = false;
                      DigitComponentsUtils()
                          .hideDialog(context);
                    }
                    if (!state.loading &&
                        !isDialogVisible &&
                        state.retryModule != null) {
                      DigitSyncDialog.show(
                        context,
                        type: DigitSyncDialogType.failed,
                        label: i18.common.failedToFetch,
                        primaryAction: DigitDialogActions(
                          label: AppLocalizations.of(context).translate(
                            i18.common.coreCommonRetry,
                          ),
                          action: (ctx) {
                            context.read<LocalizationBloc>().add(
                                LocalizationEvent.onLoadLocalization(
                                    module: state.retryModule.toString(),
                                    tenantId: appConfig.tenantId ?? "default",
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
                                appConfig.tenantId ?? "default",
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
            module: 'hcm-boundary-${envConfig.variables.hierarchyType.toLowerCase()},${localizationModulesList
        .map((e)
    =>
        e.name.toString()
    )
        .join(',')
        .toString()
  }',
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
