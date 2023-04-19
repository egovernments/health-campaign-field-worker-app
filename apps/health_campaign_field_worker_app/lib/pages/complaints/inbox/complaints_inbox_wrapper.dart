import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../../widgets/boundary_selection_wrapper.dart';

class ComplaintsInboxWrapperPage extends StatelessWidget with AutoRouteWrapper {
  const ComplaintsInboxWrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const BoundarySelectionWrapper(
        child: AutoRouter(),
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => ComplaintsInboxBloc(
          const ComplaintInboxState.complaints(),
          pgrRepository:
              context.repository<PgrServiceModel, PgrServiceSearchModel>(),
        )..add(
            ComplaintInboxLoadComplaintsEvent(
              createdByUserId: context.loggedInUserUuid,
            ),
          ),
        child: this,
      );
}
