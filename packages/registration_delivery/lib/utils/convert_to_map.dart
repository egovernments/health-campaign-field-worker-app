import 'models/widget_config_model.dart';

class FieldConverter {
  final List<RegistrationDeliveryFormConfig>? widgetConfig;

  FieldConverter(this.widgetConfig);

  Map<String, dynamic>? convertWidgetConfigToJsonByName(
     String nameToFind) {
    if (widgetConfig == null || widgetConfig!.isEmpty) {
      return null; // Return null if the list is empty or null
    }

    // Find the config with the specified name
    final RegistrationDeliveryFormConfig? foundConfig =
    widgetConfig?.firstWhere((config) => nameToFind.toLowerCase().contains(config.name?.toLowerCase() as Pattern), orElse: () => RegistrationDeliveryFormConfig());

    // Convert to JSON if found
    return foundConfig?.toJson();
    }
}
