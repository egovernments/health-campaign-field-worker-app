import 'dart:async';

import '../../../models/data_model.dart';

abstract class OpLogManager<T extends DataModel> {
  FutureOr<int> createEntry(OpLogEntry<T> entry);

  FutureOr<List<OpLogEntry<T>>> getPendingSyncedEntries();
}
