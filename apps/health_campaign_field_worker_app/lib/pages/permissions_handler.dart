import 'dart:io'; // Import this

import 'package:attendance_management/widgets/localized.dart';
import 'package:device_info_plus/device_info_plus.dart'; // Import this
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
  final Map<Permission, IconData> permissionIcons = {
    Permission.notification: Icons.notifications_active,
    Permission.ignoreBatteryOptimizations: Icons.battery_alert,
    Permission.location: Icons.location_on,
    Permission.nearbyWifiDevices: Icons.wifi,
    Permission.bluetoothScan: Icons.wifi,
    Permission.camera: Icons.camera_alt,
  };

  // Declare this as late to initialize it in initState
  late Map<Permission, bool> requiredPermissions;

  Map<Permission, PermissionStatus> statuses = {};
  bool backgroundActivityConfirmed = false;

  @override
  void initState() {
    _initializePermissions(); // Call a new method to set permissions
    super.initState();
  }

  Future<void> _initializePermissions() async {
    // Start with common permissions
    requiredPermissions = {
      Permission.notification: true,
      Permission.ignoreBatteryOptimizations: true,
      Permission.location: true,
      Permission.camera: false,
    };

    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        requiredPermissions[Permission.nearbyWifiDevices] = true;
      } else if (androidInfo.version.sdkInt >= 31) {
        requiredPermissions[Permission.bluetoothScan] = true;
      }
    }

    _checkPermissions();
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

    if (permission == Permission.ignoreBatteryOptimizations &&
        !status.isGranted) {
      await openAppSettings();
    }

    setState(() {
      statuses[permission] = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Your build method remains the same
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ScrollableContent(
        enableFixedDigitButton: true,
        footer:
            DigitCard(margin: const EdgeInsets.only(top: spacer2), children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: spacer2),
                child: DigitCheckbox(
                  value: backgroundActivityConfirmed,
                  onChanged: (val) {
                    setState(() {
                      backgroundActivityConfirmed = val ?? false;
                    });
                  },
                ),
              ),
              Expanded(
                child: Text(
                  localizations
                      .translate(i18.common.allowBackgroundActivityDesc),
                  style: textTheme.bodyS.copyWith(
                    color: theme.colorTheme.primary.primary2,
                  ),
                ),
              ),
            ],
          ),
          DigitButton(
            label: localizations.translate(i18.common.coreCommonContinue),
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
            mainAxisSize: MainAxisSize.max,
            onPressed: () async {
              bool granted = await _checkPermissions();
              if (!backgroundActivityConfirmed || !granted && mounted) {
                Toast.showToast(
                  context,
                  message: localizations.translate(
                    i18.common.coreCommonPermissionsAlert,
                  ),
                  type: ToastType.error,
                );
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
                    margin: const EdgeInsets.all(spacer2),
                    padding: const EdgeInsets.all(spacer2),
                    cardType: CardType.primary,
                    borderColor: granted
                        ? theme.colorTheme.paper.primary
                        : theme.colorTheme.primary.primaryBg,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            granted
                                ? Icons.check_circle
                                : permissionIcons[permission] ?? Icons.help,
                            color: granted
                                ? theme.colorTheme.alert.success
                                : theme.colorTheme.alert.error,
                          ),
                          const SizedBox(width: spacer2),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: localizations.translate(
                                      'CORE_COMMON_PERMISSION_${permission.toString().split('.').last.toUpperCase()}',
                                    ),
                                    style: textTheme.headingS.copyWith(
                                      color: theme.colorTheme.primary.primary2,
                                    ),
                                  ),
                                  if (requiredPermissions[permission] == true)
                                    TextSpan(
                                      text: " *",
                                      style: textTheme.headingS.copyWith(
                                        color: theme.colorTheme.alert.error,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          if (!granted)
                            DigitButton(
                              onPressed: () => _requestPermission(permission),
                              label: localizations
                                  .translate(i18.common.grantPermission),
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.small,
                              capitalizeLetters: false,
                            )
                          else if (permission ==
                              Permission.ignoreBatteryOptimizations)
                            DigitButton(
                              onPressed: () => openAppSettings(),
                              label: localizations
                                  .translate(i18.common.openSettings),
                              type: DigitButtonType.secondary,
                              size: DigitButtonSize.small,
                              capitalizeLetters: false,
                            ),
                        ],
                      ),
                      Text(
                        localizations.translate(
                          granted
                              ? i18.common.permissionGranted
                              : i18.common.permissionNotGranted,
                        ),
                        style: textTheme.bodyS.copyWith(
                          color: granted
                              ? theme.colorTheme.alert.success
                              : theme.colorTheme.alert.error,
                        ),
                      ),
                      if (permission == Permission.ignoreBatteryOptimizations &&
                          granted) ...[
                        Text(
                          localizations.translate(
                            'CORE_COMMON_PERMISSION_${permission.toString().split('.').last.toUpperCase()}_WARNING',
                          ),
                          style: textTheme.bodyS.copyWith(
                            color: theme.colorTheme.alert.warning,
                          ),
                        ),
                      ],
                    ],
                  );
                }), // Convert map to list
              ],
            ),
          )
        ],
      ),
    );
  }
}
