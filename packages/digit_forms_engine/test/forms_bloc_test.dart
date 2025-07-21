import 'package:bloc_test/bloc_test.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/schema_object/schema_object.dart';
import 'package:flutter_test/flutter_test.dart';

import 'constants/schema.dart';

void main() {
  group('FormsBloc', () {
    late FormsBloc formsBloc;

    setUp(() {
      formsBloc = FormsBloc();
    });

    tearDown(() {
      formsBloc.close();
    });

    group('load', () {
      blocTest<FormsBloc, FormsState>(
        'emits loaded state when schema is loaded',
        build: () => formsBloc,
        act: (bloc) => bloc.add(FormsEvent.load(schemas: [schema])),
        expect: () => [
          isA<FormsState>().having(
            (state) => state.cachedSchemas.keys,
            'cachedSchemas keys',
            contains('registration'),
          ),
        ],
      );

      blocTest<FormsBloc, FormsState>(
        'sorts pages by order',
        build: () => formsBloc,
        act: (bloc) => bloc.add(FormsEvent.load(schemas: [schema])),
        expect: () => [
          isA<FormsState>().having(
            (state) => state.cachedSchemas['registration']?.pages.keys.toList(),
            'sorted pages',
            ['dummy'],
          ),
        ],
      );
    });

    group('updateField', () {
      const testSchema = '''
      {
        "name": "test",
        "version": 1,
        "pages": {
          "page1": {
            "type": "object",
            "properties": {
              "field1": {
                "type": "string",
                "label": "Field 1"
              }
            }
          }
        }
      }
      ''';

      blocTest<FormsBloc, FormsState>(
        'updates field value',
        build: () => formsBloc,
        seed: () => FormsState(
          cachedSchemas: {
            'test': SchemaObject.fromJson({
              'name': 'test',
              'version': 1,
              'pages': {
                'page1': {
                  'type': 'object',
                  'properties': {
                    'field1': {
                      'type': 'string',
                      'label': 'Field 1',
                    }
                  }
                }
              }
            }),
          },
        ),
        act: (bloc) => bloc.add(
          FormsEvent.updateField(
            schemaKey: 'test',
            key: 'field1',
            value: 'new value',
          ),
        ),
        expect: () => [
          isA<FormsState>().having(
            (state) => state.cachedSchemas['test']?.pages['page1']
                ?.properties?['field1']?.value,
            'field value',
            'new value',
          ),
        ],
      );
    });

    group('clearField', () {
      blocTest<FormsBloc, FormsState>(
        'clears field value',
        build: () => formsBloc,
        seed: () => FormsState(
          cachedSchemas: {
            'test': SchemaObject.fromJson({
              'name': 'test',
              'version': 1,
              'pages': {
                'page1': {
                  'type': 'object',
                  'properties': {
                    'field1': {
                      'type': 'string',
                      'label': 'Field 1',
                      'value': 'existing value',
                    }
                  }
                }
              }
            }),
          },
        ),
        act: (bloc) => bloc.add(
          FormsEvent.clearField(
            schemaKey: 'test',
            key: 'field1',
          ),
        ),
        expect: () => [
          isA<FormsState>().having(
            (state) => state.cachedSchemas['test']?.pages['page1']
                ?.properties?['field1']?.value,
            'field value',
            null,
          ),
        ],
      );
    });

    group('clearPage', () {
      blocTest<FormsBloc, FormsState>(
        'clears all fields in a page',
        build: () => formsBloc,
        seed: () => FormsState(
          cachedSchemas: {
            'test': SchemaObject.fromJson({
              'name': 'test',
              'version': 1,
              'pages': {
                'page1': {
                  'type': 'object',
                  'properties': {
                    'field1': {
                      'type': 'string',
                      'label': 'Field 1',
                      'value': 'value1',
                    },
                    'field2': {
                      'type': 'string',
                      'label': 'Field 2',
                      'value': 'value2',
                    }
                  }
                }
              }
            }),
          },
        ),
        act: (bloc) => bloc.add(
          FormsEvent.clearPage(
            schemaKey: 'test',
            pageKey: 'page1',
          ),
        ),
        expect: () => [
          isA<FormsState>().having(
            (state) => state
                .cachedSchemas['test']?.pages['page1']?.properties?.values
                .every((p) => p.value == null),
            'all fields cleared',
            true,
          ),
        ],
      );
    });

    group('clearForm', () {
      blocTest<FormsBloc, FormsState>(
        'resets form to initial state',
        build: () => formsBloc,
        seed: () => FormsState(
          cachedSchemas: {
            'test': SchemaObject.fromJson({
              'name': 'test',
              'version': 1,
              'pages': {
                'page1': {
                  'type': 'object',
                  'properties': {
                    'field1': {
                      'type': 'string',
                      'label': 'Field 1',
                      'value': 'modified value',
                    }
                  }
                }
              }
            }),
          },
          initialSchemas: {
            'test': SchemaObject.fromJson({
              'name': 'test',
              'version': 1,
              'pages': {
                'page1': {
                  'type': 'object',
                  'properties': {
                    'field1': {
                      'type': 'string',
                      'label': 'Field 1',
                      'value': 'initial value',
                    }
                  }
                }
              }
            }),
          },
        ),
        act: (bloc) => bloc.add(
          FormsEvent.clearForm(schemaKey: 'test'),
        ),
        expect: () => [
          isA<FormsState>().having(
            (state) => state.cachedSchemas['test']?.pages['page1']
                ?.properties?['field1']?.value,
            'field value reset',
            'initial value',
          ),
        ],
      );
    });

    group('submit', () {
      blocTest<FormsBloc, FormsState>(
        'emits submitted state with form data',
        build: () => formsBloc,
        seed: () => FormsState(
          cachedSchemas: {
            'test': SchemaObject.fromJson({
              'name': 'test',
              'version': 1,
              'pages': {
                'page1': {
                  'type': 'object',
                  'properties': {
                    'field1': {
                      'type': 'string',
                      'label': 'Field 1',
                      'value': 'value1',
                    },
                    'field2': {
                      'type': 'string',
                      'label': 'Field 2',
                      'value': 'value2',
                    }
                  }
                }
              }
            }),
          },
        ),
        act: (bloc) => bloc.add(
          FormsEvent.submit(schemaKey: 'test'),
        ),
        expect: () => [
          isA<FormsSubmittedState>().having(
            (state) => state.formData,
            'form data',
            {
              'page1': {
                'field1': 'value1',
                'field2': 'value2',
              }
            },
          ),
        ],
      );

      blocTest<FormsBloc, FormsState>(
        'filters out empty string values',
        build: () => formsBloc,
        seed: () => FormsState(
          cachedSchemas: {
            'test': SchemaObject.fromJson({
              'name': 'test',
              'version': 1,
              'pages': {
                'page1': {
                  'type': 'object',
                  'properties': {
                    'field1': {
                      'type': 'string',
                      'label': 'Field 1',
                      'value': 'value1',
                    },
                    'field2': {
                      'type': 'string',
                      'label': 'Field 2',
                      'value': '',
                    },
                    'field3': {
                      'type': 'string',
                      'label': 'Field 3',
                      'value': '   ',
                    }
                  }
                }
              }
            }),
          },
        ),
        act: (bloc) => bloc.add(
          FormsEvent.submit(schemaKey: 'test'),
        ),
        expect: () => [
          isA<FormsSubmittedState>().having(
            (state) => state.formData,
            'form data',
            {
              'page1': {
                'field1': 'value1',
                'field2': null,
                'field3': null,
              }
            },
          ),
        ],
      );

      blocTest<FormsBloc, FormsState>(
        'filters out hidden fields unless includeInForm is true',
        build: () => formsBloc,
        seed: () => FormsState(
          cachedSchemas: {
            'test': SchemaObject.fromJson({
              'name': 'test',
              'version': 1,
              'pages': {
                'page1': {
                  'type': 'object',
                  'properties': {
                    'visibleField': {
                      'type': 'string',
                      'label': 'Visible Field',
                      'value': 'visible value',
                    },
                    'hiddenField': {
                      'type': 'string',
                      'label': 'Hidden Field',
                      'value': 'hidden value',
                      'hidden': true,
                    },
                    'includedHiddenField': {
                      'type': 'string',
                      'label': 'Included Hidden Field',
                      'value': 'included value',
                      'hidden': true,
                      'includeInForm': true,
                    }
                  }
                }
              }
            }),
          },
        ),
        act: (bloc) => bloc.add(
          FormsEvent.submit(schemaKey: 'test'),
        ),
        expect: () => [
          isA<FormsSubmittedState>().having(
            (state) => state.formData,
            'form data',
            {
              'page1': {
                'visibleField': 'visible value',
                'includedHiddenField': 'included value',
              }
            },
          ),
        ],
      );
    });
  });
}
