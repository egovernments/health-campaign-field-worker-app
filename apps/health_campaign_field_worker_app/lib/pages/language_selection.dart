import 'dart:io';

import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/language_selection_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/foundation.dart';
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
                            onLanguageSubmit: () => _checkDeviceRamAndProceed(),
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

  /// Check device RAM and show warning dialog if below 2GB, then proceed
  Future<void> _checkDeviceRamAndProceed() async {
    if (!Platform.isAndroid) {
      // Not Android, proceed directly
      context.router.push(LoginRoute());
      return;
    }

    try {
      final file = File('/proc/meminfo');
      final contents = await file.readAsString();
      final lines = contents.split('\n');

      for (final line in lines) {
        if (line.startsWith('MemTotal:')) {
          // Extract RAM value in kB
          final match = RegExp(r'(\d+)').firstMatch(line);
          if (match != null) {
            final ramKb = int.tryParse(match.group(1) ?? '0') ?? 0;
            final ramGb = ramKb / (1024 * 1024); // Convert to GB

            if (ramGb < envConfig.variables.minRamThresholdGb && mounted) {
              // Show warning dialog for low RAM
              _showLowRamWarningDialog();
              return;
            }
          }
          break;
        }
      }

      // RAM is sufficient, proceed to login
      if (mounted) {
        context.router.push(LoginRoute());
      }
    } catch (e) {
      debugPrint('Error checking RAM: $e');
      // On error, proceed anyway
      if (mounted) {
        context.router.push(LoginRoute());
      }
    }
  }

  /// Show warning dialog for low RAM devices
  void _showLowRamWarningDialog() {
    final localizations = AppLocalizations.of(context);

    showCustomPopup(
      context: context,
      builder: (popupContext) => Popup(
        title: localizations.translate(i18.common.lowRamWarningTitle),
        description: localizations.translate(i18.common.lowRamWarningDesc),
        type: PopUpType.alert,
        inlineActions: true,
        actions: [
          DigitButton(
            label: localizations.translate(i18.common.coreCommonContinue),
            onPressed: () {
              Navigator.of(popupContext, rootNavigator: true).pop();
              context.router.push(LoginRoute());
            },
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
          DigitButton(
            label: localizations.translate(i18.common.coreCommonGoback),
            onPressed: () {
              Navigator.of(popupContext, rootNavigator: true).pop();
            },
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
    );
  }
}
