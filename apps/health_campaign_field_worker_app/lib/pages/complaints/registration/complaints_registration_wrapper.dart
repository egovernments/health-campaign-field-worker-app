import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/complaints_registration/complaints_registration.dart';
import '../../../models/complaints/complaints.dart';
import '../../../models/data_model.dart';
import '../../../utils/utils.dart';

class ComplaintsRegistrationWrapperPage extends StatelessWidget {
  final PgrServiceModel? pgrServiceModel;

  const ComplaintsRegistrationWrapperPage({
    Key? key,
    this.pgrServiceModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        ComplaintsRegistrationState initialState;

        final pgrItem = pgrServiceModel;

        if (pgrItem != null) {
          String? supervisorContactNumber;
          String? supervisorName;

          final additionalDetails = pgrItem.additionalDetail;

          if (additionalDetails != null) {
            if (additionalDetails.containsKey('supervisorContactNumber')) {
              supervisorContactNumber =
                  additionalDetails['supervisorContactNumber'];
            }
            if (additionalDetails.containsKey('supervisorName')) {
              supervisorName = additionalDetails['supervisorName'];
            }
          }

          initialState = ComplaintsRegistrationViewState(
            complaintType: pgrItem.serviceCode,
            addressModel: pgrItem.address,
            complaintsDetailsModel: ComplaintsDetailsModel(
              administrativeArea: pgrItem.address.locality?.name ?? '',
              complainantContactNumber: pgrItem.citizen.mobileNumber ?? '',
              complainantName: pgrItem.citizen.name ?? '',
              complaintDescription: pgrItem.description,
              complaintRaisedFor:
                  context.loggedInUser.mobileNumber == pgrItem.citizen.name
                      ? 'Another user'
                      : 'Myself',
              dateOfComplaint: pgrItem.auditDetails?.createdTime.toDateTime ??
                  DateTime.now(),
              supervisorContactNumber: supervisorContactNumber ?? '',
              supervisorName: supervisorName ?? '',
            ),
          );
        } else {
          initialState = const ComplaintsRegistrationCreateState();
        }

        return ComplaintsRegistrationBloc(
          initialState,
          pgrServiceRepository:
              context.repository<PgrServiceModel, PgrServiceSearchModel>(),
        );
      },
      child: const AutoRouter(),
    );
  }
}
