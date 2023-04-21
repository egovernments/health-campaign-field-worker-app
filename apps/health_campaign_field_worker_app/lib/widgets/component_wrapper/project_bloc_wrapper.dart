import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/project/project.dart';

class ProjectBlocWrapper extends StatelessWidget {
  final Widget child;

  const ProjectBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO(ajil): Fix localizations
    return BlocConsumer<ProjectBloc, ProjectState>(
      listener: (context, state) {
        DialogRoute? syncDialogRoute;

        state.maybeWhen(
          orElse: () {
            final isDialogOpen =
                syncDialogRoute != null && syncDialogRoute!.isActive;

            if (isDialogOpen) {
              Navigator.of(context).removeRoute(syncDialogRoute!);
            }
          },
          loading: () {
            syncDialogRoute = DialogRoute(
              context: context,
              builder: (context) => DigitDialog(
                options: DigitSyncDialogContent.getDialogOptions(
                  type: DigitSyncDialogType.inProgress,
                  label: 'Sync in progress',
                  barrierDismissible: false,
                ),
              ),
            );

            Navigator.of(context).push(syncDialogRoute!);
          },
          fetched: (projects, selectedProject) {
            if (selectedProject != null) return;
          },
        );
      },
      builder: (context, state) {
        return child;
      },
    );
  }
}
