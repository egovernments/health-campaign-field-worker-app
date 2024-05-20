import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';
import 'package:referral_reconciliation/utils/extensions/extensions.dart';

import '../blocs/referral_recon_service.dart';
import '../blocs/search_referral_reconciliations.dart';
import '../models/entities/h_f_referral.dart';
import '../router/referral_reconciliation_router.gm.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localizaed.dart';
import '../widgets/view_referral_card.dart';

@RoutePage()
class SearchReferralReconciliationsPage extends LocalizedStatefulWidget {
  final ReferralReconListener referralReconListener;
  final List<String> cycles;
  final String projectId;
  final String projectName;
  final String boundaryName;
  final String boundaryCode;
  final String roleCode;
  final String userName;
  final String userUUid;
  final String appVersion;
  final ValidIndividualAgeForCampaign validIndividualAgeForCampaign;
  final List<String> genders;
  final List<String> referralReasons;
  final String tenantId;
  final List<String> checklistTypes;

  const SearchReferralReconciliationsPage({
    super.key,
    super.appLocalizations,
    required this.referralReconListener,
    required this.projectId,
    required this.cycles,
    required this.validIndividualAgeForCampaign,
    required this.referralReasons,
    required this.appVersion,
    required this.userName,
    required this.boundaryName,
    required this.boundaryCode,
    required this.roleCode,
    required this.userUUid,
    required this.genders,
    required this.tenantId,
    required this.checklistTypes,
    required this.projectName,
  });

  @override
  State<SearchReferralReconciliationsPage> createState() =>
      _SearchReferralReconciliationsPageState();
}

class _SearchReferralReconciliationsPageState
    extends LocalizedState<SearchReferralReconciliationsPage> {
  final TextEditingController searchController = TextEditingController();
  bool isProximityEnabled = false;
  SearchReferralsBloc? searchReferralsBloc;

  @override
  void initState() {
    searchReferralsBloc = SearchReferralsBloc(
      const SearchReferralsState(),
      referralReconDataRepository:
          context.repository<HFReferralModel, HFReferralSearchModel>(context),
    );
    context.read<DigitScannerBloc>().add(
          const DigitScannerEvent.handleScanner(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) => BlocProvider<
                SearchReferralsBloc>(
            create: (context) => searchReferralsBloc!
              ..add(
                const SearchReferralsClearEvent(),
              ),
            child: Scaffold(
              body: BlocListener<DigitScannerBloc, DigitScannerState>(
                  listener: (context, scannerState) {
                    if (scannerState.qrCodes.isNotEmpty) {
                      context
                          .read<SearchReferralsBloc>()
                          .add(SearchReferralsEvent.searchByTag(
                            tag: scannerState.qrCodes.last,
                          ));
                    }
                  },
                  child: BlocProvider(
                      create: (_) => ReferralReconServiceBloc(
                            const ReferralReconServiceEmptyState(),
                            serviceDataRepository: context.repository<
                                ServiceModel, ServiceSearchModel>(context),
                          ),
                      child: BlocBuilder<SearchReferralsBloc,
                          SearchReferralsState>(
                        builder: (context, searchState) {
                          return ScrollableContent(
                            header: const Column(children: [
                              BackNavigationHelpHeaderWidget(),
                            ]),
                            slivers: [
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.all(kPadding),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(kPadding),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            localizations.translate(
                                              i18.referralReconciliation
                                                  .searchReferralsHeader,
                                            ),
                                            style:
                                                theme.textTheme.displayMedium,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          DigitSearchBar(
                                            controller: searchController,
                                            hintText: localizations.translate(
                                              i18.referralReconciliation
                                                  .beneficiarySearchHintText,
                                            ),
                                            textCapitalization:
                                                TextCapitalization.words,
                                            onChanged: (value) {
                                              final bloc = context
                                                  .read<SearchReferralsBloc>();
                                              if (value.trim().length < 2) {
                                                bloc.add(
                                                  const SearchReferralsClearEvent(),
                                                );

                                                return;
                                              } else {
                                                bloc.add(
                                                    SearchReferralsByNameEvent(
                                                  searchText: value.trim(),
                                                ));
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: kPadding * 2),
                                      if (searchState.resultsNotFound)
                                        DigitInfoCard(
                                          description: localizations.translate(
                                            i18.referralReconciliation
                                                .beneficiaryInfoDescription,
                                          ),
                                          title: localizations.translate(
                                            i18.referralReconciliation
                                                .beneficiaryInfoTitle,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (ctx, index) {
                                    final i =
                                        searchState.referrals.elementAt(index);

                                    return Container(
                                      margin: const EdgeInsets.only(
                                          bottom: kPadding),
                                      child: ViewReferralCard(
                                        hfReferralModel: i,
                                        onOpenPressed: () {
                                          context
                                              .read<ReferralReconServiceBloc>()
                                              .add(
                                                ReferralReconServiceSearchEvent(
                                                  serviceSearchModel:
                                                      ServiceSearchModel(
                                                    clientId:
                                                        i.clientReferenceId,
                                                  ),
                                                ),
                                              );
                                          context.router.push(
                                            HFCreateReferralWrapperRoute(
                                              viewOnly: true,
                                              referralReconciliation: i,
                                              projectId:
                                                  ReferralReconSingleton()
                                                      .projectId,
                                              cycles: widget.cycles,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  childCount: searchState.referrals.length,
                                ),
                              ),
                            ],
                          );
                        },
                      ))),
              bottomNavigationBar: SizedBox(
                height: 150,
                child: Card(
                  margin: const EdgeInsets.all(0),
                  // padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                  child: Container(
                    padding:
                        const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                    child: Column(
                      children: [
                        BlocBuilder<SearchReferralsBloc, SearchReferralsState>(
                          builder: (context, state) {
                            final router = context.router;

                            VoidCallback? onPressed;

                            onPressed = state.loading ||
                                    state.searchQuery == null ||
                                    (state.searchQuery ?? '').length < 2
                                ? null
                                : () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    final bloc =
                                        context.read<SearchReferralsBloc>();
                                    router.push(
                                      HFCreateReferralWrapperRoute(
                                        viewOnly: false,
                                        referralReconciliation: HFReferralModel(
                                          clientReferenceId: '',
                                          name: state.searchQuery,
                                          beneficiaryId: state.tag,
                                        ),
                                        projectId:
                                            ReferralReconSingleton().projectId,
                                        cycles: widget.cycles,
                                      ),
                                    );
                                    searchController.clear();
                                    bloc.add(
                                      const SearchReferralsClearEvent(),
                                    );
                                  };

                            return DigitElevatedButton(
                              onPressed: onPressed,
                              child: Center(
                                child: Text(localizations.translate(
                                  i18.referralReconciliation
                                      .createReferralLabel,
                                )),
                              ),
                            );
                          },
                        ),
                        DigitOutlineIconButton(
                          buttonStyle: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          onPressed: () async {
                            context.read<DigitScannerBloc>().add(
                                  const DigitScannerEvent.handleScanner(),
                                );
                            context.router.push(DigitScannerRoute(
                              quantity: 1,
                              isGS1code: false,
                              singleValue: true,
                            ));
                          },
                          icon: Icons.qr_code,
                          label: localizations.translate(
                            i18.referralReconciliation.scannerLabel,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
