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
          final inboxItems =
              state.isFiltered ? state.filteredComplaints : state.complaints;

          // TODO(ajil): Fix this scrollable component
          return Column(
            children: [
              Expanded(
                child: ScrollableContent(
                  header: Column(
                    children: const [
                      BackNavigationHelpHeaderWidget(),
                    ],
                  ),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 16,
                          bottom: 16,
                        ),
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
                    ...[
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
                  children: [
                    if (inboxItems.isEmpty)
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              localizations
                                  .translate(i18.complaints.noComplaintsExist),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 85,
                child: DigitCard(
                  margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: DigitElevatedButton(
                    onPressed: () async {
                      var loggedInUserUuid = context.loggedInUserUuid;
                      final bloc = context.read<ComplaintsInboxBloc>();

                      await router.push(
                        ComplaintsRegistrationWrapperRoute(),
                      );

                      try {
                        bloc.add(
                          ComplaintInboxLoadComplaintsEvent(
                            createdByUserId: loggedInUserUuid,
                          ),
                        );
                      } catch (error) {
                        AppLogger.instance.error(
                          title: 'Error',
                          message: 'Error while loading complaints',
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        localizations.translate(
                          i18.complaints.fileComplaintAction,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                Expanded(
                  flex: 2,
                  child: Text(
                    localizations.translate(i18.complaints.inboxNumberLabel),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    item.serviceRequestId ??
                        "${localizations.translate(i18.complaints.inboxNotGeneratedLabel)}\n${localizations.translate(i18.complaints.inboxSyncRequiredLabel)}",
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
                Expanded(
                  flex: 2,
                  child: Text(
                    localizations.translate(i18.complaints.inboxTypeLabel),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    localizations.translate(
                      item.serviceCode.snakeCase.toUpperCase().trim(),
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
                Expanded(
                  flex: 2,
                  child: Text(
                    localizations.translate(i18.complaints.inboxDateLabel),
                    style: const TextStyle(
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
                Expanded(
                  flex: 2,
                  child: Text(
                    localizations.translate(i18.complaints.inboxAreaLabel),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    item.address.locality?.name ?? "",
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
                Expanded(
                  flex: 2,
                  child: Text(
                    localizations.translate(i18.complaints.inboxStatusLabel),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    localizations.translate(
                      "COMPLAINTS_STATUS_${item.applicationStatus.name.snakeCase.toUpperCase()}",
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
                      context.router.push(ComplaintsDetailsViewRoute(
                        complaint: item,
                      ));
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
