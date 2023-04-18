import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/complaints_inbox/complaints_inbox.dart';
import '../../../models/data_model.dart';
import '../../../utils/utils.dart';

class ComplaintsInboxWrapperPage extends StatelessWidget {
  const ComplaintsInboxWrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComplaintsInboxBloc(
        const ComplaintInboxState.complaints(),
        pgrRepository:
            context.repository<PgrServiceModel, PgrServiceSearchModel>(),
      )..add(
          const ComplaintInboxLoadComplaintsEvent(),
        ),
      child: const AutoRouter(),
    );
  }
}
