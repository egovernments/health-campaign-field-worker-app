// GENERATED using mason_cli
import 'dart:async';
import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/complaints/complaints.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/typedefs.dart';
import '../../utils/utils.dart';

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
    state.maybeMap(
      orElse: () => throw (const InvalidComplaintsRegistrationStateException()),
      create: (value) {
        emit(value.copyWith(complaintType: event.complaintType));
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
    await state.maybeMap(
      orElse: () => throw (const InvalidComplaintsRegistrationStateException()),
      create: (value) async {
        emit(value.copyWith(loading: true));

        final serviceCode = value.complaintType;
        final complaintDetailsModel = value.complaintsDetailsModel;
        final address = value.addressModel;

        if (serviceCode == null) {
          throw (const InvalidComplaintsRegistrationStateException(
            'Complaint type is not provided',
          ));
        }

        if (complaintDetailsModel == null) {
          throw (const InvalidComplaintsRegistrationStateException(
            'Complaint details are not provided',
          ));
        }

        if (address == null) {
          throw (const InvalidComplaintsRegistrationStateException(
            'Address is not provided',
          ));
        }

        final description = complaintDetailsModel.complaintDescription;

        var referenceId = IdGen.i.identifier;

        var auditDetails = AuditDetails(
          createdBy: event.userId,
          createdTime: DateTime.now().millisecondsSinceEpoch,
        );

        Map<String, dynamic> additionalDetail = HashMap();
        additionalDetail.putIfAbsent(
          "supervisorName",
          () => complaintDetailsModel.supervisorName,
        );
        additionalDetail.putIfAbsent(
          "supervisorContactNumber",
          () => complaintDetailsModel.supervisorContactNumber,
        );

        final pgrServiceModel = PgrServiceModel(
          clientReferenceId: referenceId,
          tenantId: envConfig.variables.tenantId,
          serviceCode: serviceCode,
          description: description,
          source: 'mobile',
          applicationStatus: PgrServiceApplicationStatus.created,
          citizen: PgrComplainantModel(
            tenantId: envConfig.variables.tenantId,
            clientReferenceId: IdGen.i.identifier,
            complaintClientReferenceId: referenceId,
            name: complaintDetailsModel.complainantName,
            mobileNumber: complaintDetailsModel.complainantContactNumber,
            auditDetails: auditDetails,
            uuid: event.userId,
            userName: complaintDetailsModel.complainantContactNumber,
          ),
          address: address.copyWith(
            relatedClientReferenceId: referenceId,
          ),
          auditDetails: auditDetails,
          additionalDetail: additionalDetail,
        );

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
