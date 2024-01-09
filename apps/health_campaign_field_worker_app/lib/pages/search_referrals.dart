import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/scanner/scanner.dart';
import '../blocs/search_referrals/search_referrals.dart';
import '../blocs/service/service.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/beneficiary/view_referral_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class SearchReferralsPage extends LocalizedStatefulWidget {
  const SearchReferralsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<SearchReferralsPage> createState() => _SearchReferralsPageState();
}

class _SearchReferralsPageState extends LocalizedState<SearchReferralsPage> {
  final TextEditingController searchController = TextEditingController();
  bool isProximityEnabled = false;

  @override
  void initState() {
    context.read<SearchReferralsBloc>().add(const SearchReferralsClearEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) =>
          BlocBuilder<AppInitializationBloc, AppInitializationState>(
        builder: (appContext, state) {
          if (state is! AppInitialized) return const Offstage();

          return Scaffold(
            body: BlocBuilder<SearchReferralsBloc, SearchReferralsState>(
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
                                    i18.referBeneficiary.searchReferralsHeader,
                                  ),
                                  style: theme.textTheme.displayMedium,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                DigitSearchBar(
                                  controller: searchController,
                                  hintText: localizations.translate(
                                    i18.searchBeneficiary
                                        .beneficiarySearchHintText,
                                  ),
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (value) {
                                    final bloc =
                                        context.read<SearchReferralsBloc>();
                                    if (value.trim().length < 2) {
                                      bloc.add(
                                        const SearchReferralsClearEvent(),
                                      );

                                      return;
                                    } else {
                                      bloc.add(SearchReferralsByNameEvent(
                                        projectId: context.projectId,
                                        searchText: value.trim(),
                                      ));
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if (searchState.resultsNotFound)
                              DigitInfoCard(
                                description: localizations.translate(
                                  i18.searchBeneficiary
                                      .beneficiaryInfoDescription,
                                ),
                                title: localizations.translate(
                                  i18.searchBeneficiary.beneficiaryInfoTitle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (ctx, index) {
                          final i = searchState.referrals.elementAt(index);

                          return Container(
                            margin: const EdgeInsets.only(bottom: kPadding),
                            child: ViewReferralCard(
                              hfReferralModel: i,
                              onOpenPressed: () {
                                context.read<ServiceBloc>().add(
                                      ServiceSearchEvent(
                                        serviceSearchModel: ServiceSearchModel(
                                          clientId: i.clientReferenceId,
                                        ),
                                      ),
                                    );
                                context.router.push(
                                  HFCreateReferralWrapperRoute(
                                    viewOnly: true,
                                    hfReferralModel: i,
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
            ),
            bottomNavigationBar: SizedBox(
              height: 150,
              child: Card(
                margin: const EdgeInsets.all(0),
                // padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
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
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  final bloc =
                                      context.read<SearchReferralsBloc>();
                                  router.push(
                                    HFCreateReferralWrapperRoute(
                                      viewOnly: false,
                                      hfReferralModel: HFReferralModel(
                                        clientReferenceId: '',
                                        name: state.searchQuery,
                                        beneficiaryId: state.tag,
                                      ),
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
                                i18.referBeneficiary.createReferralLabel,
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
                        onPressed: () {
                          context.read<ScannerBloc>().add(
                                const ScannerEvent.handleScanner(
                                  [],
                                  [],
                                ),
                              );
                          context.router.push(QRScannerRoute(
                            quantity: 1,
                            isGS1code: false,
                            sinlgleValue: true,
                          ));
                        },
                        icon: Icons.qr_code,
                        label: localizations.translate(
                          i18.deliverIntervention.scannerLabel,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
