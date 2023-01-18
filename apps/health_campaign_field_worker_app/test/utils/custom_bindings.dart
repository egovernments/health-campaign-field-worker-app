import 'package:flutter_test/flutter_test.dart';

/// Use this class to override default setting for disabling network calls
class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}