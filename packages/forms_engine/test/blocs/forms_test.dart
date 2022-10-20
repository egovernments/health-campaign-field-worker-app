import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forms_engine/forms_engine.dart';

import '../constants/schema.dart';

void main() {
  group('Form Bloc', () {
    blocTest(
      'throws exception when schema is empty',
      build: () => FormsBloc(schema),
      act: (bloc) => [
        bloc.add(const FormsLoadEvent()),
        bloc.add(const FormsUpdateEvent(SchemaObject(name: '', version: 1))),
        bloc.add(const FormsCreateMappingEvent()),
      ],
      expect: () => [
        isA<FormsState>().having(
          (s) => s.schema != null,
          'Form schema object will be parsed',
          true,
        ),
        isA<FormsState>().having(
          (s) => s.schema != null,
          'Form schema object will be parsed',
          true,
        ),
      ],
      errors: () => [isA<Exception>()],
    );
  });
}
