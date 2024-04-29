part of 'extensions.dart';

enum PersistenceConfiguration { offlineFirst, onlineOnly }

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
  }

  Future<String> get packageInfo async {
    final info = await PackageInfo.fromPlatform();

    return info.version;
  }

  Cycle get selectedCycle {
    final selectedCycle = RegistrationDeliverySingleton()
        .projectType
        ?.cycles
        ?.where(
          (e) =>
              (e.startDate!) < DateTime.now().millisecondsSinceEpoch &&
              (e.endDate!) > DateTime.now().millisecondsSinceEpoch,
          // Return null when no matching cycle is found
        )
        .firstOrNull;

    if (selectedCycle == null) {
      return const Cycle();
    }

    return selectedCycle;
  }

  DataRepository<D, R>
      repository<D extends EntityModel, R extends EntitySearchModel>(
    BuildContext context,
  ) {
    switch (RegistrationDeliverySingleton().persistenceConfiguration) {
      case PersistenceConfiguration.offlineFirst:
        return context.read<LocalRepository<D, R>>();
      case PersistenceConfiguration.onlineOnly:
        return context.read<RemoteRepository<D, R>>();
      default:
        return context.read<RemoteRepository<D, R>>();
    }
  }
}
