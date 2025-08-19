import 'package:attendance_management/widgets/localized.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class PermissionsPage extends LocalizedStatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends LocalizedState<PermissionsPage> {
  final Map<Permission, bool> requiredPermissions = {
    Permission.notification: true,
    Permission.ignoreBatteryOptimizations: true,
    Permission.location: true,
    Permission.nearbyWifiDevices: true,
    Permission.camera: false,
  };

  final Map<Permission, IconData> permissionIcons = {
    Permission.notification: Icons.notifications_active,
    Permission.ignoreBatteryOptimizations: Icons.battery_alert,
    Permission.location: Icons.location_on,
    Permission.nearbyWifiDevices: Icons.wifi,
    Permission.camera: Icons.camera_alt,
  };

  Map<Permission, PermissionStatus> statuses = {};

  @override
  void initState() {
    _checkPermissions();
    super.initState();
  }

  Future<bool> _checkPermissions() async {
    Map<Permission, PermissionStatus> currentStatuses = {};

    for (var entry in requiredPermissions.entries) {
      final status = await entry.key.status;
      currentStatuses[entry.key] = status;
    }

    setState(() {
      statuses = currentStatuses;
    });

    final allGranted = requiredPermissions.entries.every(
      (entry) => !entry.value || currentStatuses[entry.key]?.isGranted == true,
    );

    if (allGranted && mounted) {
      context.router.replace(ProjectSelectionRoute());
    }

    return allGranted;
  }

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      statuses[permission] = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ScrollableContent(
        enableFixedDigitButton: true,
        footer:
            DigitCard(margin: const EdgeInsets.only(top: spacer2), children: [
          DigitButton(
            label: localizations.translate(i18.common.coreCommonContinue),
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
            mainAxisSize: MainAxisSize.max,
            onPressed: () async {
              bool granted = await _checkPermissions();
              if (granted) {
                if (mounted) {
                  Toast.showToast(
                    context,
                    message: localizations.translate(
                      i18.common.coreCommonPermissionsAlert,
                    ),
                    type: ToastType.error,
                  );
                }
              }
            },
          )
        ]),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(spacer2),
                  child: Text(
                    localizations.translate(i18.common.allowPermissions),
                    style: textTheme.headingXl.copyWith(
                      color: theme.colorTheme.primary.primary2,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                ...requiredPermissions.keys.map((permission) {
                  final status = statuses[permission];
                  final granted = status?.isGranted ?? false;

                  return DigitCard(
                    padding: const EdgeInsets.all(spacer2),
                    cardType: CardType.secondary,
                    borderColor: granted
                        ? theme.colorTheme.paper.primary
                        : theme.colorTheme.primary.primaryBg,
                    children: [
                      ListTile(
                        leading: Icon(
                          granted
                              ? Icons.check_circle
                              : permissionIcons[permission] ?? Icons.help,
                          color: granted
                              ? theme.colorTheme.alert.success
                              : theme.colorTheme.alert.error,
                        ),
                        title: Text(
                          localizations.translate(
                              'CORE_COMMON_PERMISSION_${permission.toString().split('.').last.toUpperCase()}'),
                          style: textTheme.bodyL,
                        ),
                        subtitle: Text(
                          localizations.translate(granted
                              ? i18.common.permissionGranted
                              : i18.common.permissionNotGranted),
                          style: textTheme.bodyS.copyWith(
                            color: granted
                                ? theme.colorTheme.alert.success
                                : theme.colorTheme.alert.error,
                          ),
                        ),
                        trailing: !granted
                            ? DigitButton(
                                onPressed: () => _requestPermission(permission),
                                label: localizations
                                    .translate(i18.common.grantPermission),
                                type: DigitButtonType.primary,
                                size: DigitButtonSize.small,
                                capitalizeLetters: false,
                              )
                            : null,
                      )
                    ],
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
