import 'package:attendance_management/widgets/back_navigation_help_header.dart';
import 'package:attendance_management/widgets/localized.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/extensions/extensions.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/home/home_item_card.dart';

class SelectBeneficiaryPage extends LocalizedStatefulWidget {
  const SelectBeneficiaryPage({super.key});

  @override
  State<SelectBeneficiaryPage> createState() => _SelectBeneficiaryTypeState();
}

class _SelectBeneficiaryTypeState
    extends LocalizedState<SelectBeneficiaryPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollableContent(
      header: Column(
        children: [
          const BackNavigationHelpHeaderWidget(),
          Text(
            localizations
                .translate(i18.searchBeneficiary.selectBeneficiaryType),
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return homeItems.elementAt(index);
            },
            childCount: homeItems.length,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 145,
            childAspectRatio: 104 / 128,
          ),
        ),
      ],
    );
  }

  List<Widget> get homeItems => [
        HomeItemCard(
          icon: Icons.school,
          label: BeneficiaryType.school.toValue(),
          onPressed: () async {
            var selectedSchool = await context.router
                .push(SchoolSelectionRoute(schools: [context.boundary.code!]));

            if (selectedSchool != null) {
              context.router.push(
                BeneficiaryRegistrationWrapperRoute(
                  initialState: BeneficiaryRegistrationCreateState(
                    searchQuery: '${context.boundary.code!}',
                  ),
                ),
              );
            }
          },
        ),
        HomeItemCard(
          icon: Icons.house,
          label: BeneficiaryType.household.toValue(),
          onPressed: () async {
            context.router.push(
              const SelectBeneficiaryRoute(),
            );
          },
        ),
      ];
}
