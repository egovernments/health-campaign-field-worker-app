import 'package:attendance_management/models/entities/attendance_log.dart';
import 'package:attendance_management/models/entities/attendance_register.dart';
import 'package:attendance_management/models/entities/attendee.dart';
import 'package:digit_data_model/data_model.dart';

class AttendanceTestConstants {
  static const String registerId = 'c2o33-02a2-4844-80ff-a080b7b40b70';
  static const String individualId = '1891de8-02a2-4844-80ff-a080b7b40b70';
  static const String tenantId = 'mz';

  static const String existingAttendeeName = 'John Doe';
  static const String partialAttendeeName = 'John';
  static const String nonExistAttendeeName = 'Hanna';



  static final List<AttendanceRegisterModel> registers = [
    AttendanceRegisterModel(
        id: 'c2o33-02a2-4844-80ff-a080b7b40b70',
        name: 'LLN-COVID-19',
        startDate: DateTime(2024, 5, 25).millisecondsSinceEpoch,
        endDate: DateTime(2024, 5, 26).millisecondsSinceEpoch,
        completedDays: 2,
        attendanceLog: [
          {
            DateTime(2024, 5, 25): false,
          },
          {
            DateTime(2024, 5, 26): false,
          }
        ]),
    AttendanceRegisterModel(
        id: 'c2o33-02a2-4844-80ff-a080b7b40b71',
        name: 'LLN-COVID-20',
        startDate: DateTime(2024, 5, 25).millisecondsSinceEpoch,
        endDate: DateTime(2024, 5, 26).millisecondsSinceEpoch,
        completedDays: 2,
        attendanceLog: [
          {
            DateTime(2024, 5, 25): false,
          },
          {
            DateTime(2024, 5, 26): false,
          }
        ]),
  ];

  static final List<IndividualModel> individuals = [
    IndividualModel(
      id: '1891de8-02a2-4844-80ff-c1280b7b40b70',
      clientReferenceId: '1891de8-02a2-4844-80ff-123b7b40b70',
    ),
    IndividualModel(
      id: '1891de8-02a2-4844-80ff-c1280b7b40b71',
      clientReferenceId: '1891de8-02a2-4844-80ff-123b7b40b71',
    ),
  ];

  static final List<AttendanceLogModel> attendanceLogs = [
    AttendanceLogModel(
      id: '1891de8-02a2-4844-80ff-a080b7b40b70',
      registerId: '1891de8-02a2-4844-80ff-a080b7b40b70',
      individualId: '1891de8-02a2-4844-80ff-a080b7b40b70',
    ),
    AttendanceLogModel(
      id: '1891de8-02a2-4844-80ff-a080b7b40b71',
      registerId: '1891de8-02a2-4844-80ff-a080b7b40b71',
      individualId: '1891de8-02a2-4844-80ff-a080b7b40b71',
    ),
  ];

  static final List<AttendeeModel> attendees = [
    AttendeeModel(
      id: '1891de8-02a2-4844-80ff-a080b7b40b70',
      individualId: '1891de8-02a2-4844-80ff-a080b7b40b70',
      name: 'John Doe',
    ),
    AttendeeModel(
      id: '1891de8-02a2-4844-80ff-a080b7b40b71',
      individualId: '1891de8-02a2-4844-80ff-a080b7b40b71',
      name: 'Ram Singh',
    ),
  ];
}
