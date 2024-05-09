import 'package:flutter/material.dart';
import 'package:registration_delivery/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';

class SelectedProjectBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    ProjectModel selectedProject,
  ) projectBuilder;

  const SelectedProjectBuilder({
    super.key,
    required this.projectBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return RegistrationDeliverySingleton().selectedProject != null
        ? projectBuilder(
            context,
            RegistrationDeliverySingleton().selectedProject!,
          )
        : Center(
            child: Text(
              'No project selected',
              style: Theme.of(context).textTheme.headline6,
            ),
          );
  }
}
