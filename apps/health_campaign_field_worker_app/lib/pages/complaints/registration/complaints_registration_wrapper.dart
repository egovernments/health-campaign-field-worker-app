import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/complaints_registration/complaints_registration.dart';

class ComplaintsRegistrationWrapperPage extends StatelessWidget {
  const ComplaintsRegistrationWrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComplaintsRegistrationBloc(
        const ComplaintsRegistrationState.saveComplaint(),
      ),
      child: const AutoRouter(),
    );
  }
}
