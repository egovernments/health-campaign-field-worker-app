import 'dart:async';

import 'package:attendance_management/attendance_management.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/typedefs.dart';

// Part of the code generated by Freezed for immutable classes
part 'attendance_bloc.freezed.dart';

// Type definition for emitter used in the AttendanceBloc
typedef AttendanceSearchEmitter = Emitter<AttendanceStates>;

/*
  @author  Ramkrishna-egov
  */
// AttendanceBloc responsible for managing attendance-related state
class AttendanceBloc extends Bloc<AttendanceEvents, AttendanceStates> {
  final AttendanceDataRepository? attendanceDataRepository;
  final AttendanceLogDataRepository? attendanceLogDataRepository;
  final IndividualDataRepository? individualDataRepository;
  // Constructor initializing the initial state and setting up event handlers
  AttendanceBloc(
    super.initialState, {
    required this.attendanceDataRepository,
    required this.attendanceLogDataRepository,
    required this.individualDataRepository,
  }) {
    on(_onInitial);
    on(_onLoadAttendanceRegisterData);
    on(_onLoadSelectedRegisterData);
    on(_onLoadMoreAttendanceRegisters);
  }

  // Event handler for InitialAttendance event
  void _onInitial(
    InitialAttendance event,
    Emitter<AttendanceStates> emit,
  ) async {
    emit(const RegisterLoading());
    // Getting attendance registers using a singleton instance
    final registers = await fetchRegisters(offSet: 0, limit: 10);
    add(AttendanceEvents.loadAttendanceRegisters(
        registers: registers!, limit: 10, offset: 0));
  }

  // Event handler for LoadAttendanceRegisterData event
  void _onLoadAttendanceRegisterData(
    LoadAttendanceRegisterData event,
    Emitter<AttendanceStates> emit,
  ) async {
    // Get the current state
    final currentState = state;

    // Check if the current state is RegisterLoaded
    if (currentState is RegisterLoaded) {
      // Append the new registers to the existing ones
      final updatedRegisters = currentState.registers + event.registers;

      // Emit the new state with the updated registers
      emit(RegisterLoaded(
        registers: updatedRegisters,
        limit: currentState.limit,
        offset: currentState.offset + event.limit,
      ));
    } else {
      // Emit the new state with the loaded registers
      emit(RegisterLoaded(
        registers: event.registers,
        limit: event.limit,
        offset: event.offset + event.limit,
      ));
    }
  }

  // Event handler for LoadSelectedAttendanceRegisterData event
  void _onLoadSelectedRegisterData(
    LoadSelectedAttendanceRegisterData event,
    Emitter<AttendanceStates> emit,
  ) async {
    emit(const RegisterLoading());
    // Finding and emitting the selected register based on ID
    final selectedRegister =
        event.registers.where((e) => e.id == event.registerID).first;
    emit(SelectedRegisterLoaded(
      selectedRegister: selectedRegister,
    ));
  }

  FutureOr<void> _onLoadMoreAttendanceRegisters(
      LoadMoreAttendanceRegisterData event,
      Emitter<AttendanceStates> emit) async {
    // Getting more attendance registers using a singleton instance
    final registers =
        await fetchRegisters(limit: event.limit!, offSet: event.offset!);

    // Get the current state
    final currentState = state;

    // Check if the current state is RegisterLoaded
    if (currentState is RegisterLoaded) {
      // Append the new registers to the existing ones
      final updatedRegisters = currentState.registers + registers!;

      // Emit the new state with the updated registers
      emit(currentState.copyWith(
          registers: updatedRegisters,
          offset: event.offset! + event.limit!,
          limit: event.limit!));
    }
  }

  // Method to fetch attendance registers
  fetchRegisters({required int offSet, required int limit}) async {
    final registers = await attendanceDataRepository?.search(
      AttendanceRegisterSearchModel(
        limit: limit,
        offSet: offSet,
        staffId: AttendanceSingleton().loggedInIndividualId,
        referenceId: AttendanceSingleton().projectId,
      ),
    );

    if (registers != null) {
      final List<AttendanceRegisterModel> attendanceRegisters =
          await Future.wait(registers.map((e) async {
        final registerCompletedLogs = await attendanceLogDataRepository?.search(
          AttendanceLogSearchModel(
            registerId: e.id,
            uploadToServer: true,
          ),
        );

        return _processAttendanceRegister(e, registerCompletedLogs);
      }));

      return attendanceRegisters;
    } else {
      return [];
    }
  }

  // Helper method to process attendance register and return the modified register
  Future<AttendanceRegisterModel> _processAttendanceRegister(
      AttendanceRegisterModel register,
      List<AttendanceLogModel>? registerCompletedLogs) async {
    // Generate date list
    var list = generateDateList(
      register.startDate!,
      register.endDate!,
      registerCompletedLogs ?? [],
      register.additionalDetails?["sessions"] != 2,
    );

    var completedDaysCount = register.additionalDetails?["sessions"] == 2
        ? list.length ~/ 2 // for registers with 2 sessions
        : list.length; // for registers with single session

    final individualList = await individualDataRepository?.search(
          IndividualSearchModel(
            id: register.attendees
                ?.where((att) => (att.denrollmentDate == null ||
                    (att.denrollmentDate ??
                            DateTime.now().millisecondsSinceEpoch) >=
                        DateTime.now().millisecondsSinceEpoch))
                .map((a) => a.individualId!)
                .toList(),
          ),
        ) ??
        [];

    // Map attendees
    final attendeeList = register.attendees
        ?.where((att) => (att.denrollmentDate == null ||
            (att.denrollmentDate ?? DateTime.now().millisecondsSinceEpoch) >=
                DateTime.now().millisecondsSinceEpoch))
        .map(
          (a) => a.copyWith(
            name: individualList
                .where((i) => i.id == a.individualId)
                .firstOrNull
                ?.name
                ?.givenName,
            individualNumber: individualList
                .where((i) => i.id == a.individualId)
                .firstOrNull
                ?.individualId,
          ),
        )
        .toList();

    return register.copyWith(
      attendees: attendeeList,
      attendanceLog: list,
      completedDays: completedDaysCount,
    );
  }

  // Method to generate date list
  List<Map<DateTime, bool>> generateDateList(
    int startMillis,
    int endMillis,
    List<AttendanceLogModel> completedLogs,
    bool isSingleSession,
  ) {
    List<Map<DateTime, bool>> dateList = [];

    // Convert milliseconds to DateTime objects
    DateTime startDate = DateTime.fromMillisecondsSinceEpoch(startMillis);
    DateTime endDate = DateTime.fromMillisecondsSinceEpoch(endMillis);

    // Calculate the number of days between start and end dates
    final daysDifference = endDate.difference(startDate).inDays;

    // Generate date list directly based on the number of days
    for (int i = 0; i <= daysDifference; i++) {
      DateTime currentDate = startDate.add(Duration(days: i));
      bool hasMorningLog = hasLogWithType(completedLogs, currentDate, "ENTRY");
      bool hasEveningLog = hasLogWithType(completedLogs, currentDate, "EXIT");
      dateList.add({
        currentDate:
            isSingleSession ? hasMorningLog : hasMorningLog && hasEveningLog,
      });
    }

    return dateList;
  }

  // Method to check if logs exist for a given date and type
  bool hasLogWithType(
    List<AttendanceLogModel> logs,
    DateTime date,
    String type,
  ) {
    final elementTime =
        DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

    final logTime = type == 'ENTRY'
        ? DateTime(
            elementTime.year,
            elementTime.month,
            elementTime.day,
            9,
          ).millisecondsSinceEpoch
        : DateTime(
            elementTime.year,
            elementTime.month,
            elementTime.day,
            18,
          ).millisecondsSinceEpoch;

    return logs
        .any((element) => element.time == logTime && element.type == type);
  }
}

// Freezed class for defining attendance-related events
@freezed
class AttendanceEvents with _$AttendanceEvents {
  const factory AttendanceEvents.initial() = InitialAttendance;
  const factory AttendanceEvents.loadAttendanceRegisters(
      {required List<AttendanceRegisterModel> registers,
      required int limit,
      required int offset}) = LoadAttendanceRegisterData;
  const factory AttendanceEvents.loadSelectedRegister(
      {required final List<AttendanceRegisterModel> registers,
      required final String registerID}) = LoadSelectedAttendanceRegisterData;
  const factory AttendanceEvents.loadMoreAttendanceRegisters(
      {int? limit, int? offset}) = LoadMoreAttendanceRegisterData;
}

// Freezed class for defining attendance-related states
@freezed
class AttendanceStates with _$AttendanceStates {
  const factory AttendanceStates.registerLoading() = RegisterLoading;
  const factory AttendanceStates.registerLoaded({
    required final List<AttendanceRegisterModel> registers,
    @Default(0) int offset,
    @Default(10) int limit,
  }) = RegisterLoaded;
  const factory AttendanceStates.selectedRegisterLoaded({
    final AttendanceRegisterModel? selectedRegister,
  }) = SelectedRegisterLoaded;

  const factory AttendanceStates.registerError(String message) = RegisterError;
}
