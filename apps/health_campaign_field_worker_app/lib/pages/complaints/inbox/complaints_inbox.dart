import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

import '../../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class ComplaintsInboxPage extends LocalizedStatefulWidget {
  const ComplaintsInboxPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxPage> createState() => _ComplaintsInboxPageState();
}

class _ComplaintsInboxPageState extends LocalizedState<ComplaintsInboxPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final router = context.router;

    return Scaffold(
      body: BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
        builder: (context, state) {
          final inboxItems = state.complaints;

          // TODO(ajil): Fix this scrollable component
          return ScrollableContent(
            header: Column(
              children: const [
                BackNavigationHelpHeaderWidget(),
              ],
            ),
            footer: SizedBox(
              height: 85,
              child: DigitCard(
                margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                child: DigitElevatedButton(
                  onPressed: () async {
                    final bloc = context.read<ComplaintsInboxBloc>();

                    await router
                        .push(const ComplaintsRegistrationWrapperRoute());

                    bloc.add(
                      const ComplaintInboxLoadComplaintsEvent(),
                    );
                  },
                  child: Center(
                    child: Text(
                      localizations
                          .translate(i18.complaints.fileComplaintAction),
                    ),
                  ),
                ),
              ),
            ),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      localizations.translate(
                        i18.complaints.inboxHeading,
                      ),
                      style: theme.textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
              if (inboxItems.isEmpty)
                const SliverFillRemaining(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        // TODO(Neel): Add localization
                        "No complaints exist",
                      ),
                    ),
                  ),
                )
              else ...[
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.secondary,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          router.push(ComplaintsInboxSearchRoute());
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.search),
                            Text(localizations.translate(
                              i18.complaints.searchCTA,
                            )),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.secondary,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          router.push(ComplaintsInboxFilterRoute());
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.filter_list_alt),
                            Text(localizations.translate(
                              i18.complaints.filterCTA,
                            )),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.secondary,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          router.push(ComplaintsInboxSortRoute());
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.segment),
                            Text(localizations.translate(
                              i18.complaints.sortCTA,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = inboxItems.elementAt(index);

                      return _ComplaintsInboxItem(
                        item: item,
                        localizations: localizations,
                      );
                    },
                    childCount: inboxItems.length,
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _ComplaintsInboxItem extends StatelessWidget {
  final AppLocalizations localizations;
  final PgrServiceModel item;

  const _ComplaintsInboxItem({
    Key? key,
    required this.localizations,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DigitCard(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Complaint Number",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    item.serviceRequestId ?? "Not Generated\n(Sync required)",
                    style: TextStyle(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Complaint Type",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  // TODO(Neel): Add prefix for localization
                  child: Text(
                    localizations.translate(
                      item.serviceCode,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Complaint Date",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    item.auditDetails?.createdTime.toDateTime
                            .getFormattedDate() ??
                        "",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Area",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    item.address.boundary ?? "",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Status",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  // TODO(neel): Add localization
                  child: Text(
                    localizations.translate(
                      item.applicationStatus.name.snakeCase.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () {
                      //TODO: Open complaint
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    child: Text(
                      localizations.translate(i18.searchBeneficiary.iconLabel),
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
