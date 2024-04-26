part of 'extensions.dart';

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
}
