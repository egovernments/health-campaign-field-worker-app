import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
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
          padding: const EdgeInsets.all(spacer2),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              localizations.translate(i18.dataShare.dataSharingLabel),
              style: textTheme.headingM,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: DigitCard(
              padding: const EdgeInsets.only(top: spacer10),
              margin: const EdgeInsets.all(spacer4),
              inline: true,
              onPressed: () {
                context.router
                    .push(DevicesListRoute(deviceType: DeviceType.sender));
              },
              children: [
                Center(
                  child: Icon(Icons.upload,
                      size: 20,
                      color: DigitTheme.instance.colors.light.primary1),
                ),
                Center(
                  child: Text(
                    localizations.translate(i18.dataShare.sendAction),
                    style: textTheme.label.copyWith(
                        color: DigitTheme.instance.colors.light.primary1),
                  ),
                )
              ]),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: DigitCard(
              padding: const EdgeInsets.only(top: spacer10),
              inline: true,
              margin: const EdgeInsets.all(spacer4),
              onPressed: () {
                context.router
                    .push(DevicesListRoute(deviceType: DeviceType.receiver));
              },
              children: [
                Center(
                  child: Icon(Icons.download,
                      size: 20,
                      color: DigitTheme.instance.colors.light.primary1),
                ),
                Center(
                  child: Text(
                    localizations.translate(i18.dataShare.receiveAction),
                    style: textTheme.label.copyWith(
                        color: DigitTheme.instance.colors.light.primary1),
                  ),
                )
              ]),
        )
      ],
    );
  }
}
