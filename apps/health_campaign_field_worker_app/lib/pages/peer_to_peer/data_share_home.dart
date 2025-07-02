import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_service/blocs/sync/sync.dart';

import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import 'devices_list.dart';

@RoutePage()
class DataShareHomePage extends LocalizedStatefulWidget {
  const DataShareHomePage({super.key});

  @override
  State<DataShareHomePage> createState() => _DataShareHomeState();
}

class _DataShareHomeState extends LocalizedState<DataShareHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return ScrollableContent(
      header: const BackNavigationHelpHeaderWidget(
        showHelp: true,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: spacer4, top: spacer2),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              localizations.translate(i18.dataShare.dataSharingLabel),
              style: textTheme.headingXl
                  .copyWith(color: theme.colorTheme.primary.primary2),
            ),
          ),
        ),
        BlocConsumer<SyncBloc, SyncState>(
          builder: (BuildContext context, state) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: DigitCard(
                      padding: const EdgeInsets.only(top: spacer10),
                      margin: const EdgeInsets.all(spacer4),
                      inline: true,
                      onPressed: () {
                        state.maybeMap(
                            orElse: () {},
                            syncInProgress: (value) {
                              if (context.mounted) {
                                Toast.showToast(
                                  context,
                                  message: localizations.translate(
                                      i18.common.coreCommonSyncInProgress),
                                  type: ToastType.success,
                                );
                              }
                            },
                            completedSync: (value) {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            pendingSync: (syncState) {
                              if (syncState.count == 0) {
                                context.router.push(DevicesListRoute(
                                    deviceType: DeviceType.sender));
                              } else {
                                showCustomPopup(
                                  context: context,
                                  builder: (BuildContext ctx) => Popup(
                                      title: localizations.translate(
                                          i18.common.coreCommonAttention),
                                      description: localizations.translate(
                                          i18.dataShare.dataUnSyncedDesc),
                                      type: PopUpType.alert,
                                      onCrossTap: () {
                                        Navigator.of(
                                          ctx,
                                          rootNavigator: true,
                                        ).pop();
                                      },
                                      actions: [
                                        DigitButton(
                                            capitalizeLetters: false,
                                            label: localizations.translate(i18
                                                .beneficiaryDetails.ctaProceed),
                                            onPressed: () {
                                              context.router.push(
                                                  DevicesListRoute(
                                                      deviceType:
                                                          DeviceType.sender));
                                            },
                                            type: DigitButtonType.primary,
                                            size: DigitButtonSize.large),
                                        DigitButton(
                                            capitalizeLetters: false,
                                            label: localizations.translate(
                                                i18.home.syncDataLabel),
                                            onPressed: () {
                                              Navigator.of(
                                                ctx,
                                                rootNavigator: true,
                                              ).pop();
                                              attemptSyncUp(context);
                                            },
                                            type: DigitButtonType.tertiary,
                                            size: DigitButtonSize.large)
                                      ]),
                                );
                              }
                            });
                      },
                      children: [
                        Center(
                          child: Icon(Icons.upload,
                              size: spacer7,
                              color: DigitTheme.instance.colors.light.primary1),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                localizations
                                    .translate(i18.dataShare.sendAction),
                                style: textTheme.headingM.copyWith(
                                    color: DigitTheme
                                        .instance.colors.light.primary1),
                              ),
                              const SizedBox(
                                height: spacer2,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  localizations.translate(
                                      i18.dataShare.sendActionDescription),
                                  style: textTheme.bodyXS.copyWith(
                                      color: DigitTheme
                                          .instance.colors.light.textSecondary),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: DigitCard(
                      padding: const EdgeInsets.only(top: spacer10),
                      inline: true,
                      margin: const EdgeInsets.all(spacer4),
                      onPressed: () {
                        context.router.push(
                            DevicesListRoute(deviceType: DeviceType.receiver));
                      },
                      children: [
                        Center(
                          child: Icon(Icons.download,
                              size: spacer7,
                              color: DigitTheme.instance.colors.light.primary1),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                localizations
                                    .translate(i18.dataShare.receiveAction),
                                style: textTheme.headingM.copyWith(
                                    color: DigitTheme
                                        .instance.colors.light.primary1),
                              ),
                              const SizedBox(
                                height: spacer2,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  localizations.translate(
                                      i18.dataShare.receiveActionDescription),
                                  style: textTheme.bodyXS.copyWith(
                                      color: DigitTheme
                                          .instance.colors.light.textSecondary),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                state.maybeMap(
                    orElse: () => const Offstage(),
                    pendingSync: (value) {
                      return value.count == 0
                          ? const Offstage()
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: spacer2,
                              ),
                              child: InfoCard(
                                type: InfoType.info,
                                description: localizations
                                    .translate(i18.home.dataSyncInfoContent)
                                    .replaceAll('{}', value.count.toString()),
                                title: localizations.translate(
                                  i18.home.dataSyncInfoLabel,
                                ),
                              ),
                            );
                    })
              ],
            );
          },
          listener: (BuildContext context, Object? state) {},
        ),
      ],
    );
  }
}
