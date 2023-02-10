import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../blocs/search_households/search_households.dart';
import '../data/network_manager.dart';
import '../models/beneficiary_statistics/beneficiary_statistics_model.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/beneficiary/beneficiary_statistics_card.dart';
import '../widgets/beneficiary/view_beneficiary_card.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class SearchBeneficiaryPage extends LocalizedStatefulWidget {
  const SearchBeneficiaryPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<SearchBeneficiaryPage> createState() => _SearchBeneficiaryPageState();
}

class _SearchBeneficiaryPageState
    extends LocalizedState<SearchBeneficiaryPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => SearchHouseholdsBloc(
        householdMember: context
            .read<NetworkManager>()
            .repository<HouseholdMemberModel, HouseholdMemberSearchModel>(
              context,
            ),
        household: context
            .read<NetworkManager>()
            .repository<HouseholdModel, HouseholdSearchModel>(
              context,
            ),
        individual: context
            .read<NetworkManager>()
            .repository<IndividualModel, IndividualSearchModel>(context),
      ),
      child: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) => Scaffold(
          body: ScrollableContent(
            header: Column(children: const [
              BackNavigationHelpHeaderWidget(),
            ]),
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    localizations
                        .translate(i18.searchBeneficiary.statisticsLabelText),
                    style: theme.textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              BeneficiaryStatisticsCard(
                beneficiaryStatistics: BeneficiaryStatisticsWrapperModel(
                  beneficiaryStatisticsList: [
                    BeneficiaryStatisticsModel(
                      title: '535',
                      content: localizations.translate(
                        i18.searchBeneficiary.noOfHouseholdsRegistered,
                      ),
                    ),
                    BeneficiaryStatisticsModel(
                      title: '756',
                      content: localizations.translate(
                        i18.searchBeneficiary.noOfResourcesDelivered,
                      ),
                    ),
                  ],
                ),
              ),
              DigitSearchBar(
                hintText: localizations.translate(
                  i18.searchBeneficiary.beneficiarySearchHintText,
                ),
                onChanged: (value) {
                  final bloc = context.read<SearchHouseholdsBloc>();
                  if (value.trim().length < 3) {
                    bloc.add(const SearchHouseholdsClearEvent());

                    return;
                  }

                  bloc.add(
                    SearchHouseholdsSearchByHouseholdHeadEvent(
                      searchText: value,
                    ),
                  );
                },
              ),
              // const ViewBeneficiaryCard(),
              const SizedBox(height: 16),
              BlocBuilder<SearchHouseholdsBloc, SearchHouseholdsState>(
                builder: (context, state) {
                  return state.map(
                    loading: (value) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    notFound: (value) => DigitInfoCard(
                      icon: Icons.info,
                      backgroundColor: theme.colorScheme.tertiaryContainer,
                      iconColor: theme.colorScheme.surfaceTint,
                      description: localizations.translate(
                        i18.searchBeneficiary.beneficiaryInfoDescription,
                      ),
                      title: localizations.translate(
                        i18.searchBeneficiary.beneficiaryInfoTitle,
                      ),
                    ),
                    empty: (value) => const Offstage(),
                    results: (value) => Column(
                      children: [
                        for (final i in value.householdMembers)
                          ViewBeneficiaryCard(
                            householdModel: i.householdModel,
                            individualModel: i.individualModel,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: Offstage(
            offstage: isKeyboardVisible,
            child: SizedBox(
              height: 90,
              child: DigitCard(
                child: BlocBuilder<SearchHouseholdsBloc, SearchHouseholdsState>(
                  builder: (context, state) {
                    final onPressed = state.maybeMap(
                      orElse: () => null,
                      notFound: (value) => () => context.router
                          .push(const BeneficiaryRegistrationWrapperRoute()),
                    );

                    return DigitElevatedButton(
                      onPressed: onPressed,
                      child: Center(
                        child: Text(localizations.translate(
                          i18.searchBeneficiary.beneficiaryAddActionLabel,
                        )),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
