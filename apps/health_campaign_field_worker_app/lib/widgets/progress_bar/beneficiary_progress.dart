import 'dart:math';

import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local_store/secure_store/secure_store.dart';
import '../../data/data_repository.dart';
import '../../data/repositories/local/individual.dart';
import '../../data/repositories/local/project_beneficiary.dart';
import '../../models/data_model.dart';
import '../../utils/utils.dart';
import '../progress_indicator/progress_indicator.dart';

class BeneficiaryProgressBar extends StatefulWidget {
  final String label;
  final String prefixLabel;
  final LocalSecureStore localSecureStore;

  const BeneficiaryProgressBar({
    Key? key,
    required this.label,
    required this.prefixLabel,
    required this.localSecureStore,
  }) : super(key: key);

  @override
  State<BeneficiaryProgressBar> createState() => _BeneficiaryProgressBarState();
}

class _BeneficiaryProgressBarState extends State<BeneficiaryProgressBar> {
  int current = 0;
  late final getSelectedProjectType;
  @override
  void didChangeDependencies() {
    final repository = context.read<
            LocalRepository<ProjectBeneficiaryModel,
                ProjectBeneficiarySearchModel>>()
        as ProjectBeneficiaryLocalRepository;

    final individualRepository =
        context.read<LocalRepository<IndividualModel, IndividualSearchModel>>()
            as IndividualLocalRepository;

    final now = DateTime.now();
    final gte = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final lte = DateTime(
      now.year,
      now.month,
      now.day,
      23,
      59,
      59,
      999,
    );

    int getAgeInYears(date) {
      return DigitDateUtils.calculateAge(
              DigitDateUtils.getFormattedDateToDateTime(date!) ??
                  DateTime.now(),)
          .years;
    }

    int getAgeInMonth(date) {
      return DigitDateUtils.calculateAge(
              DigitDateUtils.getFormattedDateToDateTime(date!) ??
                  DateTime.now(),)
          .months;
    }

    repository.listenToChanges(
      query: ProjectBeneficiarySearchModel(
        projectId: context.projectId,
      ),
      listener: (data) {
        if (mounted) {
          setState(() async {
            if (context.beneficiaryType == BeneficiaryType.individual) {
              getSelectedProjectType =
                  await widget.localSecureStore.selectedProjectType;
              List<String> clientReferenceIdsList = data
                  .map((element) => element.beneficiaryClientReferenceId)
                  .where((value) => value != null)
                  .cast<String>()
                  .toList();
              IndividualSearchModel individualSearchQuery =
                  IndividualSearchModel(
                      clientReferenceId: clientReferenceIdsList,);
              List<IndividualModel> results =
                  await individualRepository.search(individualSearchQuery);
              current = results
                  .where((element) =>
                      DateTime.fromMicrosecondsSinceEpoch(
                              element.clientAuditDetails!.createdTime,)
                          .isAfter(gte) &&
                      (element.isDeleted == false ||
                          element.isDeleted == null) &&
                      DateTime.fromMicrosecondsSinceEpoch(
                              element.clientAuditDetails!.createdTime,)
                          .isBefore(lte) &&
                      checkEligibilityForAgeAndSideEffect(
                        DigitDOBAge(
                          years: getAgeInYears(element.dateOfBirth),
                          months: getAgeInMonth(element.dateOfBirth),
                        ),
                        getSelectedProjectType,
                        null,
                        null,
                      ))
                  .length;
            } else {
              current = data
                  .where((element) =>
                      element.dateOfRegistrationTime.isAfter(gte) &&
                      (element.isDeleted == false ||
                          element.isDeleted == null) &&
                      element.dateOfRegistrationTime.isBefore(lte))
                  .length;
            }
          });
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final target = 65;

    return ProgressIndicatorContainer(
      label: '${max(target - current, 0).round()} ${widget.label}',
      prefixLabel: '$current ${widget.prefixLabel}',
      suffixLabel: target.toStringAsFixed(0),
      value: target == 0 ? 0 : min(current / target, 1),
    );
  }
}
