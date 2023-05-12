import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/project/project.dart';
import '../../models/entities/project.dart';

class SelectedProjectBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    ProjectModel selectedProject,
  ) projectBuilder;

  const SelectedProjectBuilder({
    Key? key,
    required this.projectBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        const noProjectSelected = Center(
          child: Text('No project selected'),
        );

        final selectedProject = projectState.selectedProject;

        if (projectState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (selectedProject == null) {
          return noProjectSelected;
        }

        return projectBuilder(context, selectedProject);
      },
    );
  }
}
