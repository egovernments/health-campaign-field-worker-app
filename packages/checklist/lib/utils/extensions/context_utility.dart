part of 'extensions.dart';

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
  }

  // Provides Checklist repository based on the persistence configuration
  DataRepository<D, R>
  repository<D extends EntityModel, R extends EntitySearchModel>(
      BuildContext context,
      ) {
    switch (ChecklistSingleton().persistenceConfiguration) {
      case PersistenceConfiguration.offlineFirst:
        return context.read<LocalRepository<D, R>>();
      case PersistenceConfiguration.onlineOnly:
        return context.read<RemoteRepository<D, R>>();
      default:
        return context.read<LocalRepository<D, R>>();
    }
  }
}
