import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/sampleJsonConfigs/polio_household_strategy.dart';
import 'package:health_campaign_field_worker_app/utils/mdms_enum_utils.dart';

/// Tests for filling a field's `enums` from one or more MDMS masters named
/// in its `schemaCode` (utils/mdms_enum_utils.dart), used by
/// ProjectBloc.enrichFormSchemasWithEnumsForForms.
void main() {
  const gvl = 'common-masters.GroupVaccinationLocations';
  const clf = 'common-masters.GroupVaccinationLocationsCLF';
  const gender = 'common-masters.GenderType';
  const both = '$gvl,$clf';

  Map<String, dynamic> rec(String code, [String? name]) =>
      {'code': code, if (name != null) 'name': name, 'active': true};

  List<String?> codesOf(List<Map<String, dynamic>>? enums) =>
      enums?.map((e) => e['code'] as String?).toList() ?? const [];

  // ------------------------------------------------------------------------
  group('splitSchemaCodes', () {
    test('single master', () {
      expect(splitSchemaCodes(gvl), [gvl]);
    });

    test('two masters, in the given order', () {
      expect(splitSchemaCodes(both), [gvl, clf]);
      expect(splitSchemaCodes('$clf,$gvl'), [clf, gvl]);
    });

    test('three or more masters', () {
      expect(splitSchemaCodes('$gvl,$clf,$gender'), [gvl, clf, gender]);
    });

    test('spaces around names and commas are ignored', () {
      expect(splitSchemaCodes('  $gvl ,   $clf  '), [gvl, clf]);
      expect(splitSchemaCodes(' $gvl '), [gvl]);
    });

    test('repeated master is listed once', () {
      expect(splitSchemaCodes('$gvl,$gvl'), [gvl]);
      expect(splitSchemaCodes('$gvl,$clf,$gvl'), [gvl, clf]);
      expect(splitSchemaCodes('$gvl, $gvl '), [gvl]);
    });

    test('empty parts are skipped (double, leading, trailing commas)', () {
      expect(splitSchemaCodes('$gvl,,$clf'), [gvl, clf]);
      expect(splitSchemaCodes(',$gvl'), [gvl]);
      expect(splitSchemaCodes('$gvl,'), [gvl]);
      expect(splitSchemaCodes(' , , '), isEmpty);
      expect(splitSchemaCodes(','), isEmpty);
    });

    test('parts that are not module.master are skipped', () {
      expect(splitSchemaCodes('GroupVaccinationLocations'), isEmpty);
      expect(splitSchemaCodes('a.b.c'), isEmpty);
      expect(splitSchemaCodes('.master'), isEmpty);
      expect(splitSchemaCodes('module.'), isEmpty);
      expect(splitSchemaCodes('.'), isEmpty);
      expect(splitSchemaCodes('module. '), isEmpty);
      expect(splitSchemaCodes('bad,$gvl,a.b.c'), [gvl]);
    });

    test('empty, blank, null and non-string values give nothing', () {
      expect(splitSchemaCodes(''), isEmpty);
      expect(splitSchemaCodes('   '), isEmpty);
      expect(splitSchemaCodes(null), isEmpty);
      expect(splitSchemaCodes(42), isEmpty);
      expect(splitSchemaCodes([gvl]), isEmpty);
      expect(splitSchemaCodes({'code': gvl}), isEmpty);
    });

    test('names are kept exactly (case is not changed)', () {
      expect(splitSchemaCodes('Common-Masters.groupvaccinationlocations'),
          ['Common-Masters.groupvaccinationlocations']);
    });

    test('populator-style codes used elsewhere still pass', () {
      expect(splitSchemaCodes('HCM.ID_TYPE_OPTIONS_POPULATOR'),
          ['HCM.ID_TYPE_OPTIONS_POPULATOR']);
      expect(splitSchemaCodes('HCM-ADMIN-CONSOLE.FormConfigTemplate'),
          ['HCM-ADMIN-CONSOLE.FormConfigTemplate']);
    });
  });

  // ------------------------------------------------------------------------
  group('collectSchemaCodes', () {
    Set<String> collect(dynamic node) {
      final out = <String>{};
      collectSchemaCodes(node, out);
      return out;
    }

    test('collects both masters of a comma-separated schemaCode', () {
      expect(collect({'schemaCode': both}), {gvl, clf});
    });

    test('collects from nested maps and lists', () {
      final config = {
        'flows': [
          {
            'pages': [
              {
                'properties': [
                  {'fieldName': 'gender', 'schemaCode': gender},
                  {'fieldName': 'location', 'schemaCode': both},
                ]
              }
            ]
          }
        ]
      };
      expect(collect(config), {gender, gvl, clf});
    });

    test('a master used by several fields is collected once', () {
      final config = [
        {'schemaCode': gvl},
        {'schemaCode': both},
        {'schemaCode': ' $gvl '},
      ];
      final out = collect(config);
      expect(out, {gvl, clf});
      expect(out.length, 2);
    });

    test('ignores empty, null, invalid and non-string schemaCodes', () {
      final config = [
        {'schemaCode': ''},
        {'schemaCode': null},
        {'schemaCode': 'nodot'},
        {'schemaCode': 'a.b.c'},
        {'schemaCode': 7},
        {'other': 'value'},
      ];
      expect(collect(config), isEmpty);
    });

    test('adds to an existing set', () {
      final out = <String>{gender};
      collectSchemaCodes({'schemaCode': both}, out);
      expect(out, {gender, gvl, clf});
    });

    test('scalars, null and empty structures add nothing', () {
      expect(collect(null), isEmpty);
      expect(collect('text'), isEmpty);
      expect(collect(3), isEmpty);
      expect(collect(<String, dynamic>{}), isEmpty);
      expect(collect(<dynamic>[]), isEmpty);
    });

    test('a schemaCode key holding a list is not read as masters', () {
      // Only string values are schemaCodes; a list under that key is just
      // walked like any other value.
      expect(
          collect({
            'schemaCode': [
              {'schemaCode': gvl}
            ]
          }),
          {gvl});
    });
  });

  // ------------------------------------------------------------------------
  group('mergeEnumsForSchemaCode: one master (unchanged behaviour)', () {
    test('maps every record to code and name', () {
      final enums = mergeEnumsForSchemaCode(gvl, {
        gvl: [rec('SCHOOL', 'GV_ENUM_SCHOOL'), rec('OTHER', 'GV_ENUM_OTHER')],
      });
      expect(enums, [
        {'code': 'SCHOOL', 'name': 'GV_ENUM_SCHOOL'},
        {'code': 'OTHER', 'name': 'GV_ENUM_OTHER'},
      ]);
    });

    test('name falls back to code', () {
      final enums = mergeEnumsForSchemaCode(gvl, {
        gvl: [rec('SCHOOL')],
      });
      expect(enums, [
        {'code': 'SCHOOL', 'name': 'SCHOOL'}
      ]);
    });

    test('other record fields (active, description) are dropped', () {
      final enums = mergeEnumsForSchemaCode(gvl, {
        gvl: [
          {'code': 'A', 'name': 'N', 'active': false, 'description': 'x'}
        ],
      });
      expect(enums!.single.keys, {'code', 'name'});
    });

    test('keeps repeated codes within one master, as before', () {
      final enums = mergeEnumsForSchemaCode(gvl, {
        gvl: [rec('A', 'one'), rec('A', 'two')],
      });
      expect(enums, hasLength(2));
    });

    test('keeps record order', () {
      final enums = mergeEnumsForSchemaCode(gvl, {
        gvl: [rec('C'), rec('A'), rec('B')],
      });
      expect(codesOf(enums), ['C', 'A', 'B']);
    });

    test('same result for the same master with spaces around it', () {
      final data = {
        gvl: [rec('A', 'N')]
      };
      expect(mergeEnumsForSchemaCode(' $gvl ', data),
          mergeEnumsForSchemaCode(gvl, data));
    });

    test('returns null when the master has no records', () {
      expect(mergeEnumsForSchemaCode(gvl, {gvl: []}), isNull);
    });

    test('returns null when the master was not downloaded', () {
      expect(mergeEnumsForSchemaCode(gvl, {}), isNull);
    });

    test('inactive records are still listed (existing behaviour)', () {
      final enums = mergeEnumsForSchemaCode(gvl, {
        gvl: [
          {'code': 'OLD', 'name': 'N', 'active': false}
        ],
      });
      expect(codesOf(enums), ['OLD']);
    });
  });

  // ------------------------------------------------------------------------
  group('mergeEnumsForSchemaCode: two masters', () {
    test('first master then second master', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [rec('SCHOOL'), rec('MARKET')],
        clf: [rec('BUS_STATION'), rec('BORDER')],
      });
      expect(codesOf(enums), ['SCHOOL', 'MARKET', 'BUS_STATION', 'BORDER']);
    });

    test('order follows the schemaCode, not the data map', () {
      final data = {
        clf: [rec('C1')],
        gvl: [rec('G1')],
      };
      expect(codesOf(mergeEnumsForSchemaCode(both, data)), ['G1', 'C1']);
      expect(codesOf(mergeEnumsForSchemaCode('$clf,$gvl', data)), ['C1', 'G1']);
    });

    test('a code in both masters appears once, from the first master', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [rec('OTHER', 'GV_ENUM_OTHER'), rec('SCHOOL')],
        clf: [rec('OTHER', 'CLF_ENUM_OTHER'), rec('BUS_STATION')],
      });
      expect(codesOf(enums), ['OTHER', 'SCHOOL', 'BUS_STATION']);
      expect(enums!.first['name'], 'GV_ENUM_OTHER');
    });

    test('repeated codes inside one master are also dropped when merging', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [rec('A'), rec('A')],
        clf: [rec('B')],
      });
      expect(codesOf(enums), ['A', 'B']);
    });

    test('codes are compared exactly (case matters)', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [rec('Other')],
        clf: [rec('OTHER')],
      });
      expect(codesOf(enums), ['Other', 'OTHER']);
    });

    test('numeric and string codes with the same text count as the same code',
        () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [
          {'code': 1, 'name': 'one'}
        ],
        clf: [
          {'code': '1', 'name': 'uno'}
        ],
      });
      expect(enums, [
        {'code': 1, 'name': 'one'}
      ]);
    });

    test('only the first master has records', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [rec('A')],
        clf: [],
      });
      expect(codesOf(enums), ['A']);
    });

    test('only the second master has records', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [],
        clf: [rec('B')],
      });
      expect(codesOf(enums), ['B']);
    });

    test('second master missing from the downloaded data', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [rec('A')],
      });
      expect(codesOf(enums), ['A']);
    });

    test('both masters empty or missing returns null (fallback enums stay)',
        () {
      expect(mergeEnumsForSchemaCode(both, {gvl: [], clf: []}), isNull);
      expect(mergeEnumsForSchemaCode(both, {}), isNull);
    });

    test('identical masters give each code once', () {
      final records = [rec('A'), rec('B')];
      final enums = mergeEnumsForSchemaCode(both, {gvl: records, clf: records});
      expect(codesOf(enums), ['A', 'B']);
    });

    test('three masters merge in order with first-wins', () {
      final enums = mergeEnumsForSchemaCode('$gvl,$clf,$gender', {
        gvl: [rec('A')],
        clf: [rec('B'), rec('A')],
        gender: [rec('C'), rec('B')],
      });
      expect(codesOf(enums), ['A', 'B', 'C']);
    });

    test('the same master listed twice does not double its records', () {
      final enums = mergeEnumsForSchemaCode('$gvl,$gvl', {
        gvl: [rec('A'), rec('B')],
      });
      expect(codesOf(enums), ['A', 'B']);
    });

    test('invalid parts are ignored, valid ones still merge', () {
      final enums = mergeEnumsForSchemaCode('nodot,$gvl,,$clf,a.b.c', {
        gvl: [rec('A')],
        clf: [rec('B')],
      });
      expect(codesOf(enums), ['A', 'B']);
    });
  });

  // ------------------------------------------------------------------------
  group('mergeEnumsForSchemaCode: odd records', () {
    test('non-map records are skipped', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: ['SCHOOL', 42, null, rec('A')],
        clf: [
          ['nested'],
          rec('B')
        ],
      });
      expect(codesOf(enums), ['A', 'B']);
    });

    test('only non-map records gives null', () {
      expect(
          mergeEnumsForSchemaCode(gvl, {
            gvl: ['x', 1]
          }),
          isNull);
    });

    test('records without a code are kept and never treated as duplicates', () {
      final enums = mergeEnumsForSchemaCode(both, {
        gvl: [
          {'name': 'no code 1'}
        ],
        clf: [
          {'name': 'no code 2'}
        ],
      });
      expect(enums, [
        {'code': null, 'name': 'no code 1'},
        {'code': null, 'name': 'no code 2'},
      ]);
    });

    test('a null name falls back to the code', () {
      final enums = mergeEnumsForSchemaCode(gvl, {
        gvl: [
          {'code': 'A', 'name': null}
        ],
      });
      expect(enums!.single['name'], 'A');
    });

    test('maps with non-string keys are accepted', () {
      final enums = mergeEnumsForSchemaCode(gvl, {
        gvl: [
          <dynamic, dynamic>{'code': 'A', 'name': 'N', 1: 'x'}
        ],
      });
      expect(enums, [
        {'code': 'A', 'name': 'N'}
      ]);
    });

    test('invalid or empty schemaCode returns null', () {
      final data = {
        gvl: [rec('A')]
      };
      expect(mergeEnumsForSchemaCode('', data), isNull);
      expect(mergeEnumsForSchemaCode(null, data), isNull);
      expect(mergeEnumsForSchemaCode('nodot', data), isNull);
      expect(mergeEnumsForSchemaCode(5, data), isNull);
    });

    test('the downloaded record lists are not changed', () {
      final records = [rec('A', 'N'), rec('A', 'M')];
      final copy = jsonEncode(records);
      mergeEnumsForSchemaCode(both, {gvl: records, clf: records});
      expect(jsonEncode(records), copy);
    });
  });

  // ------------------------------------------------------------------------
  group('applyEnumsToSchemaCodes', () {
    test('replaces the enums of a two-master field with the merged list', () {
      final field = {
        'fieldName': 'vaccinationLocation',
        'schemaCode': both,
        'enums': [
          {'code': 'FALLBACK', 'name': 'F'}
        ],
      };
      applyEnumsToSchemaCodes(field, {
        gvl: [rec('A')],
        clf: [rec('B')],
      });
      expect(codesOf((field['enums'] as List).cast()), ['A', 'B']);
    });

    test('keeps the fallback enums when no master returned records', () {
      final fallback = [
        {'code': 'FALLBACK', 'name': 'F'}
      ];
      final field = {'schemaCode': both, 'enums': fallback};
      applyEnumsToSchemaCodes(field, {gvl: [], clf: []});
      expect(field['enums'], same(fallback));
    });

    test('adds enums to a field that had none', () {
      final field = <String, dynamic>{'schemaCode': both};
      applyEnumsToSchemaCodes(field, {
        gvl: [rec('A')]
      });
      expect(codesOf((field['enums'] as List).cast()), ['A']);
    });

    test('leaves a field without enums alone when nothing came back', () {
      final field = <String, dynamic>{'schemaCode': both};
      applyEnumsToSchemaCodes(field, {});
      expect(field.containsKey('enums'), isFalse);
    });

    test('single-master fields behave exactly as before', () {
      final field = {
        'schemaCode': gender,
        'enums': [
          {'code': 'X', 'name': 'X'}
        ],
      };
      applyEnumsToSchemaCodes(field, {
        gender: [rec('MALE', 'M'), rec('FEMALE')],
      });
      expect(field['enums'], [
        {'code': 'MALE', 'name': 'M'},
        {'code': 'FEMALE', 'name': 'FEMALE'},
      ]);
    });

    test('fields without schemaCode, or with an invalid one, are untouched',
        () {
      final plain = {
        'fieldName': 'name',
        'enums': [
          {'code': 'K', 'name': 'K'}
        ]
      };
      final invalid = {
        'schemaCode': 'nodot',
        'enums': [
          {'code': 'K', 'name': 'K'}
        ]
      };
      final before = jsonEncode([plain, invalid]);
      applyEnumsToSchemaCodes([
        plain,
        invalid
      ], {
        gvl: [rec('A')]
      });
      expect(jsonEncode([plain, invalid]), before);
    });

    test('walks nested maps and lists and fills every matching field', () {
      final config = {
        'flows': [
          {
            'pages': [
              {
                'properties': [
                  <String, dynamic>{
                    'fieldName': 'gender',
                    'schemaCode': gender
                  },
                  <String, dynamic>{
                    'fieldName': 'location',
                    'schemaCode': both
                  },
                  <String, dynamic>{'fieldName': 'plain'},
                ]
              }
            ]
          }
        ]
      };
      applyEnumsToSchemaCodes(config, {
        gender: [rec('MALE')],
        gvl: [rec('A')],
        clf: [rec('B'), rec('A')],
      });
      final props = ((config['flows'] as List).single['pages'] as List)
          .single['properties'] as List;
      expect(codesOf((props[0]['enums'] as List).cast()), ['MALE']);
      expect(codesOf((props[1]['enums'] as List).cast()), ['A', 'B']);
      expect((props[2] as Map).containsKey('enums'), isFalse);
    });

    test('scalars and null are ignored', () {
      expect(() => applyEnumsToSchemaCodes(null, {}), returnsNormally);
      expect(() => applyEnumsToSchemaCodes('x', {}), returnsNormally);
      expect(() => applyEnumsToSchemaCodes(1, {}), returnsNormally);
    });

    test('running it twice gives the same result', () {
      final field = <String, dynamic>{'schemaCode': both};
      final data = {
        gvl: [rec('A')],
        clf: [rec('B')],
      };
      applyEnumsToSchemaCodes(field, data);
      final first = jsonEncode(field);
      applyEnumsToSchemaCodes(field, data);
      expect(jsonEncode(field), first);
    });
  });

  // ------------------------------------------------------------------------
  group('Polio household strategy config, end to end', () {
    // Same steps as enrichFormSchemasWithEnumsForForms: collect the masters,
    // "download" them, apply to the config.
    Map<String, dynamic> configCopy() =>
        jsonDecode(jsonEncode(samplePolioHouseholdStrategyFlows))
            as Map<String, dynamic>;

    Map<String, dynamic> locationField(Map<String, dynamic> config) {
      Map<String, dynamic>? found;
      void walk(dynamic n) {
        if (n is Map) {
          if (n['fieldName'] == 'vaccinationLocation') {
            found = n.cast<String, dynamic>();
          }
          n.values.forEach(walk);
        } else if (n is List) {
          n.forEach(walk);
        }
      }

      walk(config);
      return found!;
    }

    test(
        'the location dropdown names both masters, GroupVaccinationLocations first',
        () {
      expect(splitSchemaCodes(locationField(configCopy())['schemaCode']),
          [gvl, clf]);
    });

    test('both masters are collected for download', () {
      final out = <String>{};
      for (final flow in configCopy()['flows'] as List) {
        collectSchemaCodes(flow, out);
      }
      expect(out, containsAll([gvl, clf]));
    });

    test('dropdown gets both masters merged, OTHER once', () {
      final config = configCopy();
      final data = {
        gvl: [
          rec('OTHER', 'GV_ENUM_OTHER'),
          rec('BUS_STATION', 'GV_ENUM_BUS_STATION')
        ],
        clf: [rec('CLF_SITE', 'CLF_ENUM_SITE'), rec('OTHER', 'CLF_ENUM_OTHER')],
      };
      for (final flow in config['flows'] as List) {
        applyEnumsToSchemaCodes(flow, data);
      }
      final enums = (locationField(config)['enums'] as List).cast<Map>();
      expect(enums.map((e) => e['code']), ['OTHER', 'BUS_STATION', 'CLF_SITE']);
      expect(enums.where((e) => e['code'] == 'OTHER'), hasLength(1));
    });

    test('with only the CLF master filled, its options are shown', () {
      final config = configCopy();
      for (final flow in config['flows'] as List) {
        applyEnumsToSchemaCodes(flow, {
          gvl: [],
          clf: [rec('CLF_SITE'), rec('OTHER')],
        });
      }
      expect((locationField(config)['enums'] as List).map((e) => e['code']),
          ['CLF_SITE', 'OTHER']);
    });

    test('with both masters empty, the config fallback options stay', () {
      final config = configCopy();
      final before = jsonEncode(locationField(config)['enums']);
      for (final flow in config['flows'] as List) {
        applyEnumsToSchemaCodes(flow, {gvl: [], clf: []});
      }
      expect(jsonEncode(locationField(config)['enums']), before);
      expect((locationField(config)['enums'] as List).map((e) => e['code']),
          contains('OTHER'));
    });

    test('other fields of the config are not changed by these masters', () {
      final config = configCopy();
      final location = locationField(config);
      final before = jsonEncode(config);
      for (final flow in config['flows'] as List) {
        applyEnumsToSchemaCodes(flow, {
          gvl: [rec('A')],
          clf: [rec('B')],
        });
      }
      // Undo the one expected change and compare the rest.
      final after = jsonDecode(jsonEncode(config)) as Map<String, dynamic>;
      final restored = jsonDecode(before) as Map<String, dynamic>;
      String withoutLocationEnums(Map<String, dynamic> c) {
        void walk(dynamic n) {
          if (n is Map) {
            if (n['fieldName'] == 'vaccinationLocation') n.remove('enums');
            n.values.forEach(walk);
          } else if (n is List) {
            n.forEach(walk);
          }
        }

        walk(c);
        return jsonEncode(c);
      }

      expect(withoutLocationEnums(after), withoutLocationEnums(restored));
      expect((location['enums'] as List).map((e) => e['code']), ['A', 'B']);
    });
  });
}
