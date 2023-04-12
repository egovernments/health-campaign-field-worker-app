import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/complaints_registration/complaints_registration.dart';
import '../../../models/data_model.dart';
import '../../../utils/utils.dart';

class ComplaintsRegistrationWrapperPage extends StatelessWidget {
  const ComplaintsRegistrationWrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComplaintsRegistrationBloc(
        const ComplaintsRegistrationState.create(),
        pgrServiceRepository:
            context.repository<PgrServiceModel, PgrServiceSearchModel>(),
      ),
      child: const AutoRouter(),
    );
  }
}
