import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_repository.dart';
import '../../data/repositories/local/project_beneficiary.dart';
import '../../models/data_model.dart';
import '../progress_indicator/progress_indicator.dart';

class BeneficiaryProgressBar extends StatefulWidget {
  final String label;
  final String prefixLabel;

  const BeneficiaryProgressBar({
    Key? key,
    required this.label,
    required this.prefixLabel,
  }) : super(key: key);

  @override
  State<BeneficiaryProgressBar> createState() => _BeneficiaryProgressBarState();
}

class _BeneficiaryProgressBarState extends State<BeneficiaryProgressBar> {
  int target = 40;
  int current = 0;

  @override
  void didChangeDependencies() {
    final repository = context.read<
            LocalRepository<ProjectBeneficiaryModel,
                ProjectBeneficiarySearchModel>>()
        as ProjectBeneficiaryLocalRepository;

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

    repository.listenToChanges(
      query: ProjectBeneficiarySearchModel(),
      listener: (data) => setState(() {
        current = data
            .where((element) =>
                element.dateOfRegistrationTime.isAfter(gte) &&
                element.dateOfRegistrationTime.isBefore(lte))
            .length;
      }),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressIndicatorContainer(
      label: '${target - current} ${widget.label}',
      prefixLabel: '$current ${widget.prefixLabel}',
      suffixLabel: target.toString(),
      value: target == 0 ? 0 : current / target,
    );
  }
}
