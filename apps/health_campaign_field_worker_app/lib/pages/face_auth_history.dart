import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/localization/app_localization.dart';
import '../utils/extensions/extensions.dart';
import '../utils/i18_key_constants.dart' as i18;

/// Page that displays face authentication event history matching the
/// HCM "Verification History" design.
@RoutePage()
class FaceAuthHistoryPage extends StatefulWidget {
  const FaceAuthHistoryPage({super.key});

  @override
  State<FaceAuthHistoryPage> createState() => _FaceAuthHistoryPageState();
}

class _FaceAuthHistoryPageState extends State<FaceAuthHistoryPage> {
  static const _bg = Color(0xFFEEEEEE);
  static const _primaryTeal = Color(0xFF0B4B66);
  static const _primaryOrange = Color(0xFFC84C0E);
  static const _secondaryText = Color(0xFF787878);
  static const _textPrimary = Color(0xFF363636);
  static const _divider = Color(0xFFD6D5D4);
  static const _successColor = Color(0xFF00703C);
  static const _successBg = Color(0xFFF1FFF8);
  static const _warningColor = Color(0xFF9E5F00);
  static const _warningBg = Color(0xFFFFF9F0);
  static const _errorColor = Color(0xFFB91900);
  static const _errorBg = Color(0xFFFFF5F4);
  static const _methodTileBg = Color(0xFFF9FBFD);
  static const _methodTileBorder = Color(0xFFF1F5F9);
  static const _methodIconBg = Color(0xFFE7EEFE);

  List<FaceAuthEventModel>? _events;
  Map<String, String> _individualNames = {};
  /// Maps face auth event's stored individualId (UUID) → display ID (IND-...).
  /// Falls back to the UUID itself when no IndividualModel match exists.
  Map<String, String> _individualDisplayIds = {};
  bool _loading = true;
  int _selectedTab = 0; // 0 = Verification, 1 = Enrollment
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadEvents() async {
    try {
      final sql = context.read<
          LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>();
      final myId = context.loggedInIndividualIdOrNull ?? '';
      final myUuid = context.loggedInUserUuid;
      final allEvents = await sql.search(FaceAuthEventSearchModel());

      final combined = allEvents
          .where((e) =>
              e.individualId == myId ||
              e.clientAuditDetails?.createdBy == myUuid)
          .toList();
      combined.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      final idToName = <String, String>{};
      final idToDisplayId = <String, String>{};

      // Seed logged-in user's name directly from UserModel — their individual
      // record is not stored in the local individual table (only fetched from
      // remote during login), so the DB lookup below would miss them.
      if (myId.isNotEmpty) {
        try {
          final selfName = context.loggedInUserModel?.name ?? '';
          if (selfName.isNotEmpty) idToName[myId] = selfName;
        } catch (_) {}
      }

      try {
        final individualRepo = context
            .read<LocalRepository<IndividualModel, IndividualSearchModel>>();
        final uniqueIds = combined.map((e) => e.individualId).toSet().toList();
        if (uniqueIds.isNotEmpty) {
          final byId = await individualRepo.search(
            IndividualSearchModel(id: uniqueIds),
          );
          final byClientRef = await individualRepo.search(
            IndividualSearchModel(clientReferenceId: uniqueIds),
          );
          final allIndividuals = {...byId, ...byClientRef}.toList();
          for (final ind in allIndividuals) {
            final name = ind.name?.givenName ?? '';
            for (final key in [ind.id, ind.clientReferenceId]) {
              if (key == null || key.isEmpty) continue;
              if (name.isNotEmpty) idToName[key] = name;
              if (ind.individualId != null && ind.individualId!.isNotEmpty) {
                idToDisplayId[key] = ind.individualId!;
              }
            }
          }
        }
      } catch (_) {}

      if (mounted) {
        setState(() {
          _events = combined;
          _individualNames = idToName;
          _individualDisplayIds = idToDisplayId;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _events = [];
          _individualNames = {};
          _loading = false;
        });
      }
    }
  }

  List<FaceAuthEventModel> get _filteredEvents {
    if (_events == null) return const [];
    return _events!.where((e) {
      final isEnrolment = e.eventType == 'ENROLLMENT';
      if (_selectedTab == 0 && isEnrolment) return false;
      if (_selectedTab == 1 && !isEnrolment) return false;

      if (_searchQuery.isEmpty) return true;
      final q = _searchQuery.toLowerCase();
      final name =
          (_individualNames[e.individualId] ?? _subjectNameOf(e) ?? '')
              .toLowerCase();
      final displayId =
          (_individualDisplayIds[e.individualId] ?? '').toLowerCase();
      final uuid = e.individualId.toLowerCase();
      return name.contains(q) || displayId.contains(q) || uuid.contains(q);
    }).toList();
  }

  String? _subjectNameOf(FaceAuthEventModel e) {
    final fields = e.additionalFields?.fields;
    if (fields == null) return null;
    try {
      return fields
          .firstWhere((f) => f.key == 'subjectName')
          .value
          ?.toString();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)
                      .translate(i18.faceAuth.historyTitle),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: _primaryTeal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildTabs(),
            const SizedBox(height: 16),
            _buildSearch(),
            const SizedBox(height: 16),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).maybePop(),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_left, size: 24, color: _primaryTeal),
                  Text(
                    AppLocalizations.of(context)
                        .translate(i18.common.coreCommonBack),
                    style: const TextStyle(fontSize: 16, color: _primaryTeal),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _secondaryText),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 180),
            alignment: _selectedTab == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  color: _primaryOrange,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      offset: Offset(0, 1),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _buildTabButton(
                  label: AppLocalizations.of(context)
                      .translate(i18.faceAuth.historyTabVerification),
                  selected: _selectedTab == 0,
                  onTap: () => setState(() => _selectedTab = 0),
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  label: AppLocalizations.of(context)
                      .translate(i18.faceAuth.historyTabEnrollment),
                  selected: _selectedTab == 1,
                  onTap: () => setState(() => _selectedTab = 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 32,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: selected ? FontWeight.bold : FontWeight.w500,
              color: selected ? Colors.white : _secondaryText,
              height: 1.14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const Icon(Icons.search, size: 24, color: Color(0xFFB1B4B6)),
            const SizedBox(width: 6),
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: (v) => setState(() => _searchQuery = v),
                cursorColor: _primaryTeal,
                style: const TextStyle(
                  fontSize: 14,
                  color: _textPrimary,
                  height: 1.37,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  filled: false,
                  hintText: AppLocalizations.of(context)
                      .translate(i18.faceAuth.searchHint),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB1B4B6),
                    height: 1.37,
                  ),
                ),
              ),
            ),
            if (_searchQuery.isNotEmpty)
              InkWell(
                onTap: () {
                  _searchController.clear();
                  setState(() => _searchQuery = '');
                },
                child: const Icon(Icons.close,
                    size: 18, color: Color(0xFFB1B4B6)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    final events = _filteredEvents;
    if (events.isEmpty) return _buildEmpty();
    return RefreshIndicator(
      onRefresh: _loadEvents,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemCount: events.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final event = events[index];
          return _VerificationCard(
            event: event,
            individualName: _individualNames[event.individualId],
            displayId: _individualDisplayIds[event.individualId],
          );
        },
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.history_rounded, size: 64, color: _divider),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context).translate(i18.faceAuth.historyEmpty),
            style: const TextStyle(fontSize: 16, color: _secondaryText),
          ),
        ],
      ),
    );
  }
}

class _VerificationCard extends StatelessWidget {
  final FaceAuthEventModel event;
  final String? individualName;
  /// Human-readable "IND-..." code resolved from the IndividualModel
  /// for this event's individualId (UUID). Used in the card's ID line.
  final String? displayId;

  const _VerificationCard({
    required this.event,
    this.individualName,
    this.displayId,
  });

  @override
  Widget build(BuildContext context) {
    final outcome = _resolveOutcome(event);
    final methodInfo = _resolveMethod(event);
    final dateStr = _formatDate(event.timestamp);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: _FaceAuthHistoryPageState._divider),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              offset: Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 6, color: outcome.color),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _displayName(),
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: _FaceAuthHistoryPageState
                                            ._primaryTeal,
                                        height: 32 / 20,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                    Text(
                                      _idLabel(),
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: _FaceAuthHistoryPageState
                                            ._textPrimary,
                                        height: 16 / 12,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      AppLocalizations.of(context).translate(
                                          _eventTypeLabel(event.eventType)),
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: _FaceAuthHistoryPageState
                                            ._primaryTeal,
                                        height: 16 / 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _StatusPill(
                                label: AppLocalizations.of(context)
                                    .translate(outcome.label),
                                fg: outcome.color,
                                bg: outcome.bg,
                                icon: outcome.icon,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _MethodTile(
                            icon: methodInfo.icon,
                            leadingText: AppLocalizations.of(context)
                                .translate(methodInfo.label),
                            trailingText: methodInfo.trailing,
                            trailingColor: methodInfo.trailingColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: _FaceAuthHistoryPageState._divider,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 17, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.access_time,
                                  size: 15,
                                  color: _FaceAuthHistoryPageState
                                      ._secondaryText),
                              const SizedBox(width: 8),
                              Text(
                                dateStr,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: _FaceAuthHistoryPageState
                                      ._secondaryText,
                                  height: 20 / 14,
                                ),
                              ),
                            ],
                          ),
                          if (event.latitude != 0.0 || event.longitude != 0.0) ...[
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined,
                                    size: 15,
                                    color: _FaceAuthHistoryPageState
                                        ._secondaryText),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _formatLocation(
                                      event.latitude,
                                      event.longitude,
                                      event.locationAccuracy,
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color: _FaceAuthHistoryPageState
                                          ._secondaryText,
                                      height: 20 / 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _displayName() {
    if (individualName != null && individualName!.isNotEmpty) {
      return individualName!;
    }
    final fields = event.additionalFields?.fields;
    if (fields != null) {
      try {
        final name = fields
            .firstWhere((f) => f.key == 'subjectName')
            .value
            ?.toString();
        if (name != null && name.isNotEmpty) return name;
      } catch (_) {}
    }
    return 'Unknown';
  }

  /// Maps the FaceAuthEventModel.eventType to a human-readable label so the
  /// card can distinguish LOGIN, RE_VERIFY, CHECK_IN, ENROLLMENT visually.
  /// Returns the i18 CODE for the event type; the caller translates it
  /// (the card has a BuildContext, this static helper does not).
  static String _eventTypeLabel(String eventType) {
    switch (eventType) {
      case 'LOGIN':
        return i18.faceAuth.eventLoginVerification;
      case 'RE_VERIFY':
        return i18.faceAuth.eventReverification;
      case 'CHECK_IN':
        return i18.faceAuth.eventCheckIn;
      case 'ENROLLMENT':
        return i18.faceAuth.eventEnrollment;
      default:
        return eventType;
    }
  }

  String _idLabel() {
    // Prefer the human-readable "IND-..." display ID resolved from the
    // IndividualModel; fall back to the stored UUID only if we don't
    // have an individual lookup match.
    final id = (displayId != null && displayId!.isNotEmpty)
        ? displayId!
        : event.individualId;
    if (id.isEmpty) return 'ID: —';
    return 'ID: $id';
  }

  static String _formatLocation(double lat, double lng, double accuracy) {
    final latStr = lat.toStringAsFixed(5);
    final lngStr = lng.toStringAsFixed(5);
    if (accuracy > 0) {
      final accStr = accuracy.toStringAsFixed(0);
      return '$latStr, $lngStr (±${accStr}m)';
    }
    return '$latStr, $lngStr';
  }

  static String _formatDate(int millis) {
    final t = DateTime.fromMillisecondsSinceEpoch(millis);
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final month = months[t.month - 1];
    final hh = t.hour.toString().padLeft(2, '0');
    final mm = t.minute.toString().padLeft(2, '0');
    return '$month ${t.day}, ${t.year} | $hh:$mm';
  }

  _OutcomeInfo _resolveOutcome(FaceAuthEventModel e) {
    switch (e.outcome) {
      case 'FACE_SUCCESS':
        return _OutcomeInfo(
          label: i18.faceAuth.outcomeVerified,
          color: _FaceAuthHistoryPageState._successColor,
          bg: _FaceAuthHistoryPageState._successBg,
          icon: Icons.check_circle,
        );
      case 'PIN_FALLBACK':
        return _OutcomeInfo(
          label: i18.faceAuth.outcomePinUsed,
          color: _FaceAuthHistoryPageState._warningColor,
          bg: _FaceAuthHistoryPageState._warningBg,
          icon: Icons.warning_amber_rounded,
        );
      case 'HCM_FALLBACK':
        return _OutcomeInfo(
          label: i18.faceAuth.outcomeHcmFallback,
          color: _FaceAuthHistoryPageState._warningColor,
          bg: _FaceAuthHistoryPageState._warningBg,
          icon: Icons.warning_amber_rounded,
        );
      case 'MISSED':
        return _OutcomeInfo(
          label: i18.faceAuth.outcomeMissed,
          color: _FaceAuthHistoryPageState._warningColor,
          bg: _FaceAuthHistoryPageState._warningBg,
          icon: Icons.schedule,
        );
      case 'FACE_REJECTED':
      default:
        return _OutcomeInfo(
          label: i18.faceAuth.outcomeFailed,
          color: _FaceAuthHistoryPageState._errorColor,
          bg: _FaceAuthHistoryPageState._errorBg,
          icon: Icons.error,
        );
    }
  }

  _MethodInfo _resolveMethod(FaceAuthEventModel e) {
    if (e.outcome == 'PIN_FALLBACK' || e.outcome == 'HCM_FALLBACK') {
      return _MethodInfo(
        icon: Icons.dialpad,
        label: i18.faceAuth.methodEnrollmentPin,
        trailing: null,
        trailingColor: null,
      );
    }
    final percent = (e.confidence * 100);
    final isFail = e.outcome == 'FACE_REJECTED';
    return _MethodInfo(
      icon: Icons.face_retouching_natural,
      label: i18.faceAuth.methodFacialRecognition,
      trailing: percent > 0
          ? '${percent.toStringAsFixed(0)}% Match'
          : null,
      trailingColor: isFail
          ? _FaceAuthHistoryPageState._errorColor
          : _FaceAuthHistoryPageState._successColor,
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String label;
  final Color fg;
  final Color bg;
  final IconData icon;

  const _StatusPill({
    required this.label,
    required this.fg,
    required this.bg,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: fg, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: fg,
              height: 1.14,
            ),
          ),
        ],
      ),
    );
  }
}

class _MethodTile extends StatelessWidget {
  final IconData icon;
  final String leadingText;
  final String? trailingText;
  final Color? trailingColor;

  const _MethodTile({
    required this.icon,
    required this.leadingText,
    this.trailingText,
    this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _FaceAuthHistoryPageState._methodTileBg,
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: _FaceAuthHistoryPageState._methodTileBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 33,
            height: 32,
            decoration: BoxDecoration(
              color: _FaceAuthHistoryPageState._methodIconBg,
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 18,
                color: _FaceAuthHistoryPageState._primaryTeal),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: leadingText,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: _FaceAuthHistoryPageState._textPrimary,
                      height: 1.37,
                    ),
                  ),
                  if (trailingText != null) ...[
                    const TextSpan(
                      text: ' | ',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: _FaceAuthHistoryPageState._divider,
                        height: 1.37,
                      ),
                    ),
                    TextSpan(
                      text: trailingText,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: trailingColor ??
                            _FaceAuthHistoryPageState._successColor,
                        height: 1.37,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OutcomeInfo {
  final String label;
  final Color color;
  final Color bg;
  final IconData icon;

  const _OutcomeInfo({
    required this.label,
    required this.color,
    required this.bg,
    required this.icon,
  });
}

class _MethodInfo {
  final IconData icon;
  final String label;
  final String? trailing;
  final Color? trailingColor;

  const _MethodInfo({
    required this.icon,
    required this.label,
    this.trailing,
    this.trailingColor,
  });
}
