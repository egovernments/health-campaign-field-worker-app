import 'package:attendance_management/data/attendance.dart' as att;
import 'package:inventory_management/data/local_store/sql_store/tables/stock.dart'
    as sto;
import 'package:inventory_management/data/local_store/sql_store/tables/stock_reconciliation.dart'
    as sto;
import 'package:inventory_management/data/local_store/sql_store/tables/facility.dart'
    as fac;

class Stock extends sto.Stock {
  Stock() : super();
}

class StockReconciliation extends sto.StockReconciliation {
  StockReconciliation() : super();
}

class Facility extends fac.Facility {
  Facility() : super();
}

class Attendance extends att.Attendance {
  Attendance() : super();
}
