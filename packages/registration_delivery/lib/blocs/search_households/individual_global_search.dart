import 'package:digit_data_model/models/entities/beneficiary_type.dart';
import 'package:flutter/foundation.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';

import '../../utils/global_search_parameters.dart';

class IndividualGlobalSearchBloc extends SearchHouseholdsBloc {
  IndividualGlobalSearchBloc(
      {required super.userUid,
      required super.projectId,
      required super.individual,
      required super.householdMember,
      required super.household,
      required super.projectBeneficiary,
      required super.taskDataRepository,
      required super.beneficiaryType,
      required super.sideEffectDataRepository,
      required super.addressRepository,
      required super.referralDataRepository,
      required super.individualGlobalSearchRepository}) {
    on<IndividualGlobalSearchEvent>(_individualGlobalSearch);
  }

  Future<void> _individualGlobalSearch(
    IndividualGlobalSearchEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    final results =
        await individualGlobalSearchRepository.individualGlobalSearch(
      GlobalSearchParameters(
        isProximityEnabled: event.globalSearchParams.isProximityEnabled,
        latitude: event.globalSearchParams.latitude,
        longitude: event.globalSearchParams.longitude,
        maxRadius: event.globalSearchParams.maxRadius,
        nameSearch: event.globalSearchParams.nameSearch,
        filter: event.globalSearchParams.filter,
        offset: event.globalSearchParams.offset,
        limit: event.globalSearchParams.limit,
      ),
    );

    var list = results.map((e) => e).toList(); // [TODO : group list and return household wrapper]

    if (kDebugMode) {
      print(list);
    }
  }
}
