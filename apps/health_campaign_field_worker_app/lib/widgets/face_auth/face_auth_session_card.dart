import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/localization/app_localization.dart';
import '../../router/app_router.dart';
import '../../services/face_auth_event_logger.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/i18_key_constants.dart' as i18;

/// A card displayed on the home page showing face auth session status.
/// Shows: active session indicator, last verification details, history link.
class FaceAuthSessionCard extends StatefulWidget {
  const FaceAuthSessionCard({super.key});

  @override
  State<FaceAuthSessionCard> createState() => _FaceAuthSessionCardState();
}

class _FaceAuthSessionCardState extends State<FaceAuthSessionCard> {
  FaceAuthEventModel? _lastEvent;
  bool _isEnrolled = false;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadSessionState();
  }

  Future<void> _loadSessionState() async {
    final individualId = context.loggedInIndividualIdOrNull;
    if (individualId == null) {
      debugPrint('FaceAuthSessionCard: no loggedInIndividualId; skipping load');
      if (mounted) setState(() => _loaded = true);
      return;
    }

    // Capture providers up-front — after an await, `context` may be
    // deactivated during rebuild and `context.read` would throw.
    LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>? eventsRepo;
    FaceEmbeddingRepository? embeddingRepo;
    try {
      eventsRepo = context.read<
          LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>();
    } catch (e) {
      debugPrint('FaceAuthSessionCard: no event repo in scope: $e');
    }
    try {
      embeddingRepo = context.read<FaceEmbeddingRepository>();
    } catch (e) {
      debugPrint('FaceAuthSessionCard: no embedding repo in scope: $e');
    }

    // Isolate the two lookups so one failing does not wipe the other.
    FaceAuthEventModel? last;
    if (eventsRepo != null) {
      try {
        final events = await eventsRepo.search(
          FaceAuthEventSearchModel(individualId: individualId),
        );
        events.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        last = events
            .where((e) =>
                e.outcome == 'FACE_SUCCESS' || e.outcome == 'PIN_FALLBACK')
            .firstOrNull;
      } catch (e) {
        debugPrint('FaceAuthSessionCard: event lookup failed: $e');
      }
    }

    bool isEnrolled = false;
    if (embeddingRepo != null) {
      try {
        isEnrolled = await embeddingRepo.hasEmbedding(individualId);
        debugPrint(
            'FaceAuthSessionCard: individualId=$individualId isEnrolled=$isEnrolled');
      } catch (e) {
        debugPrint('FaceAuthSessionCard: enrollment lookup failed: $e');
      }
    }

    if (mounted) {
      setState(() {
        _lastEvent = last;
        _isEnrolled = isEnrolled;
        _loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Always render for eligible users once loaded — feature-flag + role
    // gating happens one level up in home.dart. Rendering here even when
    // the user isn't enrolled surfaces an actionable "Not Enrolled"
    // badge instead of an empty spot.
    if (!_loaded) {
      return const SizedBox.shrink();
    }

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
                  color: _isEnrolled
                      ? colorTheme.alert.success
                      : colorTheme.text.secondary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.activeSession),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorTheme.text.primary,
                ),
              ),
              const SizedBox(width: 8),
              // Enrollment status badge — surfaces whether the current
              // user has a stored face embedding so the card is
              // meaningful before any verification event exists.
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: (_isEnrolled
                          ? colorTheme.alert.success
                          : colorTheme.text.secondary)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  AppLocalizations.of(context).translate(
                    _isEnrolled
                        ? i18.faceAuth.statusEnrolled
                        : i18.faceAuth.statusNotEnrolled,
                  ),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: _isEnrolled
                        ? colorTheme.alert.success
                        : colorTheme.text.secondary,
                  ),
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
                      AppLocalizations.of(context)
                          .translate(i18.faceAuth.historyLabel),
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
                        ? AppLocalizations.of(context)
                            .translate(i18.faceAuth.methodFaceShort)
                        : AppLocalizations.of(context)
                            .translate(i18.faceAuth.methodPinShort),
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
