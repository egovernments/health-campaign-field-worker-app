import '../navigation_service/navigation_service.dart';
import 'action_config.dart';

class ActionHandler {
  static void execute(ActionConfig action) {
    switch (action.actionType) {
      case 'NAVIGATION':
        NavigationRegistry.navigateTo(action.properties);
        break;
      case 'CREATE_EVENT':
        break;
      default:
        break;
    }
  }
}
