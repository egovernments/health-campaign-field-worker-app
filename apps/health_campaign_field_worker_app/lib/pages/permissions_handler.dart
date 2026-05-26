import 'dart:convert';
import 'dart:io';

import 'package:attendance_management/widgets/localized.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/localization/app_localization.dart';
import '../router/app_router.dart';
import '../sampleJsonConfigs/permission_handler.dart';
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
  List<dynamic> footerConfig = [];

  // Flag to track if permission handler is disabled
  bool _isDisabled = false;

  @override
  void initState() {
    super.initState();

    // Initialize config first, then permissions
    _initializeConfig().then((_) {
      // Skip permission initialization if disabled
      if (_isDisabled) return;

      // Initialize permissions and check their current status
      _initializePermissions().then((_) {
        // Skip if disabled
        if (_isDisabled) return;

        // Check permissions to update UI status, but don't auto-navigate
        // User must explicitly click Continue after granting all permissions
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          // Skip if disabled
          if (_isDisabled) return;
          bool granted = await _checkPermissions();
          if (granted && mounted) {
            context.router.replace(BoundarySelectionRoute());
          }
        });
      });
    });
  }

  /// Initialize the screen config from permission_handler_config
  Future<void> _initializeConfig() async {
    final prefs = await SharedPreferences.getInstance();
    final schemaJsonRaw = prefs.getString('app_config_schemas');

    try {
      if (schemaJsonRaw != null) {
        final allSchemas = json.decode(schemaJsonRaw) as Map<String, dynamic>;
        final data = allSchemas['PERMISSIONHANDLER'];
        if (data?['data']?['disabled'] == true) {
          _isDisabled = true;
          if (mounted) {
            context.router.replace(BoundarySelectionRoute());
          }
          return; // Skip loading config when disabled
        } else {
          final registrationDeliveryData = data?['data'];
          final flowsData =
              (registrationDeliveryData['flows'] as List<dynamic>?)
                      ?.map((e) => Map<String, dynamic>.from(e as Map))
                      .toList() ??
                  [];
          if (flowsData.isNotEmpty) {
            screenConfig = flowsData[0];
            bodyConfig = screenConfig?['body'] as List<dynamic>? ?? [];
            footerConfig = screenConfig?['footer'] as List<dynamic>? ?? [];
          }
        }
      } else {
        if (permission_handler_config?['disabled'] == true) {
          _isDisabled = true;
          if (mounted) {
            context.router.replace(BoundarySelectionRoute());
          }
          return; // Skip loading config when disabled
        } else {
          final flows = permission_handler_config['flows'] as List<dynamic>?;
          if (flows != null && flows.isNotEmpty) {
            screenConfig = flows[0] as Map<String, dynamic>;
            bodyConfig = screenConfig?['body'] as List<dynamic>? ?? [];
            footerConfig = screenConfig?['footer'] as List<dynamic>? ?? [];
          }
        }
      }
    } catch (e) {
      debugPrint('config error $e');
    }
  }

  Future<void> _initializePermissions() async {
    // Build requiredPermissions from config
    requiredPermissions = {};
    _parsePermissionsFromConfig(footerConfig);

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
  /// [parentCard] is the parent card that contains the permission button
  void _parsePermissionsFromConfig(List<dynamic> items) {
    requiredPermissions = {};
    for (var item in items) {
      if (item is! Map) continue;
      final onAction = (item as Map)['onAction'] as List<dynamic>?;
      if (onAction == null) continue;
      for (var action in onAction) {
        if (action is! Map || action['actionType'] != 'REQUEST_PERMISSION')
          continue;
        final props =
            Map<String, dynamic>.from(action['properties'] as Map? ?? {});
        final permissionName = props['permission'] as String?;
        final isRequired = props['required'] == true;
        if (permissionName != null) {
          final permission = permissionMap[permissionName.toLowerCase()];
          if (permission != null) {
            requiredPermissions[permission] = isRequired;
            debugPrint(
                'Parsed permission: $permissionName, required: $isRequired');
          }
        }
      }
    }
  }

  /// Check permission statuses and return true only if all required permissions are granted.
  Future<bool> _checkPermissions() async {
    Map<Permission, PermissionStatus> currentStatuses = {};

    // If requiredPermissions is empty, treat it as not granted to avoid accidental navigation.
    // However, this depends on your policy: if you want empty config => allow navigation,
    // change the following check accordingly. For safety, we'll treat empty as NOT all granted.
    if (requiredPermissions.isEmpty) {
      debugPrint('CHECK_PERM: requiredPermissions is EMPTY, returning false');
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

    // If no permissions defined, don't auto-navigate
    if (requiredPermissions.isEmpty) {
      debugPrint('requiredPermissions is empty');
      return false;
    }

    // Debug: Print all permissions and their required status
    for (var entry in requiredPermissions.entries) {
      final isGranted = currentStatuses[entry.key]?.isGranted == true;
      debugPrint(
          'Permission: ${entry.key}, Required: ${entry.value}, Granted: $isGranted');
    }

    // Check permissions:
    // - Required (entry.value == true): MUST be granted
    // - Optional (entry.value == false): Can be skipped
    final allGranted = requiredPermissions.entries.every((entry) {
      final isRequired = entry.value;
      final isGranted = currentStatuses[entry.key]?.isGranted == true;

      // Optional permission - don't block navigation
      if (!isRequired) {
        return true;
      }

      // Required permission - must be granted
      return isGranted;
    });

    debugPrint('allGranted: $allGranted');
    return allGranted;
  }

  Future<void> _requestPermission(Permission permission) async {
    try {
      final status = await permission.request();

      if (mounted) {
        setState(() {
          statuses[permission] = status;
        });
      }

      // Handle permanently denied - must open app settings
      if (status.isPermanentlyDenied && mounted) {
        Toast.showToast(
          context,
          message: localizations.translate(
            i18.common.permissionDeniedOpenSettings,
          ),
          type: ToastType.info,
        );
        await Future.delayed(const Duration(seconds: 1));
        await openAppSettings();
        // After returning from settings, refresh the status
        if (mounted) {
          final newStatus = await permission.status;
          setState(() {
            statuses[permission] = newStatus;
          });
        }
        return;
      }

      if (permission == Permission.ignoreBatteryOptimizations &&
          !status.isGranted) {
        await openAppSettings();
      }
    } catch (e) {
      // Handle PHASE_CLIENT_ALREADY_HIDDEN or other permission request errors
      // Directly open app settings
      debugPrint('Permission request error for $permission: $e');
      if (mounted) {
        Toast.showToast(
          context,
          message: localizations.translate(
            i18.common.permissionDeniedOpenSettings,
          ),
          type: ToastType.info,
        );
        await Future.delayed(const Duration(seconds: 1));
        await openAppSettings();
        // After returning from settings, refresh the status
        final newStatus = await permission.status;
        if (mounted) {
          setState(() {
            statuses[permission] = newStatus;
          });
        }
      }
    }
  }

  /// Request permission by name (from config)
  Future<void> _requestPermissionByName(String permissionName) async {
    final permission = permissionMap[permissionName.toLowerCase()];
    if (permission != null) {
      await _requestPermission(permission);
    }
  }

  /// Request all permission (from config)
  Future<void> _requestAllPermissions() async {
    for (final e in requiredPermissions.entries) {
      await _requestPermission(e.key);
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
      // Handle negation: {{ !context.xxx }} or {{ context.xxx }}
      final regex = RegExp(r'\{\{\s*(!?)\s*context\.(\w+)\s*\}\}');
      final match = regex.firstMatch(condition);
      if (match != null) {
        final isNegated = match.group(1) == '!';
        final key = match.group(2);
        if (key != null) {
          bool result = false;
          // Handle permission granted checks
          if (key.endsWith('PermissionGranted')) {
            final permissionName =
                key.replaceAll('PermissionGranted', '').toLowerCase();
            result = _isPermissionGranted(permissionName);
          }
          // Handle platform-specific visibility flags
          else if (key == 'showNearbyWifiDevices') {
            result = showNearbyWifiDevices;
          } else if (key == 'showBluetoothScan') {
            result = showBluetoothScan;
          }
          // Apply negation if present
          return isNegated ? !result : result;
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
  Future<void> _handleAction(Map<String, dynamic> action) async {
    final actionType = action['actionType'] as String?;
    final properties = action['properties'] != null
        ? Map<String, dynamic>.from(action['properties'] as Map)
        : <String, dynamic>{};

    switch (actionType) {
      case 'REQUEST_PERMISSION':
        final permission = properties['permission'] as String?;
        if (permission != null) {
          await _requestPermissionByName(permission);
        }
        break;
      case 'REQUEST_ALL_PERMISSIONS':
        await _requestAllPermissions();
        break;
      case 'ATTEMPT_NAVIGATION':
        attemptNavigation();
        break;
      case 'SHOW_DIALOG':
        await _dialogBuilder(context);
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

  void attemptNavigation() async {
    bool granted = await _checkPermissions();
    if (mounted && (!granted || !backgroundActivityConfirmed)) {
      Toast.showToast(
        context,
        message: localizations.translate(
          !backgroundActivityConfirmed
              ? i18.common.enablePermissionCheckbox
              : i18.common.permissionsAlert,
        ),
        type: ToastType.error,
      );
      return;
    }

    if (mounted) {
      context.router.replace(BoundarySelectionRoute());
    }
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showCustomPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) => Popup(
        title: '${localizations.translate(i18.common.accessRequired)} !',
        type: PopUpType.alert,
        titleIcon: Icon(
          Icons.warning,
          color: Theme.of(context).colorTheme.alert.error,
          size: spacer12,
        ),
        subHeading:
            localizations.translate(i18.common.accessPermissionDialogDesc),
        onCrossTap: () => Navigator.pop(context),
        contentPadding: const EdgeInsets.symmetric(vertical: spacer12),
        actions: [
          DigitButton(
              label: localizations.translate(i18.common.allowAccess),
              onPressed: () async {
                await _requestAllPermissions();

                if (mounted) {
                  Navigator.pop(context);
                  attemptNavigation();
                }
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.medium)
        ],
      ),
    );
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
                    padding: const EdgeInsets.all(spacer3),
                    child: Text(
                      localizations.translate(screenConfig!['heading']),
                      style: textTheme.headingXl.copyWith(
                        color: theme.colorTheme.primary.primary2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                // Description from config
                if (screenConfig?['description'] != null)
                  Padding(
                    padding: const EdgeInsets.all(spacer3),
                    child: Text(
                      localizations.translate(screenConfig!['description']),
                      style: textTheme.captionM.copyWith(
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
    if (footerConfig.isEmpty) return const SizedBox.shrink();
    return DigitCard(
      margin: const EdgeInsets.only(top: spacer2),
      children: footerConfig
          .map((item) =>
              _buildWidget(item as Map<String, dynamic>, theme, textTheme))
          .toList(),
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
      case 'infoCard':
        return _buildInfoCard(config, theme, textTheme);
      case 'checkbox':
        return _buildCheckbox(config, theme, textTheme);
      case 'button':
        return _buildButton(config, theme, textTheme);
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
    final isDescription = style == 'description';

    TextStyle textStyle;
    if (style == 'heading') {
      textStyle = textTheme.headingM.copyWith(
        color: theme.colorTheme.primary.primary2,
      );
    } else if (isDescription) {
      textStyle = textTheme.bodyS.copyWith(
        color: theme.colorTheme.text.secondary,
      );
    } else if (required || style == 'title') {
      textStyle = textTheme.headingS.copyWith(
        color: theme.colorTheme.primary.primary2,
      );
    } else {
      textStyle = textTheme.bodyS.copyWith(
        color: theme.colorTheme.primary.primary2,
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        top: isDescription ? 0 : spacer1,
        bottom: isDescription ? spacer1 : 0,
      ),
      child: Text(
        resolvedValue,
        style: textStyle,
        softWrap: true,
      ),
    );
  }

  Widget _buildIcon(Map<String, dynamic> config, ThemeData theme) {
    final iconName = config['value'] as String? ?? '';

    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        width: spacer12,
        height: spacer12,
        decoration: BoxDecoration(
          color: theme.colorTheme.primary.primaryBg,
          borderRadius: const BorderRadius.all(Radius.circular(spacer2)),
        ),
        child: Center(
          child: Icon(
            DigitIconMapping.getIcon(iconName),
            color: theme.colorTheme.primary.primary1,
            size: spacer6,
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(
    Map<String, dynamic> config,
    ThemeData theme,
    DigitTextTheme textTheme,
  ) {
    final label = config['label'] as String? ?? '';
    final fieldName = config['fieldName'] as String?;

    bool isChecked;
    if (fieldName == 'backgroundActivityConfirmed') {
      isChecked = backgroundActivityConfirmed;
    } else {
      isChecked = false;
    }

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: spacer2),
          child: DigitCheckbox(
            value: isChecked,
            onChanged: (val) {
              setState(() {
                backgroundActivityConfirmed = val ?? false;
              });
            },
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localizations.translate(label),
                  style: textTheme.bodyS.copyWith(
                    color: theme.colorTheme.primary.primary2,
                  ),
                ),
                if (config['required'] == true)
                  TextSpan(
                    text: " *",
                    style: textTheme.bodyS.copyWith(
                      color: theme.colorTheme.alert.error,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
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

    return DigitButton(
      label: localizations.translate(label),
      type: _parseButtonType(properties['type']),
      size: _parseButtonSize(properties['size']),
      mainAxisSize: properties['mainAxisSize'] == 'max'
          ? MainAxisSize.max
          : MainAxisSize.min,
      onPressed: () async {
        if (onAction != null) {
          for (var action in onAction) {
            await _handleAction(Map<String, dynamic>.from(action));
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
