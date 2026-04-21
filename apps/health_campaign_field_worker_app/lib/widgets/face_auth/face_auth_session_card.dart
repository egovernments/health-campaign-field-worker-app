import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router/app_router.dart';
import '../../services/face_auth_event_logger.dart';
import '../../utils/extensions/extensions.dart';

/// A card displayed on the home page showing face auth session status.
/// Shows: active session indicator, last verification details, history link.
class FaceAuthSessionCard extends StatefulWidget {
  const FaceAuthSessionCard({super.key});

  @override
  State<FaceAuthSessionCard> createState() => _FaceAuthSessionCardState();
}

class _FaceAuthSessionCardState extends State<FaceAuthSessionCard> {
  FaceAuthEventModel? _lastEvent;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadLastEvent();
  }

  Future<void> _loadLastEvent() async {
    try {
      final repo = context.read<
          LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>();
      final events = await repo.search(
        FaceAuthEventSearchModel(
          individualId: context.loggedInUserUuid,
        ),
      );
      events.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      final last = events
          .where((e) =>
              e.outcome == 'FACE_SUCCESS' || e.outcome == 'PIN_FALLBACK')
          .firstOrNull;
      if (mounted) {
        setState(() {
          _lastEvent = last;
          _loaded = true;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loaded = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorTheme.paper.primary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorTheme.generic.divider),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Active session row
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorTheme.alert.success,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Active Session',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorTheme.text.primary,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () =>
                    context.router.push(const FaceAuthHistoryRoute()),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'History',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: colorTheme.primary.primary1,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: colorTheme.primary.primary1,
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (_lastEvent != null) ...[
            Divider(height: 20, color: colorTheme.generic.divider),

            // Last verification details
            Row(
              children: [
                Icon(
                  _lastEvent!.outcome == 'FACE_SUCCESS'
                      ? Icons.face_rounded
                      : Icons.dialpad_rounded,
                  size: 18,
                  color: colorTheme.text.secondary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Last verified: ${_formatTime(_lastEvent!.timestamp)}',
                    style: TextStyle(
                      fontSize: 13,
                      color: colorTheme.text.secondary,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorTheme.alert.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    _lastEvent!.outcome == 'FACE_SUCCESS'
                        ? 'Face'
                        : 'PIN',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: colorTheme.alert.success,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(int epochMs) {
    final time = DateTime.fromMillisecondsSinceEpoch(epochMs);
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${time.day}/${time.month} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
