import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../models/pgr_complaints.dart';
import '/blocs/complaints_registration/complaints_registration.dart';
import '/models/complaints.dart';
import '/utils/utils.dart';
import '/widgets/boundary_selection_wrapper.dart';


@RoutePage()
class ComplaintsRegistrationWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  final PgrServiceModel? pgrServiceModel;

  const ComplaintsRegistrationWrapperPage({
    Key? key,
    this.pgrServiceModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const BoundarySelectionWrapper(

      child: AutoRouter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:  (context) => LocationBloc(location: Location()),),
        BlocProvider(create: (context) {
      ComplaintsRegistrationState initialState;

      final pgrItem = pgrServiceModel;

      if (pgrItem != null) {
        final additionalDetails = PgrAdditionalDetails.fromJson(
          jsonDecode(pgrItem.additionalDetail!),
        );

        initialState = ComplaintsRegistrationViewState(
          complaintType: pgrItem.serviceCode,
          addressModel: pgrItem.address,
          complaintsDetailsModel: ComplaintsDetailsModel(
            administrativeArea: pgrItem.address.locality?.name ?? '',
            complainantContactNumber: pgrItem.user.mobileNumber ?? '',
            complainantName: pgrItem.user.name ?? '',
            complaintDescription: pgrItem.description,
            complaintRaisedFor:

            ComplaintsSingleton().userMobileNumber != pgrItem.user.mobileNumber
                ? 'Another user'
                : 'Myself',

            dateOfComplaint: pgrItem.auditDetails?.createdTime.toDateTime ??
                DateTime.now(),
            supervisorContactNumber:
            additionalDetails.supervisorContactNumber ?? '',
            supervisorName: additionalDetails.supervisorName ?? '',
          ),
        );
      } else {
        initialState = const ComplaintsRegistrationCreateState();
      }

      return ComplaintsRegistrationBloc(
        initialState,

        pgrServiceRepository:
        context.repository<PgrServiceModel, PgrServiceSearchModel>(context),

      );
    },
        )
      ],
      
      child: this,
    );
  }
}
