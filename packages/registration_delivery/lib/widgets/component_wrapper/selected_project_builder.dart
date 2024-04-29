import 'package:digit_data_model/models/entities/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/utils/utils.dart';

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
