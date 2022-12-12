import 'dart:async';

import 'package:health_campaigns_flutter/models/data_model.dart';

abstract class OpLogManager<T extends DataModel> {
  FutureOr<int> createEntry(OpLogEntry<T> entry);

  FutureOr<List<OpLogEntry<T>>> getPendingSyncedEntries();
}
