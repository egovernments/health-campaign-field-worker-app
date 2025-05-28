import 'dart:async';

import 'package:digit_data_model/data_model.dart';

import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/project_beneficiary.dart';

import 'search_households.dart';

class TagSearchBloc extends SearchHouseholdsBloc {
  TagSearchBloc(
      {required super.userUid,
      required super.projectId,
      required super.individual,
      required super.householdMember,
      required super.household,
      required super.projectBeneficiary,
      required super.beneficiaryType,
      required super.addressRepository,
      required super.individualGlobalSearchRepository,
      required super.houseHoldGlobalSearchRepository}) {
    on(handleSearchByTag);
  }

  FutureOr<void> handleSearchByTag(
    SearchHouseholdsByTagEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    List<ProjectBeneficiaryModel> beneficiaries =
        await projectBeneficiary.search(
      ProjectBeneficiarySearchModel(
        tag: [event.tag],
        projectId: [event.projectId],
      ),
    );

    List<IndividualModel> individuals = [];
    List<HouseholdModel> households = [];

    if (beneficiaryType == BeneficiaryType.household) {
      households = await household.search(HouseholdSearchModel(
        clientReferenceId:
            beneficiaries.map((e) => e.beneficiaryClientReferenceId!).toList(),
      ));
    } else {
      individuals = await individual.search(
        IndividualSearchModel(
          clientReferenceId: beneficiaries
              .map((e) => e.beneficiaryClientReferenceId!)
              .toList(),
        ),
      );
    }

    // Initialize a list to store household member wrappers.
    final containers = <HouseholdMemberWrapper>[];
    if (individuals.isNotEmpty || households.isNotEmpty) {
      final hhMembers = beneficiaryType == BeneficiaryType.individual
          ? await householdMember.search(
              HouseholdMemberSearchModel(
                individualClientReferenceIds:
                    individuals.map((e) => e.clientReferenceId).toList(),
              ),
            )
          : await householdMember.search(
              HouseholdMemberSearchModel(
                householdClientReferenceIds:
                    households.map((e) => e.clientReferenceId).toList(),
              ),
            );

      final member = hhMembers.first;

      final members = await householdMember.search(
        HouseholdMemberSearchModel(
          householdClientReferenceId: [
            member.householdClientReferenceId.toString()
          ],
        ),
      );
      final headMember =
          members.where((element) => element.isHeadOfHousehold).first;

      final individualList = await individual.search(
        IndividualSearchModel(
          clientReferenceId:
              members.map((e) => e.individualClientReferenceId!).toList(),
        ),
      );

      final householdList = await household.search(HouseholdSearchModel(
        clientReferenceId: [members.first.householdClientReferenceId!],
      ));

      // Group household members by household client reference ID.

      containers.add(
        HouseholdMemberWrapper(
          household: householdList.firstWhere((element) =>
              element.clientReferenceId == member.householdClientReferenceId),
          headOfHousehold: individualList.firstWhere((element) =>
              headMember.individualClientReferenceId ==
              element.clientReferenceId),
          members: individualList,
          projectBeneficiaries: beneficiaries,
        ),
      );
    }

    emit(state.copyWith(
      householdMembers: containers,
      loading: false,
      tag: event.tag,
    ));
  }
}
