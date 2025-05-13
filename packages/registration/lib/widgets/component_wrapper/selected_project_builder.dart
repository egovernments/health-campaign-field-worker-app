import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:registration/utils/i18_key_constants.dart' as i18;
import 'package:registration/utils/utils.dart';

import '../../blocs/app_localization.dart';

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
              RegistrationDeliveryLocalization.of(context)
                  .translate(i18.common.noProjectSelected),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
  }
}
