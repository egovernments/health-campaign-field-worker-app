import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/face_auth_event_logger.dart';
import '../utils/extensions/extensions.dart';

/// Page that displays face authentication event history.
@RoutePage()
class FaceAuthHistoryPage extends StatefulWidget {
  const FaceAuthHistoryPage({super.key});

  @override
  State<FaceAuthHistoryPage> createState() => _FaceAuthHistoryPageState();
}

class _FaceAuthHistoryPageState extends State<FaceAuthHistoryPage> {
  List<FaceAuthEventModel>? _events;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    try {
      final sql = context.read<LocalRepository<FaceAuthEventModel,
          FaceAuthEventSearchModel>>();
      final events = await sql.search(
        FaceAuthEventSearchModel(
          individualId: context.loggedInUserUuid,
        ),
      );
      events.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      if (mounted) {
        setState(() {
          _events = events;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _events = [];
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Scaffold(
      backgroundColor: colorTheme.paper.primary,
      appBar: AppBar(
        title: Text(
          'Verification History',
          style: TextStyle(
            color: colorTheme.text.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorTheme.paper.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorTheme.text.primary),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _events == null || _events!.isEmpty
              ? _buildEmpty(colorTheme)
              : _buildList(),
    );
  }

  Widget _buildEmpty(dynamic colorTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_rounded,
            size: 64,
            color: colorTheme.generic.divider,
          ),
          const SizedBox(height: 16),
          Text(
            'No verification events yet',
            style: TextStyle(
              fontSize: 16,
              color: colorTheme.text.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return RefreshIndicator(
      onRefresh: _loadEvents,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _events!.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final event = _events![index];
          return _EventCard(event: event);
        },
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final FaceAuthEventModel event;

  const _EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    final time = DateTime.fromMillisecondsSinceEpoch(event.timestamp);
    final timeStr =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    final dateStr = '${time.day}/${time.month}/${time.year}';

    final outcomeInfo = _getOutcomeInfo(event.outcome, colorTheme);
    final eventTypeLabel = _getEventTypeLabel(event.eventType);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorTheme.paper.primary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorTheme.generic.divider),
      ),
      child: Row(
        children: [
          // Face image or status icon
          GestureDetector(
            onTap: event.faceImage != null
                ? () => _showFaceImageDialog(context, event.faceImage!, colorTheme)
                : null,
            child: _buildThumbnail(event.faceImage, outcomeInfo, colorTheme),
          ),
          const SizedBox(width: 14),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      eventTypeLabel,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: colorTheme.text.primary,
                      ),
                    ),
                    Text(
                      timeStr,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorTheme.text.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: outcomeInfo.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        outcomeInfo.label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: outcomeInfo.color,
                        ),
                      ),
                    ),
                    Text(
                      dateStr,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorTheme.generic.divider,
                      ),
                    ),
                  ],
                ),
                if (event.confidence > 0) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.analytics_outlined,
                          size: 13, color: colorTheme.text.secondary),
                      const SizedBox(width: 4),
                      Text(
                        'Accuracy: ${(event.confidence * 100).toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colorTheme.text.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
                if (event.latitude != 0.0 || event.longitude != 0.0) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 13, color: colorTheme.text.secondary),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${event.latitude.toStringAsFixed(5)}, ${event.longitude.toStringAsFixed(5)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorTheme.text.secondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
                if (event.responseType != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.touch_app_outlined,
                          size: 13, color: colorTheme.text.secondary),
                      const SizedBox(width: 4),
                      Text(
                        'Method: ${event.responseType}',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTheme.text.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getEventTypeLabel(String type) {
    switch (type) {
      case 'LOGIN':
        return 'Login Verification';
      case 'CHECK_IN':
        return 'Check-in';
      case 'RE_VERIFY':
        return 'Re-verification';
      case 'ENROLLMENT':
        return 'Face Enrollment';
      default:
        return type;
    }
  }

  Widget _buildThumbnail(
    String? faceImage,
    _OutcomeInfo outcomeInfo,
    dynamic colorTheme,
  ) {
    if (faceImage != null && faceImage.isNotEmpty) {
      try {
        final bytes = base64Decode(faceImage);
        return Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: outcomeInfo.color, width: 2),
          ),
          child: ClipOval(
            child: Image.memory(
              Uint8List.fromList(bytes),
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _buildIconFallback(outcomeInfo),
            ),
          ),
        );
      } catch (_) {
        // Invalid base64 — fall back to icon
      }
    }
    return _buildIconFallback(outcomeInfo);
  }

  Widget _buildIconFallback(_OutcomeInfo outcomeInfo) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: outcomeInfo.color.withOpacity(0.1),
      ),
      child: Icon(
        outcomeInfo.icon,
        color: outcomeInfo.color,
        size: 22,
      ),
    );
  }

  void _showFaceImageDialog(
    BuildContext context,
    String faceImage,
    dynamic colorTheme,
  ) {
    try {
      final bytes = base64Decode(faceImage);
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.memory(
                  Uint8List.fromList(bytes),
                  width: 220,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _getEventTypeLabel(event.eventType),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${DateTime.fromMillisecondsSinceEpoch(event.timestamp)}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
              if (event.confidence > 0) ...[
                const SizedBox(height: 4),
                Text(
                  'Accuracy: ${(event.confidence * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    } catch (_) {}
  }

  _OutcomeInfo _getOutcomeInfo(String outcome, dynamic colorTheme) {
    switch (outcome) {
      case 'FACE_SUCCESS':
        return _OutcomeInfo(
          label: 'Verified',
          color: colorTheme.alert.success,
          icon: Icons.check_circle_outline,
        );
      case 'FACE_REJECTED':
        return _OutcomeInfo(
          label: 'Rejected',
          color: colorTheme.alert.error,
          icon: Icons.cancel_outlined,
        );
      case 'PIN_FALLBACK':
        return _OutcomeInfo(
          label: 'PIN Used',
          color: const Color(0xFFFF9800),
          icon: Icons.dialpad_rounded,
        );
      case 'HCM_FALLBACK':
        return _OutcomeInfo(
          label: 'HCM Fallback',
          color: const Color(0xFFFF9800),
          icon: Icons.security,
        );
      case 'MISSED':
        return _OutcomeInfo(
          label: 'Missed',
          color: colorTheme.generic.divider,
          icon: Icons.schedule,
        );
      default:
        return _OutcomeInfo(
          label: outcome,
          color: colorTheme.generic.divider,
          icon: Icons.info_outline,
        );
    }
  }
}

class _OutcomeInfo {
  final String label;
  final Color color;
  final IconData icon;

  const _OutcomeInfo({
    required this.label,
    required this.color,
    required this.icon,
  });
}
