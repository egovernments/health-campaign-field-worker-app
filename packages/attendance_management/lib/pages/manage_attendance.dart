import 'package:attendance_management/attendance_management.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/molecules/digit_table_card.dart';
import 'package:digit_components/widgets/powered_by_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/localized.dart';

class ManageAttendancePage extends LocalizedStatefulWidget {
  final AttendanceListeners attendanceListeners;
  const ManageAttendancePage({
    required this.attendanceListeners,
    super.key,
    super.appLocalizations,
  });

  @override
  State<ManageAttendancePage> createState() => _ManageAttendancePageState();
}

class _ManageAttendancePageState extends State<ManageAttendancePage> {
  List<Map<dynamic, dynamic>> projectList = [
    {
      'Campaign Type': 'LLIN Bangalore',
      'Event Type': 'Training',
      'Staff Count': 15,
      'Start Date': '10 Feb 2023',
      'End Date': '25 Feb 2023',
      'Status': 'Active',
      'Attendance Completion': '2/3 days'
    },
    {
      'Campaign Type': 'LLIN Mangalore',
      'Event Type': 'Training',
      'Staff Count': 20,
      'Start Date': '10 Feb 2023',
      'End Date': '25 Feb 2023',
      'Status': 'Active',
      'Attendance Completion': '0/3 days'
    }
  ];
  List<AttendancePackageRegisterModel> attendanceRegisters = [];

  bool empty = false;
  AttendanceBloc attendanceBloc = AttendanceBloc(const RegisterLoading());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    projectList.clear();
    // attendanceRegisters.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    //
    // if (projectList.isEmpty) {
    //   list = [];
    //   empty = true;
    // } else {
    //   for (int i = 0; i < projectList.length; i++) {
    //     list.add(RegisterCard(
    //       data: projectList[i] as Map<String, dynamic>,
    //       regisId: 'WR/2023-24/HCM-12345',
    //       tenatId: 'mz',
    //       show: true,
    //       startDate: DateTime.fromMillisecondsSinceEpoch(
    //         1704868822000,
    //       ),
    //       endDate: DateTime.fromMillisecondsSinceEpoch(
    //         1706164822000,
    //       ),
    //     ));
    //   }
    //
    //   empty = false;
    // }
    return BlocProvider<AttendanceBloc>(
      create: (context) => attendanceBloc
        ..add(AttendanceEvents.initial(widget.attendanceListeners)),
      child: BlocListener<AttendanceBloc, AttendanceStates>(
        listener: (ctx, states) {
          if (states is RegisterLoaded) {
            attendanceRegisters = states.registers;
            for (int i = 0; i < attendanceRegisters.length; i++) {
              list.add(RegisterCard(
                data: {
                  'Campaign Type': attendanceRegisters[i].name,
                  'Event Type': attendanceRegisters[i].serviceCode,
                  'Staff Count': 15,
                  'Start Date': '10 Feb 2023',
                  'End Date': '25 Feb 2023',
                  'Status': 'Active',
                  'Attendance Completion': '2/3 days'
                },
                regisId: attendanceRegisters[i].id,
                tenatId: attendanceRegisters[i].tenantId!,
                show: true,
                startDate: DateTime.fromMillisecondsSinceEpoch(
                  attendanceRegisters[i].startDateTime!,
                ),
                endDate: DateTime.fromMillisecondsSinceEpoch(
                  attendanceRegisters[i].endDateTime!,
                )
              ));
            }
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Manage Attendance ${projectList.length})",
                  style: DigitTheme.instance.mobileTheme.textTheme.headlineLarge
                      ?.apply(color: const DigitColors().black),
                  textAlign: TextAlign.left,
                ),
              ),
              empty
                  ? const Center(
                      child: Card(
                        child: SizedBox(
                          height: 60,
                          width: 200,
                          child: Center(child: Text("No Data Found")),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 16.0,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: PoweredByDigit(
                  version: '1.2.0',
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class RegisterCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final String tenatId;
  final String regisId;
  final bool show;
  final DateTime startDate;
  final DateTime endDate;

  const RegisterCard({
    super.key,
    required this.data,
    required this.tenatId,
    required this.regisId,
    this.show = false,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    DateTime s = DateTime.now();

    return DigitCard(
      child: Column(
        children: [
          DigitTableCard(
            element: data,
          ),
          show
              ? DigitElevatedButton(
                  child: Text(
                    ((s.isAfter(startDate) || s.isAtSameMomentAs(startDate)) &&
                            (s.isBefore(endDate) ||
                                s.isAtSameMomentAs(endDate)))
                        ? 'Mark Attendance'
                        : 'View Attendance',
                  ),
                  onPressed: () {},
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
