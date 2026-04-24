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
  int vialsOpened = 0;
  int vialsUsable = 0;
  int vialsUnusable = 0;
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

  Future<void> _loadCounts() async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      final userActionRepo = context
          .read<LocalRepository<UserActionModel, UserActionSearchModel>>();

      final projectId = context.projectId;

      // Fetch Stock Details (vials) from tally sheet entries
      final tallyResults = await userActionRepo.search(
        UserActionSearchModel(
          action: 'TALLY_SHEET',
          projectId: projectId,
          isDeleted: false,
        ),
      );

      int totalVialsOpened = 0;
      int usable = 0;
      int unusable = 0;
      for (final ua in tallyResults) {
        if (ua.action != 'TALLY_SHEET') continue;
        final vialsOpenedField = ua.additionalFields?.fields
            .where((f) => f.key == 'vialsOpenedToday')
            .firstOrNull;
        final usableField = ua.additionalFields?.fields
            .where((f) => f.key == 'vialsRemainingUsable')
            .firstOrNull;
        final unusableField = ua.additionalFields?.fields
            .where((f) => f.key == 'vialsUnusable')
            .firstOrNull;

        totalVialsOpened +=
            int.tryParse(vialsOpenedField?.value?.toString() ?? '0') ?? 0;
        usable +=
            int.tryParse(usableField?.value?.toString() ?? '0') ?? 0;
        unusable +=
            int.tryParse(unusableField?.value?.toString() ?? '0') ?? 0;
      }

      // Also check individual stock vial entries (saved as LOCATION_CAPTURE
      // with form=POLIO_STOCK in additionalFields)
      final stockResults = await userActionRepo.search(
        UserActionSearchModel(
          action: 'LOCATION_CAPTURE',
          projectId: projectId,
          isDeleted: false,
        ),
      );

      for (final ua in stockResults) {
        if (ua.action != 'LOCATION_CAPTURE') continue;
        // Only count entries that are stock vial records
        final formField = ua.additionalFields?.fields
            .where((f) => f.key == 'form')
            .firstOrNull;
        if (formField?.value?.toString() != 'POLIO_STOCK') continue;

        totalVialsOpened++;
        final vvmField = ua.additionalFields?.fields
            .where((f) => f.key == 'vvmStatus')
            .firstOrNull;
        final status = vvmField?.value?.toString() ?? '';
        if (status == 'USABLE') {
          usable++;
        } else if (status == 'UNUSABLE') {
          unusable++;
        }
      }

      if (mounted) {
        setState(() {
          vialsOpened = totalVialsOpened;
          vialsUsable = usable;
          vialsUnusable = unusable;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localizations.translate(
                      'POLIO_HOME_STATS_VIALS_OPENED',
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '$vialsOpened',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: spacer1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCountChip(
                    context,
                    label: localizations.translate(
                      'POLIO_HOME_STATS_USABLE',
                    ),
                    count: vialsUsable,
                    color: Colors.green,
                  ),
                  _buildCountChip(
                    context,
                    label: localizations.translate(
                      'POLIO_HOME_STATS_UNUSABLE',
                    ),
                    count: vialsUnusable,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountChip(
    BuildContext context, {
    required String label,
    required int count,
    required Color color,
  }) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: spacer2, vertical: spacer1),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(spacer1),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label - ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color,
                ),
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
