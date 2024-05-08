import 'package:attendance_management/attendance_management.dart' as att;

import 'package:inventory_management/data/local_store/sql_store/tables/stock.dart'
    as sto;
import 'package:inventory_management/data/local_store/sql_store/tables/stock_reconciliation.dart'
    as stk_rkn;
import 'package:referral_reconciliation/data/local_store/sql_store/tables/h_f_referral.dart'
    as hfRef;

import 'package:registration_delivery/data/local_store/tables/target.dart'
    as tar;
import 'package:registration_delivery/data/local_store/tables/household.dart'
    as household;
import 'package:registration_delivery/data/local_store/tables/household_member.dart'
    as household_member;
import 'package:registration_delivery/data/local_store/tables/referral.dart'
    as ref;
import 'package:registration_delivery/data/local_store/tables/task.dart' as tas;
import 'package:registration_delivery/data/local_store/tables/side_effect.dart'
    as se;
import 'package:registration_delivery/data/local_store/tables/task_resource.dart'
    as tas_res;

class HFReferral extends hfRef.HFReferral {
  HFReferral() : super();
}

class Stock extends sto.Stock {
  Stock() : super();
}

class StockReconciliation extends stk_rkn.StockReconciliation {
  StockReconciliation() : super();
}

class Target extends tar.Target {
  Target() : super();
}

class Household extends household.Household {
  Household() : super();
}

class HouseholdMember extends household_member.HouseholdMember {
  HouseholdMember() : super();
}

class Referral extends ref.Referral {
  Referral() : super();
}

class Task extends tas.Task {
  Task() : super();
}

class SideEffect extends se.SideEffect {
  SideEffect() : super();
}

class TaskResource extends tas_res.TaskResource {
  TaskResource() : super();
}

class Attendance extends att.Attendance {
  Attendance() : super();
}

class AttendanceRegister extends att.AttendanceRegister {
  AttendanceRegister() : super();
}

class Attendee extends att.Attendee {
  Attendee() : super();
}

class Staff extends att.Staff {
  Staff() : super();
}
