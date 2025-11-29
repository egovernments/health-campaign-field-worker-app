import 'dart:io';

import 'package:attendance_management/widgets/localized.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../main.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class PermissionsPage extends LocalizedStatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends LocalizedState<PermissionsPage> {
  /// Map permission string names to Permission objects (lowercase keys)
  final Map<String, Permission> permissionMap = {
    'camera': Permission.camera,
    'location': Permission.location,
    'storage': Permission.storage,
    'notification': Permission.notification,
    'notifications': Permission.notification,
    'ignorebatteryoptimizations': Permission.ignoreBatteryOptimizations,
    'nearbywifidevices': Permission.nearbyWifiDevices,
    'bluetoothscan': Permission.bluetoothScan,
  };

  // Declare this as late to initialize it in initState
  late Map<Permission, bool> requiredPermissions;

  Map<Permission, PermissionStatus> statuses = {};
  bool backgroundActivityConfirmed = false;

  // Platform-specific visibility flags
  bool showNearbyWifiDevices = false;
  bool showBluetoothScan = false;

  // Config from permission_handler_config
  Map<String, dynamic>? screenConfig;
  List<dynamic> bodyConfig = [];

  @override
  void initState() {
    super.initState();

    _initializeConfig();

    // Initialize permissions and after initialization, attempt auto navigation
    _initializePermissions().then((_) {
      // Use addPostFrameCallback to ensure safe navigation after build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoNavigateIfAllGranted();
      });
    });
  }

  /// Initialize the screen config from permission_handler_config
  void _initializeConfig() {
    final flows = permission_handler_config['flows'] as List<dynamic>?;
    if (flows != null && flows.isNotEmpty) {
      screenConfig = flows[0] as Map<String, dynamic>;
      bodyConfig = screenConfig?['body'] as List<dynamic>? ?? [];
    }
  }

  Future<void> _initializePermissions() async {
    // Build requiredPermissions from config
    requiredPermissions = {};
    _parsePermissionsFromConfig(bodyConfig);

    // Handle platform-specific permissions
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        showNearbyWifiDevices = true;
        showBluetoothScan = false;
        // Remove bluetoothScan if it was added from config
        requiredPermissions.remove(Permission.bluetoothScan);
      } else if (androidInfo.version.sdkInt >= 31) {
        showNearbyWifiDevices = false;
        showBluetoothScan = true;
        // Remove nearbyWifiDevices if it was added from config
        requiredPermissions.remove(Permission.nearbyWifiDevices);
      } else {
        // SDK < 31: remove both
        showNearbyWifiDevices = false;
        showBluetoothScan = false;
        requiredPermissions.remove(Permission.nearbyWifiDevices);
        requiredPermissions.remove(Permission.bluetoothScan);
      }
    } else {
      // Non-Android: remove both wifi/bluetooth permissions
      showNearbyWifiDevices = false;
      showBluetoothScan = false;
      requiredPermissions.remove(Permission.nearbyWifiDevices);
      requiredPermissions.remove(Permission.bluetoothScan);
    }

    setState(() {});
    // NOTE: Do NOT call _checkPermissions() here to avoid premature navigation.
    // Auto-navigation is handled separately after initialization by _autoNavigateIfAllGranted().
  }

  /// Recursively parse permissions from config and build requiredPermissions map
  void _parsePermissionsFromConfig(List<dynamic> items) {
    for (var item in items) {
      if (item is Map<String, dynamic>) {
        // Check if this item has an onAction with REQUEST_PERMISSION
        final onAction = item['onAction'] as List<dynamic>?;
        if (onAction != null) {
          for (var action in onAction) {
            if (action is Map<String, dynamic> &&
                action['actionType'] == 'REQUEST_PERMISSION') {
              final properties = action['properties'] as Map<String, dynamic>?;
              final permissionName = properties?['permission'] as String?;
              if (permissionName != null) {
                final permission = permissionMap[permissionName.toLowerCase()];
                if (permission != null) {
                  // Find if this permission is required by looking for textTemplate with required: true
                  final isRequired = _findRequiredInParent(item);
                  requiredPermissions[permission] = isRequired;
                }
              }
            }
          }
        }

        // Recursively check children
        final children = item['children'] as List<dynamic>?;
        if (children != null) {
          _parsePermissionsFromConfig(children);
        }
      }
    }
  }

  /// Find if a permission card has required: true in its textTemplate
  bool _findRequiredInParent(Map<String, dynamic> item) {
    // Check if this item itself has required
    if (item['required'] == true) {
      return true;
    }

    // Check children
    final children = item['children'] as List<dynamic>?;
    if (children != null) {
      for (var child in children) {
        if (child is Map<String, dynamic>) {
          if (child['format'] == 'textTemplate' && child['required'] == true) {
            return true;
          }
          // Recursively check nested children
          if (_findRequiredInParent(child)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  /// Check permission statuses and return true only if all required permissions are granted.
  Future<bool> _checkPermissions() async {
    Map<Permission, PermissionStatus> currentStatuses = {};

    // If requiredPermissions is empty, treat it as not granted to avoid accidental navigation.
    // However, this depends on your policy: if you want empty config => allow navigation,
    // change the following check accordingly. For safety, we'll treat empty as NOT all granted.
    if (requiredPermissions.isEmpty) {
      // Refresh statuses for potential UI rendering.
      setState(() => statuses = currentStatuses);
      return false;
    }

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

  /// Request permission by name (from config)
  Future<void> _requestPermissionByName(String permissionName) async {
    final permission = permissionMap[permissionName.toLowerCase()];
    if (permission != null) {
      await _requestPermission(permission);
    }
  }

  /// Check if a permission is granted by name
  bool _isPermissionGranted(String permissionName) {
    final permission = permissionMap[permissionName.toLowerCase()];
    if (permission == null) return false;
    return statuses[permission]?.isGranted ?? false;
  }

  /// Evaluate hidden/visible conditions from config
  bool _evaluateCondition(dynamic condition) {
    if (condition == null) return false;
    if (condition is bool) return condition;
    if (condition is String) {
      final regex = RegExp(r'\{\{\s*context\.(\w+)\s*\}\}');
      final match = regex.firstMatch(condition);
      if (match != null) {
        final key = match.group(1);
        if (key != null) {
          // Handle permission granted checks
          if (key.endsWith('PermissionGranted')) {
            final permissionName =
                key.replaceAll('PermissionGranted', '').toLowerCase();
            return _isPermissionGranted(permissionName);
          }
          // Handle platform-specific visibility flags
          if (key == 'showNearbyWifiDevices') {
            return showNearbyWifiDevices;
          }
          if (key == 'showBluetoothScan') {
            return showBluetoothScan;
          }
        }
      }
    }
    return false;
  }

  /// Resolve template strings for permission status labels
  String _resolveTemplate(String template) {
    final regex = RegExp(r'\{\{\s*context\.(\w+)\s*\}\}');
    return template.replaceAllMapped(regex, (match) {
      final key = match.group(1);
      if (key != null && key.endsWith('PermissionStatus')) {
        final permissionName =
            key.replaceAll('PermissionStatus', '').toLowerCase();
        final granted = _isPermissionGranted(permissionName);
        return granted
            ? localizations.translate(i18.common.permissionGranted)
            : localizations.translate(i18.common.permissionNotGranted);
      }
      return match.group(0) ?? '';
    });
  }

  /// Handle actions from config
  void _handleAction(Map<String, dynamic> action) {
    final actionType = action['actionType'] as String?;
    final properties = action['properties'] as Map<String, dynamic>? ?? {};

    switch (actionType) {
      case 'REQUEST_PERMISSION':
        final permission = properties['permission'] as String?;
        if (permission != null) {
          _requestPermissionByName(permission);
        }
        break;
      case 'OPEN_APP_SETTINGS':
        openAppSettings();
        break;
      case 'BACK_NAVIGATION':
        if (context.router.canPop()) {
          context.router.maybePop();
        }
        break;
    }
  }

  /// Attempt to auto-navigate if all required permissions are granted.
  /// This is triggered once after initialization (and can be triggered anywhere else if needed).
  Future<void> _autoNavigateIfAllGranted() async {
    final granted = await _checkPermissions();
    if (!mounted) return;

    if (granted) {
      context.router.replace(ProjectSelectionRoute());
    }
    // If not all granted, remain on this screen so user can grant them.
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ScrollableContent(
        enableFixedDigitButton: true,
        footer: _buildFooter(theme, textTheme),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header from config
                if (screenConfig?['heading'] != null)
                  Padding(
                    padding: const EdgeInsets.all(spacer2),
                    child: Text(
                      localizations.translate(screenConfig!['heading']),
                      style: textTheme.headingXl.copyWith(
                        color: theme.colorTheme.primary.primary2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                // Build body widgets from config
                ...bodyConfig.map(
                  (item) => _buildWidget(
                      item as Map<String, dynamic>, theme, textTheme),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFooter(ThemeData theme, DigitTextTheme textTheme) {
    return DigitCard(
      margin: const EdgeInsets.only(top: spacer2),
      children: [
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
                localizations.translate(i18.common.allowBackgroundActivityDesc),
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
            if (!granted || !backgroundActivityConfirmed) {
              Toast.showToast(
                context,
                message: localizations.translate(
                  i18.common.coreCommonPermissionsAlert,
                ),
                type: ToastType.error,
              );
              return;
            }

            if (mounted) {
              context.router.replace(ProjectSelectionRoute());
            }
          },
        )
      ],
    );
  }

  /// Build widget from config JSON
  Widget _buildWidget(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final format = config['format'] as String?;

    // Check hidden condition
    if (config['hidden'] != null && _evaluateCondition(config['hidden'])) {
      return const SizedBox.shrink();
    }

    // Check visible condition
    if (config['visible'] != null && !_evaluateCondition(config['visible'])) {
      return const SizedBox.shrink();
    }

    switch (format) {
      case 'column':
        return _buildColumn(config, theme, textTheme);
      case 'row':
        return _buildRow(config, theme, textTheme);
      case 'card':
        return _buildCard(config, theme, textTheme);
      case 'textTemplate':
        return _buildTextTemplate(config, theme, textTheme);
      case 'icon':
        return _buildIcon(config, theme);
      case 'button':
        return _buildButton(config, theme, textTheme);
      case 'tag':
        return _buildTag(config, theme, textTheme);
      case 'infoCard':
        return _buildInfoCard(config, theme, textTheme);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildColumn(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final children = config['children'] as List<dynamic>? ?? [];
    final properties = config['properties'] as Map<String, dynamic>? ?? {};

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacer2),
      child: Column(
        mainAxisAlignment:
            _parseMainAxisAlignment(properties['mainAxisAlignment']),
        mainAxisSize: _parseMainAxisSize(properties['mainAxisSize']),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
            .map((child) =>
                _buildWidget(child as Map<String, dynamic>, theme, textTheme))
            .toList(),
      ),
    );
  }

  Widget _buildRow(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final children = config['children'] as List<dynamic>? ?? [];
    final properties = config['properties'] as Map<String, dynamic>? ?? {};

    return Row(
      mainAxisAlignment:
          _parseMainAxisAlignment(properties['mainAxisAlignment']),
      mainAxisSize: _parseMainAxisSize(properties['mainAxisSize']),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.map((child) {
        final childConfig = child as Map<String, dynamic>;
        final widget = _buildWidget(childConfig, theme, textTheme);
        // Wrap with Expanded if expanded property is true
        if (childConfig['expanded'] == true) {
          return Expanded(child: widget);
        }
        return widget;
      }).toList(),
    );
  }

  Widget _buildCard(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final children = config['children'] as List<dynamic>? ?? [];

    return DigitCard(
      margin: const EdgeInsets.all(spacer2),
      padding: const EdgeInsets.all(spacer2),
      cardType: CardType.primary,
      children: children
          .map((child) =>
              _buildWidget(child as Map<String, dynamic>, theme, textTheme))
          .toList(),
    );
  }

  Widget _buildTextTemplate(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final value = config['value'] as String? ?? '';
    final properties = config['properties'] as Map<String, dynamic>? ?? {};
    final style = properties['style'] as String?;
    final required = config['required'] as bool? ?? false;

    String resolvedValue = _resolveTemplate(value);
    resolvedValue = localizations.translate(resolvedValue);

    TextStyle textStyle;
    if (style == 'heading') {
      textStyle = textTheme.headingM.copyWith(
        color: theme.colorTheme.primary.primary2,
      );
    } else {
      textStyle = textTheme.bodyS.copyWith(
        color: theme.colorTheme.primary.primary2,
      );
    }

    if (required) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: spacer1),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: resolvedValue, style: textStyle),
              TextSpan(
                text: " *",
                style: textStyle.copyWith(
                  color: theme.colorTheme.alert.error,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacer1),
      child: Text(resolvedValue, style: textStyle),
    );
  }

  Widget _buildIcon(Map<String, dynamic> config, ThemeData theme) {
    final iconName = config['value'] as String? ?? '';

    return Padding(
      padding: const EdgeInsets.only(right: spacer2),
      child: Icon(
        DigitIconMapping.getIcon(iconName),
        color: theme.colorTheme.primary.primary1,
      ),
    );
  }

  Widget _buildButton(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final label = config['label'] as String? ?? '';
    final properties = config['properties'] as Map<String, dynamic>? ?? {};
    final onAction = config['onAction'] as List<dynamic>?;

    // Check hidden condition for button
    if (config['hidden'] != null && _evaluateCondition(config['hidden'])) {
      return const SizedBox.shrink();
    }

    return DigitButton(
      label: localizations.translate(label),
      type: _parseButtonType(properties['type']),
      size: _parseButtonSize(properties['size']),
      mainAxisSize: properties['mainAxisSize'] == 'max'
          ? MainAxisSize.max
          : MainAxisSize.min,
      onPressed: () {
        if (onAction != null) {
          for (var action in onAction) {
            _handleAction(action as Map<String, dynamic>);
          }
        }
      },
    );
  }

  Widget _buildTag(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final label = config['label'] as String? ?? '';
    final resolvedLabel = _resolveTemplate(label);

    final isGranted = resolvedLabel.contains(
      localizations.translate(i18.common.permissionGranted),
    );

    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: spacer2, vertical: spacer1),
      decoration: BoxDecoration(
        color: isGranted
            ? theme.colorTheme.alert.success.withOpacity(0.1)
            : theme.colorTheme.alert.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(spacer1),
      ),
      child: Text(
        resolvedLabel,
        style: textTheme.bodyXS.copyWith(
          color: isGranted
              ? theme.colorTheme.alert.success
              : theme.colorTheme.alert.error,
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final label = config['label'] as String? ?? '';
    final description = config['description'] as String? ?? '';
    final type = config['type'] as String? ?? 'info';

    if (config['hidden'] != null && _evaluateCondition(config['hidden'])) {
      return const SizedBox.shrink();
    }

    InfoType infoType;
    switch (type) {
      case 'error':
        infoType = InfoType.error;
        break;
      case 'warning':
        infoType = InfoType.warning;
        break;
      case 'success':
        infoType = InfoType.success;
        break;
      default:
        infoType = InfoType.info;
    }

    return Padding(
      padding: const EdgeInsets.all(spacer2),
      child: InfoCard(
        type: infoType,
        title: localizations.translate(label),
        description: localizations.translate(description),
      ),
    );
  }

  MainAxisAlignment _parseMainAxisAlignment(String? value) {
    switch (value) {
      case 'start':
        return MainAxisAlignment.start;
      case 'end':
        return MainAxisAlignment.end;
      case 'center':
        return MainAxisAlignment.center;
      case 'spaceBetween':
        return MainAxisAlignment.spaceBetween;
      case 'spaceAround':
        return MainAxisAlignment.spaceAround;
      case 'spaceEvenly':
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.start;
    }
  }

  MainAxisSize _parseMainAxisSize(String? value) {
    switch (value) {
      case 'min':
        return MainAxisSize.min;
      case 'max':
        return MainAxisSize.max;
      default:
        return MainAxisSize.max;
    }
  }

  DigitButtonType _parseButtonType(String? value) {
    switch (value) {
      case 'primary':
        return DigitButtonType.primary;
      case 'secondary':
        return DigitButtonType.secondary;
      case 'tertiary':
        return DigitButtonType.tertiary;
      default:
        return DigitButtonType.primary;
    }
  }

  DigitButtonSize _parseButtonSize(String? value) {
    switch (value) {
      case 'small':
        return DigitButtonSize.small;
      case 'medium':
        return DigitButtonSize.medium;
      case 'large':
        return DigitButtonSize.large;
      default:
        return DigitButtonSize.medium;
    }
  }
}
