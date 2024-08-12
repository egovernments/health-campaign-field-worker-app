// GENERATED using mason_cli
import 'dart:async';

import 'package:complaints/complaints.dart';
import 'package:complaints/models/complaints.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/models/complaints.dart';
import '/utils/typedefs.dart';
import '/utils/utils.dart';

part 'complaints_registration.freezed.dart';

typedef ComplaintsRegistrationEmitter = Emitter<ComplaintsRegistrationState>;

class ComplaintsRegistrationBloc
    extends Bloc<ComplaintsRegistrationEvent, ComplaintsRegistrationState> {
  final PgrServiceDataRepository pgrServiceRepository;

  ComplaintsRegistrationBloc(
    super.initialState, {
    required this.pgrServiceRepository,
  }) {
    on(_handleSaveComplaintType);
    on(_handleSaveAddress);
    on(_handleComplaintDetails);
    on(_handleSubmitComplaints);
  }

  FutureOr<void> _handleSaveComplaintType(
    ComplaintsRegistrationSaveComplaintTypeEvent event,
    ComplaintsRegistrationEmitter emit,
  ) async {
    print("save complaint type");
    state.maybeMap(
      orElse: () => throw (const InvalidComplaintsRegistrationStateException()),
      create: (value) {
        emit(value.copyWith(
          complaintType: event.complaintType,
          otherComplaintTypeDescription: event.otherComplaintDescription,
        ));
      },
    );
  }

  FutureOr<void> _handleSaveAddress(
    ComplaintsRegistrationSaveAddressEvent event,
    ComplaintsRegistrationEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () => throw (const InvalidComplaintsRegistrationStateException()),
      create: (value) {
        emit(value.copyWith(addressModel: event.addressModel));
      },
    );
  }

  FutureOr<void> _handleComplaintDetails(
    ComplaintsRegistrationSaveComplaintDetailsEvent event,
    ComplaintsRegistrationEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () => throw (const InvalidComplaintsRegistrationStateException()),
      create: (value) {
        final code = event.boundaryModel.code;
        final name = event.boundaryModel.name;

        emit(
          value.copyWith(
            complaintsDetailsModel: event.complaintsDetailsModel,
            addressModel: value.addressModel?.copyWith(
              locality: code != null && name != null
                  ? LocalityModel(code: code, name: name)
                  : null,
            ),
          ),
        );
      },
    );
  }

  FutureOr<void> _handleSubmitComplaints(
    ComplaintsRegistrationSubmitComplaintEvent event,
    ComplaintsRegistrationEmitter emit,
  ) async {
    print("YASHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
    await state.maybeMap(
      orElse: () => throw (const InvalidComplaintsRegistrationStateException()),
      create: (value) async {
        print("inside registration Bloc - Loading");
        emit(value.copyWith(loading: true));

        final serviceCode = value.complaintType;
        final otherComplaintTypeDescription =
            value.otherComplaintTypeDescription;
        final complaintDetailsModel = value.complaintsDetailsModel;
        final address = value.addressModel;
        print("1111111111111111111");
        if (serviceCode == null) {
          throw (const InvalidComplaintsRegistrationStateException(
            'Complaint type is not provided',
          ));
        }
        print("22222222222222222");
        if (complaintDetailsModel == null) {
          throw (const InvalidComplaintsRegistrationStateException(
            'Complaint details are not provided',
          ));
        }
        print("33333333333333333333333");
        if (address == null) {
          throw (const InvalidComplaintsRegistrationStateException(
            'Address is not provided',
          ));
        }
        print("44444444444444");
        final description = complaintDetailsModel.complaintDescription;

        var referenceId = IdGen.i.identifier;

        var auditDetails = AuditDetails(
          createdBy: event.userId,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: event.userId,
        );

        final pgrServiceModel = PgrServiceModel(
            clientReferenceId: referenceId,
            tenantId: ComplaintsSingleton().tenantId,
            serviceCode: serviceCode,
            description: description,
            // source: AdditionalFieldsType.mobile.toValue(),
            applicationStatus: PgrServiceApplicationStatus.created,
            user: PgrComplainantModel(
              tenantId: ComplaintsSingleton().tenantId,
              clientReferenceId: IdGen.i.identifier,
              complaintClientReferenceId: referenceId,
              name: complaintDetailsModel.complainantName,
              mobileNumber: complaintDetailsModel.complainantContactNumber,
              auditDetails: auditDetails,
              clientAuditDetails: ClientAuditDetails(
                createdBy: event.userId,
                createdTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedBy: event.userId,
              ),
              uuid: event.userId,
              userName: complaintDetailsModel.complainantContactNumber,
              // type: AdditionalFieldsType.employee.toValue(),
            ),
            address: address.copyWith(
              relatedClientReferenceId: referenceId,
            ),
            auditDetails: auditDetails,
            additionalDetail: PgrAdditionalDetails(
              supervisorName: complaintDetailsModel.supervisorName,
              supervisorContactNumber:
                  complaintDetailsModel.supervisorContactNumber,
              otherComplaintDescription: otherComplaintTypeDescription,
            ).toString(),
            clientAuditDetails: ClientAuditDetails(
              createdBy: event.userId,
              createdTime: DateTime.now().millisecondsSinceEpoch,
              lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
              lastModifiedBy: event.userId,
            ));

        await pgrServiceRepository.create(pgrServiceModel);
        emit(value.copyWith(loading: false));

        emit(const ComplaintsRegistrationPersistedState());
      },
    );
  }
}

@freezed
class ComplaintsRegistrationEvent with _$ComplaintsRegistrationEvent {
  const factory ComplaintsRegistrationEvent.saveComplaintType({
    required String complaintType,
    String? otherComplaintDescription,
  }) = ComplaintsRegistrationSaveComplaintTypeEvent;

  const factory ComplaintsRegistrationEvent.saveAddress({
    required PgrAddressModel addressModel,
  }) = ComplaintsRegistrationSaveAddressEvent;

  const factory ComplaintsRegistrationEvent.saveComplaintDetails({
    required ComplaintsDetailsModel complaintsDetailsModel,
    required BoundaryModel boundaryModel,
  }) = ComplaintsRegistrationSaveComplaintDetailsEvent;

  const factory ComplaintsRegistrationEvent.submitComplaint({
    required String userId,
  }) = ComplaintsRegistrationSubmitComplaintEvent;
}

@freezed
class ComplaintsRegistrationState with _$ComplaintsRegistrationState {
  const factory ComplaintsRegistrationState.create({
    @Default(false) bool loading,
    String? complaintType,
    String? otherComplaintTypeDescription,
    PgrAddressModel? addressModel,
    ComplaintsDetailsModel? complaintsDetailsModel,
  }) = ComplaintsRegistrationCreateState;

  const factory ComplaintsRegistrationState.view({
    required String complaintType,
    required PgrAddressModel addressModel,
    required ComplaintsDetailsModel complaintsDetailsModel,
  }) = ComplaintsRegistrationViewState;

  const factory ComplaintsRegistrationState.persisted() =
      ComplaintsRegistrationPersistedState;
}

class InvalidComplaintsRegistrationStateException implements Exception {
  final String? message;

  const InvalidComplaintsRegistrationStateException([this.message]);
}
