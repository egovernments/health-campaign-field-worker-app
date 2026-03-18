import 'package:collection/collection.dart';
import 'package:digit_data_model/data/local_store/sql_store/tables/individual.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/layout_renderer.dart';
import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/widget_parsers.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:digit_flow_builder/widgets/flow_widget_interface.dart';
import 'package:digit_flow_builder/widgets/localization_context.dart';
import 'package:digit_flow_builder/widgets/resolved_flow_widget.dart';
import 'package:digit_ui_components/constants/icon_mapping.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

class MarkAttendanceCard extends ResolvedFlowWidget {
  @override
  String get format => 'markAttendanceCard';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final compositeKey = crudCtx?.compositeKey;
    final stateData = resolved.stateData;
    final listIndex = resolved.state.listIndex;
    final screenKey = resolved.screenKey;

    // final item = crudCtx?.item ?? {};

    final attendees = stateData?.modelMap['attendees'] as List<dynamic>? ?? [];
    final attendanceLog =
        stateData?.modelMap['attendanceLog'] as List<dynamic>? ?? [];

    // final attendanceLogStatusRaw = json['attendanceLogStatus'];
    // String attendanceLogStatus = attendanceLogStatusRaw != null
    //     ? resolved.resolveText(attendanceLogStatusRaw.toString())
    //     : "-1.0";

    bool groupByTeam = json['groupByTeam'] as bool? ?? false;

// Read spacing from properties (can be conditional, e.g., 0 when child is hidden)
    final spacingValue = json['properties']?['spacing'];
    final double? spacing =
        spacingValue is num ? spacingValue.toDouble() : null;

    return WidgetStateContext.reactive(context, (ctx, state) {
      String? searchBar = state.widgetData['searchBar'] as String?;
      if (state.widgetData["checkboxValue"] == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.updateWidgetData("checkboxValue", true);
        });
      }
      final selectedAttendanceDate =
          state.widgetData['selectedAttendanceDate'] as Map<String, dynamic>? ??
              {};
      List<dynamic> filteredAttendees = attendees.where((e) {
        if (searchBar == null || searchBar.length < 2) return true;
        String name =
            e['individual']?.first.name.givenName?.toLowerCase() ?? '';
        return name.contains(searchBar.toLowerCase());
      }).toList();
      final teams = _getTeams(filteredAttendees);
      return Builder(builder: (context) {
        if (groupByTeam) {
          return Column(
            children: [
              for (var teamKey in teams.keys.toList())
                DigitCard(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(5),
                    spacing: spacing,
                    cardType: WidgetParsers.parseCardType(
                        json['properties']?['type']?.toString() ?? 'primary'),
                    onPressed: () {
                      if (json['onAction'] != null) {
                        final actionsList =
                            List<Map<String, dynamic>>.from(json['onAction']);
                        final currentEvalContext =
                            resolved.getFreshEvalContext();

                        for (var actionJson in actionsList) {
                          final action = resolved.resolveAction(
                              actionJson, currentEvalContext);
                          onAction(action);
                        }
                      }
                    },
                    children: [
                      Text(
                        teamKey ?? '',
                        style:
                            Theme.of(context).digitTextTheme(context).headingM,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Column(
                        children: [
                          for (var item in teams[teamKey] ?? [])
                            _attendeeCard(
                                context,
                                spacing,
                                item,
                                compositeKey,
                                attendanceLog,
                                json,
                                onAction,
                                screenKey,
                                stateData,
                                listIndex,
                                selectedAttendanceDate),
                        ],
                      ),
                    ])
            ],
          );
        }
        return Column(
          children: [
            for (var item in filteredAttendees)
              _attendeeCard(
                  context,
                  spacing,
                  item,
                  compositeKey,
                  attendanceLog,
                  json,
                  onAction,
                  screenKey,
                  stateData,
                  listIndex,
                  selectedAttendanceDate),
          ],
        );
      });
    });
  }

  Widget _attendeeCard(context, spacing, item, compositeKey, attendanceLog,
      json, onAction, screenKey, stateData, listIndex, selectedAttendanceDate) {
    bool signatureCapture = json['signatureCapture'] as bool? ?? false;

    final statusMapping = json['statusMapping'] as Map<String, dynamic>? ?? {};
    final buttons = json['buttons'] as List<dynamic>? ?? [];

    // final props = Map<String, dynamic>.from(json['properties'] ?? {});
    final popupConfig = json['popupConfig'] as Map<String, dynamic>?;

    final signatureButtonLabel =
        json['signatureButtonLabel'] as String? ?? 'SIGNATURE_BUTTON_LABEL';

    final presentButtonLabel = buttons.first["label"];
    final presentButtonColor = buttons.first["color"] ?? 'green';
    final presentButtonPrefixIcon = buttons.first["prefixIcon"];

    final absentButtonLabel = buttons.last["label"];
    final absentButtonColor = buttons.last["color"] ?? 'red';
    final absentButtonPrefixIcon = buttons.last["prefixIcon"];

    final attendanceLogStatus = _getAttendanceLogsStatus(
      item['entity']?.individualId,
      selectedAttendanceDate?['entryTime'],
      attendanceLog,
    );

    String padding = 'spacer2';
    return _getUnmarkedAttendance(compositeKey, attendanceLogStatus)
        ? const SizedBox.shrink()
        : DigitCard(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(5),
            spacing: spacing,
            cardType: WidgetParsers.parseCardType(
                json['properties']?['type']?.toString() ?? 'primary'),
            children: [
              Text(
                item['individual']?.first.name.givenName ?? '',
                style: Theme.of(context).digitTextTheme(context).headingS,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                _getAttendanceStatusText(item['entity']?.individualId,
                    compositeKey, attendanceLogStatus, statusMapping),
                style: Theme.of(context).digitTextTheme(context).bodyS,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              if (attendanceLogStatus == -1.0 &&
                  !_isSameDate(compositeKey) &&
                  signatureCapture == false)
                Row(
                  children: [
                    Expanded(
                      child: DigitButton(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        label: presentButtonLabel,
                        onPressed: () async {
                          Map<String, dynamic> data = {
                            "individualId": item['entity']?.individualId,
                            "registerId": item['entity']?.registerId,
                            "status": 1.0, // 1.0 for present
                            "isMarkedManually":
                                true, // indicate manual marking for present
                          };
                          _markAttendance(data, compositeKey);
                        },
                        type: _getAttendanceStatus(item['entity']?.individualId,
                                    compositeKey) ==
                                1.0
                            ? DigitButtonType.primary
                            : DigitButtonType.secondary,
                        size: DigitButtonSize.small,
                        digitButtonThemeData: DigitButtonThemeData(
                          primaryDigitButtonColor:
                              DigitButtonThemeData.defaultTheme(context)
                                  .primaryDigitButtonColor,
                          DigitButtonColor: colorMap[presentButtonColor] ??
                              DigitButtonThemeData.defaultTheme(context)
                                  .DigitButtonColor,
                          disabledColor:
                              DigitButtonThemeData.defaultTheme(context)
                                  .disabledColor,
                          radius: BorderRadius.circular(spacer3),
                          largeRadius: BorderRadius.circular(spacer3),
                          smallMediumRadius: BorderRadius.circular(spacer3),
                          padding:
                              EdgeInsets.all(WidgetParsers.parseSize(padding)),
                        ),
                        prefixIcon: presentButtonPrefixIcon != null
                            ? DigitIconMapping.getIcon(presentButtonPrefixIcon)
                            : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DigitButton(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        label: absentButtonLabel,
                        onPressed: () async {
                          Map<String, dynamic> data = {
                            "individualId": item['entity']?.individualId,
                            "registerId": item['entity']?.registerId,
                            "status": 0.0, // 0.0 for absent
                            "isMarkedManually":
                                true, // indicate manual marking for absent
                          };
                          _markAttendance(data, compositeKey);
                        },
                        type: _getAttendanceStatus(item['entity']?.individualId,
                                    compositeKey) ==
                                0.0
                            ? DigitButtonType.primary
                            : DigitButtonType.secondary,
                        size: DigitButtonSize.small,
                        digitButtonThemeData: DigitButtonThemeData(
                          primaryDigitButtonColor:
                              DigitButtonThemeData.defaultTheme(context)
                                  .primaryDigitButtonColor,
                          DigitButtonColor: colorMap[absentButtonColor] ??
                              DigitButtonThemeData.defaultTheme(context)
                                  .DigitButtonColor,
                          disabledColor:
                              DigitButtonThemeData.defaultTheme(context)
                                  .disabledColor,
                          radius: BorderRadius.circular(spacer3),
                          largeRadius: BorderRadius.circular(spacer3),
                          smallMediumRadius: BorderRadius.circular(spacer3),
                          padding:
                              EdgeInsets.all(WidgetParsers.parseSize(padding)),
                        ),
                        prefixIcon: absentButtonPrefixIcon != null
                            ? DigitIconMapping.getIcon(absentButtonPrefixIcon)
                            : null,
                      ),
                    ),
                  ],
                ),
              if (attendanceLogStatus == -1.0 &&
                  !_isSameDate(compositeKey) &&
                  signatureCapture == true)
                Expanded(
                  child: DigitButton(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    label: signatureButtonLabel,
                    onPressed: () async {
                      // Trigger configured actions if any
                      if (json['onAction'] != null &&
                          json['onAction'] is List) {
                        final actionsList =
                            List<Map<String, dynamic>>.from(json['onAction']);

                        for (var raw in actionsList) {
                          final action = ActionConfig.fromJson(raw);
                          onAction(action);
                        }
                      }

                      // Show popup if popupConfig is provided
                      if (popupConfig != null) {
                        // Execute onOpenAction before showing popup
                        final onOpenActions =
                            popupConfig['onOpenAction'] as List<dynamic>?;
                        if (onOpenActions != null) {
                          for (var raw in onOpenActions) {
                            if (raw is Map<String, dynamic>) {
                              final action = ActionConfig.fromJson(raw);
                              onAction(action);
                            }
                          }
                        }

                        await _showActionPopup(
                            context,
                            popupConfig,
                            onAction,
                            screenKey,
                            stateData,
                            item,
                            listIndex,
                            compositeKey);
                      }
                    },
                    type: _getAttendanceStatus(
                                item['entity']?.individualId, compositeKey) !=
                            -1.0
                        ? DigitButtonType.primary
                        : DigitButtonType.secondary,
                    size: DigitButtonSize.small,
                    digitButtonThemeData: DigitButtonThemeData(
                      primaryDigitButtonColor:
                          DigitButtonThemeData.defaultTheme(context)
                              .primaryDigitButtonColor,
                      DigitButtonColor: (_getAttendanceStatus(
                                      item['entity']?.individualId,
                                      compositeKey) ==
                                  1.0
                              ? colorMap[presentButtonColor]
                              : colorMap[absentButtonColor]) ??
                          DigitButtonThemeData.defaultTheme(context)
                              .DigitButtonColor,
                      disabledColor: DigitButtonThemeData.defaultTheme(context)
                          .disabledColor,
                      radius: BorderRadius.circular(spacer3),
                      largeRadius: BorderRadius.circular(spacer3),
                      smallMediumRadius: BorderRadius.circular(spacer3),
                      padding: EdgeInsets.all(WidgetParsers.parseSize(padding)),
                    ),
                    prefixIcon: _getAttendanceStatus(
                                item['entity']?.individualId, compositeKey) !=
                            -1.0
                        ? DigitIconMapping.getIcon("Check")
                        : DigitIconMapping.getIcon("Edit"),
                  ),
                ),
            ],
          );
  }

  _getTeams(List<dynamic> attendees) {
    return groupBy(attendees, (e) => e['entity'].tag);
  }

  Map<String, Color> colorMap = {
    'green': Colors.green,
    'red': Colors.red,
  };

  /// Show the action popup based on configuration
  Future<dynamic> _showActionPopup(
    BuildContext context,
    Map<String, dynamic> popupConfig,
    void Function(ActionConfig) onAction,
    String? screenKey,
    CrudStateData? stateData,
    Map<String, dynamic>? item,
    int? listIndex,
    String? compositeKey,
  ) {
    final localization = LocalizationContext.maybeOf(context);
    final title = popupConfig['title'] as String? ?? 'Popup';
    final description = popupConfig['description'] as String?;
    final titleIconName = popupConfig['titleIcon'] as String?;
    final showCloseButton = popupConfig['showCloseButton'] as bool? ?? true;
    final barrierDismissible =
        popupConfig['barrierDismissible'] as bool? ?? true;
    final bodyWidgets = popupConfig['body'] as List<dynamic>? ?? [];
    final footerActions = popupConfig['footerActions'] as List<dynamic>? ?? [];

    return showCustomPopup(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        return Popup(
          title: localization?.translate(title) ?? title,
          description: description != null &&
                  localization!.translate(description).trim().isNotEmpty
              ? description
              : null,
          titleIcon: titleIconName != null
              ? Icon(
                  DigitIconMapping.getIcon(titleIconName),
                  color: DigitTheme.instance.colorScheme.primary,
                )
              : null,
          onCrossTap: showCloseButton
              ? () {
                  Navigator.of(ctx, rootNavigator: true).pop();
                }
              : null,
          actionSpacing: spacer2,
          additionalWidgets: [
            // Build body widgets from config
            // Wrap in LocalizationContext and CrudItemContext so widgets inside popup can access context data
            ...bodyWidgets.map((widgetJson) {
              if (widgetJson is Map<String, dynamic>) {
                return LocalizationContext(
                  localization: localization!,
                  child: CrudItemContext(
                    stateData: stateData,
                    screenKey: screenKey,
                    compositeKey: compositeKey,
                    item: item,
                    listIndex: listIndex,
                    child: Builder(
                      builder: (innerCtx) => FlowWidgetFactory.build(
                        widgetJson,
                        innerCtx,
                        onAction,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
          actions: footerActions.isEmpty
              ? null
              : footerActions
                  .whereType<Map<String, dynamic>>()
                  .map((actionJson) {
                  // Footer actions use original context which has LocalizationContext in its tree
                  return FlowWidgetFactory.build(
                    actionJson,
                    context,
                    onAction,
                  ) as DigitButton;
                }).toList(),
          inlineActions: true,
        );
      },
    );
  }

  _getAttendanceLogsStatus(
      String? individualId, int? selectedDateRaw, attendanceLogs) {
    {
      DateTime selectedDate = selectedDateRaw != null
          ? DateTime.fromMillisecondsSinceEpoch(selectedDateRaw)
          : DateTime.now();

      double status =
          _attendanceLogsStatus(individualId, selectedDate, attendanceLogs);
      return status; // 1.0 for present, 0.0 for absent, 0.5 for half day, -1.0 for unmarked
    }
  }

  double _attendanceLogsStatus(String? individualId, DateTime selectedDate,
      List<dynamic>? attendanceLogs) {
    if (attendanceLogs == null || individualId == null) return -1.0;

    // Fall back to stored attendanceLog from DB
    final filteredAttendanceLogs = attendanceLogs
        .where((attendanceLog) => attendanceLog["individualId"] == individualId)
        .toList();

    if (filteredAttendanceLogs.isEmpty) return -1.0;

    // Process attendanceLog if it exists and is a List

    final hasMorningLog =
        _hasLogWithType(filteredAttendanceLogs, selectedDate, 'ENTRY');
    final hasEveningLog =
        _hasLogWithType(filteredAttendanceLogs, selectedDate, 'EXIT');
    if (hasMorningLog && hasEveningLog) {
      final morningLogActive =
          _hasLogActiveStatus(filteredAttendanceLogs, selectedDate, 'ENTRY');
      final eveningActive =
          _hasLogActiveStatus(filteredAttendanceLogs, selectedDate, 'EXIT');

      if (morningLogActive && eveningActive) {
        return 1.0; // present
      } else if (!morningLogActive && !eveningActive) {
        return 0.0; // absent
      } else {
        return 0.5; // half day
      }
    }
    return -1.0;
  }

  bool _hasLogWithType(attendanceLog, DateTime date, String type) {
    final logTime = type == 'ENTRY'
        ? DateTime(date.year, date.month, date.day, 9).millisecondsSinceEpoch
        : DateTime(date.year, date.month, date.day, 18).millisecondsSinceEpoch;

    if (attendanceLog == null) return false;

    return attendanceLog.any((element) {
      final elementTime = element["time"];
      final elementType = element["type"]?.toString();
      return elementTime == logTime && elementType == type;
    });
  }

  bool _hasLogActiveStatus(attendanceLog, DateTime date, String type) {
    final logTime = type == 'ENTRY'
        ? DateTime(date.year, date.month, date.day, 9).millisecondsSinceEpoch
        : DateTime(date.year, date.month, date.day, 18).millisecondsSinceEpoch;

    if (attendanceLog == null) return false;

    return attendanceLog.any((element) {
      final elementTime = element["time"];
      final elementType = element["type"]?.toString();
      final elementStatus = element["status"];
      if (elementStatus == null) return false;
      if (elementTime == logTime && elementType == type) {
        return elementStatus == 'ACTIVE';
      }
      return false;
    });
  }

  bool _isSameDate(String? compositeKey) {
    if (compositeKey == null) return false;
    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});
    final selectedDate = widgetData['selectedAttendanceDate'] as Map?;
    if (selectedDate == null) return false;
    final entryTime = (selectedDate['entryTime'] as num?)?.toInt() ?? 0;
    final entryDate = DateTime.fromMillisecondsSinceEpoch(entryTime);
    final now = DateTime.now();
    return entryDate.year == now.year &&
        entryDate.month == now.month &&
        entryDate.day == now.day;
  }

  bool _getUnmarkedAttendance(
      String? compositeKey, double attendanceLogStatus) {
    if (compositeKey == null) return false;
    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});
    final checkboxValue = widgetData['checkboxValue'];
    if (checkboxValue == true && attendanceLogStatus != -1.0) {
      return true; // already marked, hide card
    }
    return false; // show card if not marked
  }

  String _getAttendanceStatusText(String? individualId, String? compositeKey,
      double attendanceLogStatus, Map<String, dynamic> statusMapping) {
    final status = _getAttendanceStatus(individualId, compositeKey);
    if (attendanceLogStatus != -1.0) {
      return statusMapping[attendanceLogStatus.toString()] ?? '';
    }
    return statusMapping[status.toString()] ??
        ''; // default to empty string if not marked
  }

  double _getAttendanceStatus(String? individualId, String? compositeKey) {
    final attendanceCollection =
        _getAttendanceCollection(individualId, compositeKey);

    final status = attendanceCollection['status'];
    return status ?? -1.0; // default to -1.0 (absent) if not marked
  }

  Map<String, dynamic> _getAttendanceCollection(
      String? individualId, String? compositeKey) {
    if (individualId == null) return {};
    if (compositeKey == null) return {};

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});

    final attendanceCollection = widgetData['attendanceCollection'];
    if (attendanceCollection is Map<String, dynamic>) {
      return attendanceCollection[individualId] as Map<String, dynamic>? ?? {};
    }
    return {};
  }

  Future<void> _markAttendance(
    Map<String, dynamic> data,
    String? compositeKey,
  ) async {
    final individualId = data['individualId']?.toString();
    final registerId = data['registerId']?.toString();
    final status = (data['status'] as num?)?.toDouble() ?? 1.0;
    final isMarkedManually = data['isMarkedManually'] as bool? ?? false;
    final signatureData = data['signatureData'] as String?;

    if (individualId == null || individualId.isEmpty) return;
    if (compositeKey == null) return;

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});

    final collection = Map<String, dynamic>.from(
      widgetData['attendanceCollection'] as Map? ?? {},
    );

    // Toggle logic matching _onIndividualAttendanceMark
    final existing = collection[individualId];
    final currentStatus =
        existing is Map ? (existing['status'] as num?)?.toDouble() : null;

    final double finalStatus;
    if (currentStatus == null || currentStatus == -1) {
      finalStatus = status;
    } else if (currentStatus == 1.0 && status == 1.0) {
      finalStatus = 1.0; // already present, keep present
    } else {
      finalStatus = status;
    }

    collection[individualId] = {
      'status': finalStatus,
      'registerId': registerId,
      'individualId': individualId,
      'isMarkedManually': isMarkedManually,
      'signatureData': signatureData,
    };
    widgetData['attendanceCollection'] = collection;

    if (currentState != null) {
      final updatedState = currentState.copyWith(
        widgetData: widgetData,
      );
      FlowCrudStateRegistry().update(compositeKey, updatedState);
    } else {
      final newState = FlowCrudState(
        widgetData: widgetData,
      );
      FlowCrudStateRegistry().update(compositeKey, newState);
    }
  }
}
