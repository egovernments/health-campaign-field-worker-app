import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../models/complaints/complaints.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

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
    final bloc = context.read<ComplaintsInboxBloc>();
    final router = context.router;

    return Scaffold(
      body: BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
        builder: (context, state) {
          var inboxItems = state.complaintInboxItems;

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
                  onPressed: () {
                    router.push(const ComplaintsRegistrationWrapperRoute());
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
            children: [
              Padding(
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
              if (inboxItems == null) ...[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "No complaints exist",
                  ),
                ),
              ] else ...[
                Row(
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
                getInboxCards(inboxItems, theme),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget getInboxCards(List<ComplaintsInboxItem> inboxItems, ThemeData theme) {
    var cards = inboxItems.map((e) {
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
                      e.complaintNumber ?? "Not Generated\n(Sync required)",
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
                    child: Text(
                      e.complaintType ?? "",
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
                      e.dateOfComplaint ?? "",
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
                      e.area ?? "",
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
                    child: Text(
                      e.status ?? "",
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
                        localizations
                            .translate(i18.searchBeneficiary.iconLabel),
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
    });

    return Column(
      children: cards.toList(),
    );
  }
}
