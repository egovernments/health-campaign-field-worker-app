import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/models/enum_values.mapper.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/enum_values.dart';

part 'attendance_individual_bloc.freezed.dart';

typedef AttendanceIndividualEmitter = Emitter<AttendanceIndividualState>;

class AttendanceIndividualBloc
    extends Bloc<AttendanceIndividualEvent, AttendanceIndividualState> {
  AttendanceIndividualBloc()
      : super(
          const AttendanceIndividualState.initial(),
        ) {
    on<AttendanceIndividualLogSearchEvent>(_onIndividualAttendanceLogSearch);
    on<AttendanceMarkEvent>(_onIndividualAttendanceMark);
    on<SaveAsDraftEvent>(_onSaveAsDraft);
    // on<UploadAttendanceEvent>(_onUploadAttendanceToServer);
    on<SearchAttendeesEvent>(_onSearchAttendeeByName);
    // on<DisposeAttendanceIndividualEvent>(_onDispose);
  }

  // FutureOr<void> _onDispose(
  //   DisposeAttendanceIndividualEvent event,
  //   AttendanceIndividualEmitter emit,
  // ) async {
  //   emit(const AttendanceIndividualState.initial());
  // }

  FutureOr<void> _onIndividualAttendanceLogSearch(
    AttendanceIndividualLogSearchEvent event,
    AttendanceIndividualEmitter emit,
  ) async {
    emit(const AttendanceIndividualState.loading());

    try {
      bool attendanceSubmitted = false;
      List<AttendeeModel> attendees = [];
      AttendanceSingleton().searchAttendanceLog(SearchAttendanceLog(
          registerId: event.registerId,
          tenantId: event.tenantId,
          entryTime: event.entryTime,
          exitTime: event.exitTime,
          currentDate: event.currentDate,
          onLogLoaded: (logResponse) =>
              checkResponse(logResponse, attendees, event)));
      // }
    } catch (ex) {
      String? error = ex as String;

      emit(AttendanceIndividualState.error(error));
    }
  }

  FutureOr<void> _onIndividualAttendanceMark(
    AttendanceMarkEvent event,
    AttendanceIndividualEmitter emit,
  ) async {
    await state.maybeMap(
      loaded: (value) async {
        List<AttendeeModel>? searchList;
        double status = 0;
        List<AttendeeModel> updatedList =
            value.attendanceCollectionModel!.map((e) {
          if (e.individualId == event.individualId) {
            if (e.status == -1) {
              status = 1;
            } else if (e.status == 1) {
              if (event.isSingleSession) {
                status = 0.5;
              } else {
                status = 0;
              }
            } else if (event.isSingleSession && e.status == 0.5) {
              status = 0;
            } else {
              status = 1;
            }
            return e.copyWith(status: status);
          }
          return e;
        }).toList();

        if (value.attendanceSearchModelList != null &&
            (value.attendanceSearchModelList ?? []).isNotEmpty) {
          searchList = value.attendanceSearchModelList!.map((e) {
            if (e.individualId == event.individualId) {
              if (e.status == -1) {
                status = 1;
              } else if (e.status == 1) {
                status = 0;
              } else {
                status = 1;
              }
              return e.copyWith(status: status);
            }
            return e;
          }).toList();
        }

        emit(value.copyWith(
          attendanceSearchModelList: searchList,
          attendanceCollectionModel: updatedList,
        ));
      },
      orElse: () {},
    );
  }

  FutureOr<void> _onSaveAsDraft(
    SaveAsDraftEvent event,
    AttendanceIndividualEmitter emit,
  ) async {
    final List<AttendanceLogModel> list = [];
    await state.maybeMap(
      loaded: (value) async {
        DateTime twelvePM = DateTime(event.selectedDate.year,
            event.selectedDate.month, event.selectedDate.day, 11, 58);
        int halfDay = twelvePM.millisecondsSinceEpoch;
        if (value.attendanceCollectionModel != null) {
          value.attendanceCollectionModel?.forEach((e) {
            if (e.status != -1) {
              list.addAll([
                AttendanceLogModel(
                  individualId: e.individualId,
                  registerId: e.registerId,
                  tenantId: e.tenantId,
                  type: EnumValues.entry.toValue(),
                  status: e.status == 0
                      ? EnumValues.inactive.toValue()
                      : EnumValues.active.toValue(),
                  time: event.entryTime,
                  uploadToServer: (event.createOplog ?? false),
                ),
                AttendanceLogModel(
                  individualId: e.individualId,
                  registerId: e.registerId,
                  tenantId: e.tenantId,
                  type: EnumValues.exit.toValue(),
                  status: e.status == 0
                      ? EnumValues.inactive.toValue()
                      : EnumValues.active.toValue(),
                  time: e.status == 0
                      ? event.entryTime
                      : e.status == 0.5
                          ? halfDay
                          : event.exitTime,
                  uploadToServer: (event.createOplog ?? false),
                )
              ]);
            }
          });
          AttendanceSingleton().submitAttendanceDetails(
            SubmitAttendanceDetails(
                attendeeList: value.attendanceCollectionModel ?? [],
                attendanceLogs: list,
                onMarked: (val) => false,
                createOplog: event.createOplog),
          );
        }
        emit(value.copyWith(
          attendanceSearchModelList: value.attendanceSearchModelList,
          attendanceCollectionModel: value.attendanceCollectionModel,
        ));
      },
      orElse: () {},
    );
  }

  FutureOr<void> _onSearchAttendeeByName(
    SearchAttendeesEvent event,
    AttendanceIndividualEmitter emit,
  ) {
    state.maybeMap(
      orElse: () {},
      loaded: (value) {
        if (event.name.isNotEmpty && event.name.trim().length >= 2) {
          final List<AttendeeModel> result = value.attendanceCollectionModel!
              .where((item) =>
                  item.name!.toLowerCase().contains(event.name.toLowerCase()))
              .toList();

          emit(value.copyWith(attendanceSearchModelList: result));
        } else {
          emit(value.copyWith(attendanceSearchModelList: null));
        }
      },
    );
  }

  checkResponse(
      List<AttendanceLogModel> logResponse,
      List<AttendeeModel> attendees,
      AttendanceIndividualLogSearchEvent event) async {
    bool uploadToServer = false;
    bool anyLogPresent = false;
    final currentDate = DateTime.fromMillisecondsSinceEpoch(event.currentDate);
    int twelvePM =
        DateTime(currentDate.year, currentDate.month, currentDate.day, 11, 58)
            .millisecondsSinceEpoch;
    attendees = event.attendees.map((e) {
      final entryLogList = logResponse
          .where((l) =>
              l.individualId == e.individualId &&
              l.type == EnumValues.entry.toValue() &&
              l.time == event.entryTime)
          .toList();
      final exitLogList = logResponse
          .where((l) =>
              l.individualId == e.individualId &&
              l.type == EnumValues.exit.toValue() &&
              (l.time == event.exitTime ||
                  l.time == event.entryTime ||
                  l.time == twelvePM))
          .toList();
      uploadToServer =
          entryLogList.any((entry) => entry.uploadToServer == true);
      anyLogPresent = logResponse
          .where((l) =>
              (l.time == event.entryTime || l.time == event.exitTime) &&
              l.registerId == e.registerId)
          .toList()
          .any((log) => log.uploadToServer == true);

      return e.copyWith(
          status: ((entryLogList.isEmpty || exitLogList.isEmpty) &&
                  anyLogPresent != true)
              ? -1
              : (entryLogList.isNotEmpty &&
                          exitLogList.isNotEmpty &&
                          entryLogList.last.time == exitLogList.last.time) ||
                      ((entryLogList.isEmpty || exitLogList.isEmpty) &&
                          anyLogPresent == true)
                  ? 0
                  : (entryLogList.isNotEmpty &&
                          exitLogList.isNotEmpty &&
                          event.isSingleSession == true &&
                          exitLogList.last.time == twelvePM)
                      ? 0.5
                      : 1);
    }).toList();

    emit(AttendanceIndividualState.loaded(
        attendanceCollectionModel: attendees, viewOnly: anyLogPresent));
  }
}

@freezed
class AttendanceIndividualEvent with _$AttendanceIndividualEvent {
  const factory AttendanceIndividualEvent.individualAttendanceLogSearch({
    required String registerId,
    required String tenantId,
    required int entryTime,
    required int exitTime,
    required int currentDate,
    required List<AttendeeModel> attendees,
    required int offset,
    required int limit,
    @Default(false) bool isSingleSession,
  }) = AttendanceIndividualLogSearchEvent;
  const factory AttendanceIndividualEvent.individualAttendanceMark({
    @Default(0) int entryTime,
    @Default(0) int exitTime,
    @Default(-1) status,
    @Default(false) bool isSingleSession,
    required String individualId,
    required String registerId,
    // required int eventStartDate,
    // required int eventEndDate,
  }) = AttendanceMarkEvent;
  const factory AttendanceIndividualEvent.saveAsDraft({
    required int entryTime,
    required int exitTime,
    required DateTime selectedDate,
    @Default(false) bool isSingleSession,
    @Default(false) bool? createOplog,
  }) = SaveAsDraftEvent;
  //
  // const factory AttendanceIndividualEvent.uploadAttendance({
  //   required int entryTime,
  //   required int exitTime,
  //   required int status,
  //   required String tenantId,
  //   required String registarId,
  //   required String projectId,
  // }) = UploadAttendanceEvent;
  //
  const factory AttendanceIndividualEvent.searchAttendees({
    required String name,
  }) = SearchAttendeesEvent;
  //
  // const factory AttendanceIndividualEvent.dispose() =
  //     DisposeAttendanceIndividualEvent;
}

@freezed
class AttendanceIndividualState with _$AttendanceIndividualState {
  const AttendanceIndividualState._();

  const factory AttendanceIndividualState.initial() = _Initial;
  const factory AttendanceIndividualState.loading() = _Loading;
  factory AttendanceIndividualState.loaded({
    List<AttendeeModel>? attendanceSearchModelList,
    List<AttendeeModel>? attendanceCollectionModel,
    @Default(0) int offsetData,
    @Default(0) int currentOffset,
    @Default(0) int countData,
    @Default(10) int limitData,
    @Default(false) bool viewOnly,
  }) = _AttendanceRowModelLoaded;
  const factory AttendanceIndividualState.error(String? error) = _Error;
}
