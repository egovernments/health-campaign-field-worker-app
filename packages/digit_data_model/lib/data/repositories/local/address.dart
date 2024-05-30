import 'dart:async';

import 'package:digit_data_model/data_model.dart';

class AddressLocalRepository
    extends LocalRepository<AddressModel, AddressSearchModel> {
  AddressLocalRepository(super.sql, super.opLogManager);

  @override
  FutureOr<List<AddressModel>> search(AddressSearchModel query) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  DataModelType get type => DataModelType.address;
}
