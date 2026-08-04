import 'package:digit_data_model/data_model.dart' show EntityModel;
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/widget_registry.dart' show CrudItemContext;
import 'package:digit_flow_builder/widgets/resolved_flow_widget.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:flutter/material.dart';

import '../../blocs/localization/app_localization.dart';
import '../../utils/utils.dart';

/// A single face-auth event dot shown on the attendance card.
/// Mirrors the MC-branch attendance package rendering, but driven from the
/// attendance JSON flow config instead of a hardcoded package page.
class FaceEventDot {
  final Color color;

  /// Confidence in [0, 1]. 0 means no face scan (PIN fallback, missed, etc.).
  final double confidence;

  /// Short label shown below the dot, e.g. "PIN", "–", or "" for face events.
  final String label;

  /// Abbreviated event type shown below the confidence/label, e.g. "CI", "RV".
  final String eventType;

  const FaceEventDot({
    required this.color,
    required this.confidence,
    this.label = '',
    this.eventType = '',
  });
}

/// JSON-driven face-auth event dots for an attendee row.
///
/// Usage inside the attendance flow config (item-scoped placeholders are
/// interpolated by the flow builder before this widget receives the json):
///
/// ```json
/// {
///   "type": "template",
///   "format": "faceAuthEventDots",
///   "individualId": "{{item.entity.individualId}}"
/// }
/// ```
class FaceAuthEventDotsWidget extends ResolvedFlowWidget {
  @override
  String get format => 'faceAuthEventDots';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final individualId =
        resolved.resolveText(json['individualId']?.toString());

    // Session window selected via the date picker / session toggle
    // (fn:setAttendanceDate writes {date, entryTime, exitTime} into
    // widgetData). Falls back to today's bounds until a selection is made.
    int? entryTime;
    int? exitTime;
    final selected = resolved.widgetData['selectedAttendanceDate'];
    if (selected is Map) {
      entryTime = (selected['entryTime'] as num?)?.toInt();
      exitTime = (selected['exitTime'] as num?)?.toInt();
    }

    return _FaceAuthEventDotsRow(
      configIndividualId: individualId,
      entryTime: entryTime,
      exitTime: exitTime,
    );
  }
}

class _FaceAuthEventDotsRow extends StatelessWidget {
  /// Value resolved from the JSON config; may be empty or an unresolved
  /// placeholder when the interpolation can't traverse into a non-Map
  /// nested object (e.g. item.entity being an AttendeeModel).
  final String configIndividualId;

  /// Selected session window (millis). Null until the marker picks a
  /// date/session; then events are scoped to entryTime..exitTime like the
  /// MC mark-attendance screen.
  final int? entryTime;
  final int? exitTime;

  const _FaceAuthEventDotsRow({
    required this.configIndividualId,
    this.entryTime,
    this.exitTime,
  });

  /// Resolves the attendee's individualId: the JSON-config value when it
  /// interpolated cleanly, otherwise straight from the ambient
  /// [CrudItemContext] item this row was built for.
  String _resolveIndividualId(BuildContext context) {
    if (configIndividualId.isNotEmpty && !configIndividualId.contains('{{')) {
      return configIndividualId;
    }

    final item = CrudItemContext.of(context)?.item;
    if (item == null) return '';

    final entity = item['entity'];
    if (entity is Map && entity['individualId'] != null) {
      return entity['individualId'].toString();
    }
    if (entity is EntityModel) {
      try {
        final id = entity.toMap()['individualId'];
        if (id != null) return id.toString();
      } catch (_) {}
    }
    return item['individualId']?.toString() ?? '';
  }

  Future<List<FaceEventDot>> _loadDots(
      BuildContext context, String individualId) async {
    try {
      final repo = context
          .repository<FaceAuthEventModel, FaceAuthEventSearchModel>();

      String? projectId;
      try {
        projectId = context.selectedProject.id;
      } catch (_) {
        projectId = null;
      }
      if (projectId == null) return const [];

      final events = await repo.search(
        FaceAuthEventSearchModel(
          individualId: individualId,
          projectId: projectId,
        ),
      );

      // Scope to the selected session window (date picker + session toggle);
      // before any selection is made, fall back to today's bounds.
      final now = DateTime.now();
      final windowStart = entryTime ??
          DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
      final windowEnd = exitTime ??
          (DateTime(now.year, now.month, now.day).millisecondsSinceEpoch +
              const Duration(days: 1).inMilliseconds -
              1);

      final dayEvents = events
          .where((e) => e.timestamp >= windowStart && e.timestamp <= windowEnd)
          .toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

      debugPrint(
          '[FaceDots] $individualId: ${events.length} events, window=$windowStart..$windowEnd → ${dayEvents.length} in window');

      return dayEvents.map((e) {
        final typeLabel = _abbreviateEventType(e.eventType);
        switch (e.outcome) {
          case 'FACE_SUCCESS':
            return FaceEventDot(
                color: Colors.green,
                confidence: e.confidence,
                eventType: typeLabel);
          case 'PIN_FALLBACK':
          case 'HCM_FALLBACK':
            return FaceEventDot(
                color: Colors.orange,
                confidence: 0.0,
                label: 'PIN',
                eventType: typeLabel);
          case 'MISSED':
            return FaceEventDot(
                color: Colors.red,
                confidence: 0.0,
                label: '–',
                eventType: typeLabel);
          case 'FACE_REJECTED':
            return FaceEventDot(
                color: Colors.red,
                confidence: e.confidence,
                eventType: typeLabel);
          default:
            return FaceEventDot(
                color: Colors.grey, confidence: 0.0, eventType: typeLabel);
        }
      }).toList();
    } catch (e) {
      debugPrint('[FaceDots] load failed for $individualId: $e');
      return const [];
    }
  }

  static String _abbreviateEventType(String eventType) {
    switch (eventType) {
      case 'LOGIN':
        return 'L';
      case 'CHECK_IN':
        return 'CI';
      case 'RE_VERIFY':
        return 'RV';
      case 'ENROLLMENT':
        return 'EN';
      default:
        return eventType.isNotEmpty ? eventType[0] : '';
    }
  }

  static IconData _eventTypeIcon(String eventType) {
    switch (eventType) {
      case 'EN':
        return Icons.how_to_reg;
      case 'L':
        return Icons.login;
      case 'RV':
        return Icons.face_retouching_natural;
      case 'CI':
        return Icons.check_circle_outline;
      default:
        return Icons.radio_button_unchecked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final individualId = _resolveIndividualId(context);
    debugPrint('[FaceDots] row build: individualId=$individualId');
    if (individualId.isEmpty) return const SizedBox.shrink();

    return FutureBuilder<List<FaceEventDot>>(
      future: _loadDots(context, individualId),
      builder: (context, snapshot) {
        final dots = snapshot.data ?? const <FaceEventDot>[];
        if (dots.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: dots
                  .map((dot) => Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: dot.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              dot.confidence > 0
                                  ? '${(dot.confidence * 100).round()}%'
                                  : dot.label,
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                            if (dot.eventType.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Icon(
                                _eventTypeIcon(dot.eventType),
                                size: 9,
                                color: Colors.black54,
                              ),
                            ],
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

/// JSON-driven legend explaining face-event dot colors and event-type icons.
/// Place it once above the attendee list whenever face event dots are visible:
///
/// ```json
/// {"type": "template", "format": "faceAuthEventLegend"}
/// ```
class FaceAuthEventLegendWidget extends ResolvedFlowWidget {
  @override
  String get format => 'faceAuthEventLegend';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final localizations = AppLocalizations.of(context);

    Widget dotLegend(Color color, String label) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
          Text(label,
              style: textTheme.bodyXS
                  .copyWith(color: theme.colorTheme.text.secondary)),
        ],
      );
    }

    Widget iconLegend(IconData icon, String label) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.black54),
          const SizedBox(width: 4),
          Text(label,
              style: textTheme.bodyXS
                  .copyWith(color: theme.colorTheme.text.secondary)),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: spacer3),
      padding:
          const EdgeInsets.symmetric(horizontal: spacer3, vertical: spacer2),
      decoration: BoxDecoration(
        color: theme.colorTheme.paper.secondary,
        borderRadius: BorderRadius.circular(spacer1),
        border: Border.all(color: theme.colorTheme.generic.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline,
                  size: 14, color: theme.colorTheme.text.secondary),
              const SizedBox(width: 4),
              Text(
                localizations.translate('Legend'),
                style: textTheme.bodyXS.copyWith(
                  color: theme.colorTheme.text.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: spacer2),
          Wrap(
            spacing: spacer4,
            runSpacing: spacer1,
            children: [
              dotLegend(Colors.green, localizations.translate('Face Verified')),
              dotLegend(Colors.orange, localizations.translate('PIN Used')),
              dotLegend(Colors.red, localizations.translate('Missed/Rejected')),
            ],
          ),
          const SizedBox(height: spacer2),
          Wrap(
            spacing: spacer4,
            runSpacing: spacer1,
            children: [
              iconLegend(
                  Icons.how_to_reg, localizations.translate('Enrollment')),
              iconLegend(Icons.login, localizations.translate('Login')),
              iconLegend(Icons.check_circle_outline,
                  localizations.translate('Check-in')),
              iconLegend(Icons.face_retouching_natural,
                  localizations.translate('Re-verify')),
            ],
          ),
        ],
      ),
    );
  }
}
