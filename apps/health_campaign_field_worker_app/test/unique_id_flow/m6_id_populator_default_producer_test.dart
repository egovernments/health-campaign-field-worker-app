// T6 - RC-11 (ruled out): the hidden idPopulator control is the single
// producer of the "<TYPE>, <id>" value. A null or empty UNIQUE_BENEFICIARY_ID
// navigation param yields "DEFAULT, <uuid>"; a pool ID yields
// "UNIQUE_BENEFICIARY_ID, <id>". The engine never turns a pool ID into DEFAULT.
import 'package:digit_forms_engine/helper/form_builder_helper.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  const parent = PropertySchema(type: PropertySchemaType.object);
  const hiddenPopulator = PropertySchema(
    type: PropertySchemaType.string,
    format: PropertySchemaFormat.idPopulator,
    hidden: true,
  );
  const defaults = {
    'availableIDs': {'DEFAULT': 'DEF-1'},
  };

  dynamic build({
    Map<String, dynamic>? navigationParams,
    Map<String, dynamic>? defaultValues = defaults,
    PropertySchema schema = hiddenPopulator,
  }) {
    final control = buildFormControl(
      'identifier',
      schema,
      parent,
      defaultValues: defaultValues,
      navigationParams: navigationParams,
    );
    expect(control, isA<FormControl<String>>());
    return control.value;
  }

  test('T6: nav param null -> DEFAULT, DEF-1', () {
    expect(build(navigationParams: {'UNIQUE_BENEFICIARY_ID': null}),
        'DEFAULT, DEF-1');
    expect(build(navigationParams: {}), 'DEFAULT, DEF-1');
    expect(build(navigationParams: null), 'DEFAULT, DEF-1');
  });

  test("T6: nav param '' -> DEFAULT, DEF-1 (empty string is not an ID)", () {
    expect(build(navigationParams: {'UNIQUE_BENEFICIARY_ID': ''}),
        'DEFAULT, DEF-1');
  });

  test('T6: nav param ID-1 -> UNIQUE_BENEFICIARY_ID, ID-1', () {
    expect(build(navigationParams: {'UNIQUE_BENEFICIARY_ID': 'ID-1'}),
        'UNIQUE_BENEFICIARY_ID, ID-1');
  });

  test('T6 (extra): an availableIDs UNIQUE key wins without a nav param', () {
    // Dead in production: ScreenBuilder only ever passes {'DEFAULT': uuid}.
    expect(
      build(
        navigationParams: {},
        defaultValues: {
          'availableIDs': {'DEFAULT': 'DEF-1', 'UNIQUE_BENEFICIARY_ID': 'POOL-9'}
        },
      ),
      'UNIQUE_BENEFICIARY_ID, POOL-9',
    );
  });

  test('T6 (extra): null defaults bake "DEFAULT, null"', () {
    expect(build(navigationParams: {}, defaultValues: null), 'DEFAULT, null');
  });

  test('T6 (extra): a non-String nav value throws', () {
    expect(
      () => build(navigationParams: {'UNIQUE_BENEFICIARY_ID': 42}),
      throwsA(isA<TypeError>()),
    );
  });

  test('T6 (extra): an existing UNIQUE default is kept in edit mode', () {
    expect(
      build(
        navigationParams: {'UNIQUE_BENEFICIARY_ID': 'ID-NEW'},
        defaultValues: {
          ...defaults,
          'identifier': 'UNIQUE_BENEFICIARY_ID, ID-OLD',
        },
      ),
      'UNIQUE_BENEFICIARY_ID, ID-OLD',
    );
    // An existing DEFAULT value is kept only when no nav param is given.
    expect(
      build(
        navigationParams: {},
        defaultValues: {...defaults, 'identifier': 'DEFAULT, OLD-UUID'},
      ),
      'DEFAULT, OLD-UUID',
    );
    expect(
      build(
        navigationParams: {'UNIQUE_BENEFICIARY_ID': 'ID-NEW'},
        defaultValues: {...defaults, 'identifier': 'DEFAULT, OLD-UUID'},
      ),
      'UNIQUE_BENEFICIARY_ID, ID-NEW',
    );
  });

  test('T6 (extra): hidden: false gives null', () {
    const visible = PropertySchema(
      type: PropertySchemaType.string,
      format: PropertySchemaFormat.idPopulator,
      hidden: false,
    );
    expect(
      build(
        navigationParams: {'UNIQUE_BENEFICIARY_ID': 'ID-1'},
        schema: visible,
      ),
      isNull,
    );
  });
}
