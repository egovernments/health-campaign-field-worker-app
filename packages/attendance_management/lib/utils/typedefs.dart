import 'package:digit_data_model/data/data_repository.dart';
import 'package:digit_data_model/models/entities/individual.dart';

import '../models/entities/attendance_log.dart';
import '../models/entities/attendance_register.dart';

typedef AttendanceDataRepository
    = DataRepository<AttendanceRegisterModel, AttendanceRegisterSearchModel>;
typedef AttendanceLogDataRepository
    = DataRepository<AttendanceLogModel, AttendanceLogSearchModel>;
typedef IndividualDataRepository
    = DataRepository<IndividualModel, IndividualSearchModel>;
