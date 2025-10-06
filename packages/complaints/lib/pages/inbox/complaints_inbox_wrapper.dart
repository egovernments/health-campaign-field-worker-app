import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:complaints/blocs/complaints_inbox/complaints_inbox.dart';
import 'package:complaints/utils/utils.dart';
import '/models/pgr_complaints.dart';

@RoutePage()
class ComplaintsInboxWrapperPage extends StatelessWidget {
  const ComplaintsInboxWrapperPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComplaintsInboxBloc(
        const ComplaintInboxState.complaints(),
        pgrRepository:context.repository<PgrServiceModel, PgrServiceSearchModel>(context),
      )..add(
        ComplaintInboxLoadComplaintsEvent(
          createdByUserId: ComplaintsSingleton().loggedInUserUuid,
        ),
      ),
      child: const AutoRouter(),
    );

  }
}
