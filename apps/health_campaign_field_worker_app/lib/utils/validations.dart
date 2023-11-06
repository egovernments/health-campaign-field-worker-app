library validations;

Login login = const Login();
Common common = const Common();
Individual individual = const Individual();
Stocks stocks = const Stocks();
Checklist checklist = const Checklist();

class Login {
  const Login();
}

class Common {
  const Common();
}

class Individual {
  const Individual();

  int get nameMinLength => 3;
  int get nameMaxLength => 200;
}

class Stocks {
  const Stocks();

  int get minQuantity => 1;
  int get maxQuantity => 10000000;
  int get minLength => 2;
  int get maxLength => 128;
  int get maxNameLength => 200;
  int get maxWayBillNoLength => 200;
}

class Checklist {
  const Checklist();
}
