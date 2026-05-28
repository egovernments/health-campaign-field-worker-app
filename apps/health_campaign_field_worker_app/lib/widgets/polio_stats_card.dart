import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/localization/app_localization.dart';
import '../utils/utils.dart';

class PolioStatsCard extends StatefulWidget {
  const PolioStatsCard({super.key});

  /// Call this to trigger a refresh of the stats card from anywhere in the app.
  static final ValueNotifier<int> refreshNotifier = ValueNotifier<int>(0);

  static void refresh() {
    refreshNotifier.value++;
  }

  @override
  State<PolioStatsCard> createState() => _PolioStatsCardState();
}

class _PolioStatsCardState extends State<PolioStatsCard>
    with WidgetsBindingObserver {
  int totalReceived = 0;
  int totalReturned = 0;
  int availableVials = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    PolioStatsCard.refreshNotifier.addListener(_onRefreshNotified);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _loadCounts();
    });
  }

  @override
  void dispose() {
    PolioStatsCard.refreshNotifier.removeListener(_onRefreshNotified);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _onRefreshNotified() {
    _loadCounts();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadCounts();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadCounts();
  }

  /// Helper to get an additionalField value by key from a UserActionModel.
  String? _getAdditionalField(UserActionModel ua, String key) {
    return ua.additionalFields?.fields
        .where((f) => f.key == key)
        .firstOrNull
        ?.value
        ?.toString();
  }

  /// Helper to parse an additionalField value as int.
  int _getAdditionalFieldInt(UserActionModel ua, String key) {
    final raw = _getAdditionalField(ua, key);
    if (raw == null) return 0;
    return int.tryParse(raw) ?? 0;
  }

  Future<void> _loadCounts() async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      final userActionRepo = context
          .read<LocalRepository<UserActionModel, UserActionSearchModel>>();

      final projectId = context.projectId;

      // Get current boundary code for locality filter
      final currentBoundaryCode = context.boundaryOrNull?.code;

      final results = await userActionRepo.search(
        UserActionSearchModel(
          action: 'LOCATION_CAPTURE',
          projectId: projectId,
          isDeleted: false,
        ),
      );

      // Start-of-today in milliseconds
      final now = DateTime.now();
      final todayStart =
          DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;

      int received = 0;
      int returned = 0;

      for (final ua in results) {
        if (ua.action != 'LOCATION_CAPTURE') continue;

        // Must match current boundary code
        if (currentBoundaryCode != null && currentBoundaryCode.isNotEmpty) {
          final locality = _getAdditionalField(ua, 'locality');
          if (locality != currentBoundaryCode) continue;
        }

        // Must be created today
        final createdTime =
            ua.clientAuditDetails?.createdTime ?? ua.auditDetails?.createdTime;
        if (createdTime == null || createdTime < todayStart) continue;

        final formValue = _getAdditionalField(ua, 'form');

        if (formValue == 'POLIO_STOCK_ISSUED') {
          received += _getAdditionalFieldInt(ua, 'totalVialsReceivedForDay');
        } else if (formValue == 'POLIO_STOCK_RETURNED') {
          returned += _getAdditionalFieldInt(ua, 'totalReturned');
        }
      }

      final available = (received - returned) < 0 ? 0 : (received - returned);

      if (mounted) {
        setState(() {
          totalReceived = received;
          totalReturned = returned;
          availableVials = available;
        });
      }
    } catch (e) {
      debugPrint('PolioStatsCard error: $e');
    } finally {
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: spacer2, vertical: spacer1),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(spacer2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.translate(
                  'POLIO_HOME_STATS_TITLE',
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: spacer2),
              Row(
                children: [
                  Expanded(
                    child: _buildStatItem(
                      context,
                      label: localizations.translate(
                        'POLIO_HOME_STATS_TOTAL_RECEIVED',
                      ),
                      count: totalReceived,
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: _buildStatItem(
                      context,
                      label: localizations.translate(
                        'POLIO_HOME_STATS_TOTAL_RETURNED',
                      ),
                      count: totalReturned,
                      color: Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: _buildStatItem(
                      context,
                      label: localizations.translate(
                        'POLIO_HOME_STATS_AVAILABLE_VIALS',
                      ),
                      count: availableVials,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required String label,
    required int count,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          '$count',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: spacer1 / 2),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
