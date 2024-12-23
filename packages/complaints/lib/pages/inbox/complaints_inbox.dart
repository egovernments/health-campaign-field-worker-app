import 'package:auto_route/auto_route.dart';
import 'package:complaints/router/complaints_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

import '../../models/pgr_complaints.dart';
import '/blocs/complaints_inbox/complaints_inbox.dart';
import '/blocs/localization/app_localization.dart';
import '/utils/i18_key_constants.dart' as i18;
import '/utils/utils.dart';
import '/widgets/header/back_navigation_help_header.dart';
import '/widgets/localized.dart';
import '/widgets/no_result_card/no_result_card.dart';

@RoutePage()
class ComplaintsInboxPage extends LocalizedStatefulWidget {
  const ComplaintsInboxPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ComplaintsInboxPage> createState() => ComplaintsInboxPageState();
}

class ComplaintsInboxPageState extends LocalizedState<ComplaintsInboxPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final router = context.router;

    return Scaffold(
      body: BlocBuilder<ComplaintsInboxBloc, ComplaintInboxState>(
        builder: (context, state) {
          final inboxItems =
              state.isFiltered ? state.filteredComplaints : state.complaints;

          return Column(
            children: [
              Expanded(
                child: ScrollableContent(
                  header: const Column(
                    children: [
                      BackNavigationHelpHeaderWidget(),
                    ],
                  ),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: spacer2 * 2,
                          bottom: spacer2,
                        ),
                        child: Text(
                          localizations.translate(
                            i18.complaints.inboxHeading,
                          ),
                          style: textTheme.headingXl,
                        ),
                      ),
                    ),
                    ...[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: spacer2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: spacer2 * 2),
                                child: DigitButton(
                                  type: DigitButtonType.tertiary,
                                  size: DigitButtonSize.medium,
                                  prefixIcon: Icons.search,
                                  label: localizations.translate(
                                    i18.complaints.searchCTA,
                                  ),
                                  onPressed: () {
                                    router.push(ComplaintsInboxSearchRoute());
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: DigitButton(
                                  type: DigitButtonType.tertiary,
                                  size: DigitButtonSize.medium,
                                  label: localizations.translate(
                                    i18.complaints.filterCTA,
                                  ),
                                  prefixIcon: Icons.filter_list_alt,
                                  onPressed: () {
                                    router.push(ComplaintsInboxFilterRoute());
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: spacer2 * 2),
                                child: DigitButton(
                                  type: DigitButtonType.tertiary,
                                  size: DigitButtonSize.medium,
                                  label: localizations.translate(
                                    i18.complaints.sortCTA,
                                  ),
                                  prefixIcon: Icons.segment,
                                  onPressed: () {
                                    router.push(ComplaintsInboxSortRoute());
                                  },
                                ),
                              ),
                            ],
                          ),
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
                            child: NoResultCard(
                              align: Alignment.center,
                              label: localizations
                                  .translate(i18.complaints.noComplaintsExist),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              DigitCard(
                  cardType: CardType.primary,
                  margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
                  children: [
                    DigitButton(
                      label: localizations.translate(
                        i18.complaints.fileComplaintAction,
                      ),
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                      onPressed: () async {
                        var loggedInUserUuid =
                            ComplaintsSingleton().loggedInUserUuid;
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
                    ),
                  ]),
            ],
          );
        },
      ),
    );
  }
}

class _ComplaintsInboxItem extends StatelessWidget {
  final ComplaintsLocalization localizations;
  final PgrServiceModel item;

  const _ComplaintsInboxItem({
    Key? key,
    required this.localizations,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return DigitCard(
      margin: const EdgeInsets.all(spacer2),
        cardType: CardType.primary, children: [
      LabelValueSummary(
        padding: EdgeInsets.zero,
        items: [
          LabelValueItem(
              label: localizations
                  .translate(i18.complaints.inboxNumberLabel),
              value: item.serviceRequestId ??
                  "${localizations.translate(i18.complaints.inboxNotGeneratedLabel)}\n${localizations.translate(i18.complaints.inboxSyncRequiredLabel)}",
            valueTextStyle: item.serviceRequestId !=null ? textTheme.bodyS.copyWith(color: theme.colorTheme.primary.primary1) : null ,
            labelFlex: 5,
          ),
          LabelValueItem(
            label: localizations.translate(i18.complaints.inboxTypeLabel),
            value: localizations.translate(
              item.serviceCode.snakeCase.toUpperCase().trim(),
            ),
            labelFlex: 5,
          ),
          LabelValueItem(
              label:
                  localizations.translate(i18.complaints.inboxDateLabel),
              value: item.auditDetails?.createdTime.toDateTime
                      .getFormattedDate() ??
                  "",
            labelFlex: 5,
          ),

          LabelValueItem(
              label:
                  localizations.translate(i18.complaints.inboxAreaLabel),
              value: item.address.locality?.name ?? "",
            labelFlex: 5,
          ),
          LabelValueItem(
              label: localizations
                  .translate(i18.complaints.inboxStatusLabel),
              value: localizations.translate(
                "COMPLAINTS_STATUS_${item.applicationStatus.name.snakeCase.toUpperCase()}",
              ),
            labelFlex: 5,
          ),
        ],
      ),
      DigitButton(
        label:
            localizations.translate(i18.searchBeneficiary.iconLabel),
        type: DigitButtonType.secondary,
        size: DigitButtonSize.large,
        mainAxisSize: MainAxisSize.max,
        onPressed: () {
          context.router.push(ComplaintsDetailsViewRoute(
            complaint: item,
          ));
        },
      ),
    ]);
  }
}
