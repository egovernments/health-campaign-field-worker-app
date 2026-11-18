import 'package:flow_preview/src/config_loader.dart';
import 'package:flow_preview/src/messages_loader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('requests the same localisation modules as the app for a flow', () {
    const module = PreviewModule(
      name: 'CLOSEDHOUSEHOLD',
      initialPage: 'start',
      flows: [],
      project: 'LLIN-mz',
    );
    expect(
      guessModules(module, hierarchyType: 'NIGERIA'),
      'hcm-closehousehold-LLIN-mz,hcm-common,hcm-login,hcm-scanner,'
      'hcm-checklist,hcm-beneficiary,hcm-boundary-nigeria',
    );
  });

  test('registration adds hcm-beneficiary once', () {
    const module = PreviewModule(
        name: 'REGISTRATION', initialPage: 's', flows: [], project: 'P1');
    final modules = guessModules(module).split(',');
    expect(modules.first, 'hcm-registration-P1');
    expect(modules.where((m) => m == 'hcm-beneficiary').length, 1);
    expect(modules.last, 'hcm-boundary-admin');
  });

  test('parses a localisation search response', () {
    final messages = parseMessages(
        '{"messages":[{"code":"A","message":"Alpha","locale":"en_IN"},'
        '{"code":"B","message":"Beta","locale":""}]}');
    expect(messages.map((m) => m.code), ['A', 'B']);
    expect(messages.last.locale, 'en_IN');
  });
}
