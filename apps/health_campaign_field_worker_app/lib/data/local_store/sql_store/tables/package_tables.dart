import 'package:attendance_management/attendance_management.dart' as att;
import 'package:inventory_management/data/local_store/sql_store/tables/facility.dart'
    as fac;
import 'package:inventory_management/data/local_store/sql_store/tables/stock.dart'
    as sto;
import 'package:inventory_management/data/local_store/sql_store/tables/stock_reconciliation.dart'
    as stk_rkn;
import 'package:referral_reconciliation/data/local_store/sql_store/tables/h_f_referral.dart'
    as hfRef;

class HFReferral extends hfRef.HFReferral {
  HFReferral() : super();
}

class Stock extends sto.Stock {
  Stock() : super();
}

class StockReconciliation extends stk_rkn.StockReconciliation {
  StockReconciliation() : super();
}

class Facility extends fac.Facility {
  Facility() : super();
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
