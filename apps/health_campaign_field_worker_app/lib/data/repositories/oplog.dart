import 'package:digit_data_model/data_model.dart';

import '../../models/downsync/downsync.dart';

class DownsyncOpLogManager extends OpLogManager<DownsyncModel> {
  DownsyncOpLogManager(super.isar);

  @override
  DownsyncModel applyServerGeneratedIdToEntity(
    DownsyncModel entity,
    String serverGeneratedId,
    int rowVersion,
  ) =>
      throw UnimplementedError();

  @override
  String getClientReferenceId(DownsyncModel entity) =>
      throw UnimplementedError();

  @override
  String? getServerGeneratedId(DownsyncModel entity) =>
      throw UnimplementedError();

  @override
  int? getRowVersion(DownsyncModel entity) => throw UnimplementedError();

  @override
  bool? getNonRecoverableError(DownsyncModel entity) =>
      throw UnimplementedError();
}
