import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_info_card.dart';
import 'package:digit_ui_components/widgets/atoms/digit_search_bar.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:referral_reconciliation/utils/extensions/extensions.dart';
import 'package:survey_form/survey_form.dart';

import '../blocs/search_referral_reconciliations.dart';
import '../models/entities/hf_referral.dart';
import '../router/referral_reconciliation_router.gm.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/back_navigation_help_header.dart';
import '../widgets/localized.dart';
import '../widgets/view_referral_card.dart';

@RoutePage()
class SearchReferralReconciliationsPage extends LocalizedStatefulWidget {
  const SearchReferralReconciliationsPage({
    super.key,
    super.appLocalizations,
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
    final textTheme = theme.digitTextTheme(context);
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
                      create: (_) => ServiceBloc(
                            const ServiceEmptyState(),
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
                                  padding:
                                      EdgeInsets.all(theme.spacerTheme.spacer2),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(
                                            theme.spacerTheme.spacer2),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            localizations.translate(
                                              i18.referralReconciliation
                                                  .searchReferralsHeader,
                                            ),
                                            style: textTheme.headingXl,
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
                                                  .referralSearchHintText,
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
                                      SizedBox(
                                          height:
                                              theme.spacerTheme.spacer2 * 2),
                                      if (searchState.resultsNotFound &&
                                          searchController.text.isNotEmpty)
                                        InfoCard(
                                          title: localizations.translate(i18
                                              .referralReconciliation
                                              .beneficiaryInfoTitle),
                                          type: InfoType.info,
                                          description: localizations.translate(
                                            i18.referralReconciliation
                                                .referralInfoDescription,
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
                                      margin: EdgeInsets.only(
                                          bottom: theme.spacerTheme.spacer2),
                                      child: ViewReferralCard(
                                        hfReferralModel: i,
                                        onOpenPressed: () {
                                          context.read<ServiceBloc>().add(
                                                ServiceSearchEvent(
                                                  serviceSearchModel:
                                                      ServiceSearchModel(
                                                    referenceId:
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
                                              cycles: ReferralReconSingleton()
                                                  .cycles,
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
              bottomNavigationBar: Card(
                margin: const EdgeInsets.all(0),
                child: Container(
                  padding: EdgeInsets.all(theme.spacerTheme.spacer2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocBuilder<SearchReferralsBloc, SearchReferralsState>(
                        builder: (context, state) {
                          final router = context.router;

                          VoidCallback? onPressed;

                          onPressed = () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            final bloc = context.read<SearchReferralsBloc>();
                            router.push(
                              HFCreateReferralWrapperRoute(
                                viewOnly: false,
                                referralReconciliation: HFReferralModel(
                                  clientReferenceId: IdGen.i.identifier,
                                  name: state.searchQuery,
                                  beneficiaryId: state.tag,
                                ),
                                projectId: ReferralReconSingleton().projectId,
                                cycles: ReferralReconSingleton().cycles,
                              ),
                            );
                            searchController.clear();
                            bloc.add(
                              const SearchReferralsClearEvent(),
                            );
                          };
                          return DigitButton(
                            size: DigitButtonSize.large,
                            label: localizations.translate(
                              i18.referralReconciliation.createReferralLabel,
                            ),
                            mainAxisSize: MainAxisSize.max,
                            isDisabled: !(searchController.text.isNotEmpty &&
                                searchController.text.length >= 2),
                            onPressed: () {
                              if (onPressed != null) {
                                onPressed();
                              }
                            },
                            type: DigitButtonType.primary,
                          );
                        },
                      ),
                      SizedBox(
                        height: theme.spacerTheme.spacer2,
                      ),
                      DigitButton(
                        size: DigitButtonSize.large,
                        label: localizations
                            .translate(i18.referralReconciliation.scannerLabel),
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
                        type: DigitButtonType.secondary,
                        prefixIcon: Icons.qr_code,
                        mainAxisSize: MainAxisSize.max,
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
