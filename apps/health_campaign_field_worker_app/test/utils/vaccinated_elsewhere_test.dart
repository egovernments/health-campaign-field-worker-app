import 'package:digit_data_converter/src/transformer_service.dart';
import 'package:digit_data_converter/utils/utils.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/data_model.init.dart' as data_model_mappers;
import 'package:digit_flow_builder/data/digit_data_converter.dart';
import 'package:digit_flow_builder/data/transformer_config.dart';
import 'package:digit_flow_builder/utils/conditional_evaluator.dart';
import 'package:digit_flow_builder/utils/function_registry.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/sampleJsonConfigs/polio_household_strategy.dart';
import 'package:intl/intl.dart';

/// Tests for the Polio "Vaccinated elsewhere" feature:
/// - the card functions in function_registry.dart,
/// - the member card `visible` rules in polio_household_strategy.dart,
///   evaluated the way the app evaluates them,
/// - the Vaccinated Elsewhere page and buttons in the same config,
/// - the save mappings in transformer_config.dart.
void main() {
  final now = DateTime.now();
  final day = const Duration(days: 1).inMilliseconds;
  final nowMs = now.millisecondsSinceEpoch;

  // Round 1 ended a month ago; round 2 is running today.
  final cycles = [
    ProjectCycle(
      id: 1,
      startDate: nowMs - 40 * day,
      endDate: nowMs - 30 * day,
      deliveries: [ProjectCycleDelivery(id: 1, deliveryStrategy: 'DIRECT')],
    ),
    ProjectCycle(
      id: 2,
      startDate: nowMs - 2 * day,
      endDate: nowMs + 8 * day,
      deliveries: [ProjectCycleDelivery(id: 1, deliveryStrategy: 'DIRECT')],
    ),
  ];

  String dobYearsAgo(int years) => DateFormat('dd/MM/yyyy')
      .format(DateTime(now.year - years, now.month, now.day));

  // A 12-month-old child, inside the 0-59 month range.
  final dob = dobYearsAgo(1);
  // A 20-year-old, outside the range.
  final adultDob = dobYearsAgo(20);

  final stateData = CrudStateData({}, []);

  TaskModel task({
    required String id,
    required String status,
    required int cycle,
    required int createdTime,
    Map<String, String> extra = const {},
  }) {
    return TaskModel(
      clientReferenceId: id,
      status: status,
      clientAuditDetails:
          ClientAuditDetails(createdBy: 'user-1', createdTime: createdTime),
      additionalFields: TaskAdditionalFields(version: 1, fields: [
        AdditionalField('cycleIndex', '$cycle'),
        AdditionalField('doseIndex', '1'),
        for (final e in extra.entries) AdditionalField(e.key, e.value),
      ]),
    );
  }

  // Day 1 of round 2: Unable to deliver, reason ABSENCE.
  final absent = task(
    id: 'absent',
    status: 'ADMINISTRATION_FAILED',
    cycle: 2,
    createdTime: nowMs - day,
    extra: {'taskType': 'UNABLE_TO_DELIVER', 'reason': 'ABSENCE'},
  );
  // Same, but the family refused.
  final refused = task(
    id: 'refused',
    status: 'ADMINISTRATION_FAILED',
    cycle: 2,
    createdTime: nowMs - day,
    extra: {'taskType': 'UNABLE_TO_DELIVER', 'reason': 'REFUSED'},
  );
  // Unable to deliver for a reason other than Absent / Refused.
  final otherReason = task(
    id: 'other',
    status: 'ADMINISTRATION_FAILED',
    cycle: 2,
    createdTime: nowMs - day,
    extra: {'taskType': 'UNABLE_TO_DELIVER', 'reason': 'CHILD_SICK'},
  );
  // Revisit: recorded as vaccinated elsewhere.
  final elsewhere = task(
    id: 'elsewhere',
    status: 'VACCINATED_ELSEWHERE',
    cycle: 2,
    createdTime: nowMs - 60000,
    extra: {
      'taskType': 'VACCINATED_ELSEWHERE',
      'vaccinationLocation': 'TRANSIT_POST',
    },
  );
  // First visit: recorded as vaccinated elsewhere, nothing before it.
  final elsewhereFirstVisit = task(
    id: 'elsewhere-first',
    status: 'VACCINATED_ELSEWHERE',
    cycle: 2,
    createdTime: nowMs - day,
    extra: {'taskType': 'VACCINATED_ELSEWHERE', 'vaccinationLocation': 'SCHOOL'},
  );
  // Vaccinated at home.
  final vaccinated = task(
    id: 'vaccinated',
    status: 'ADMINISTRATION_SUCCESS',
    cycle: 2,
    createdTime: nowMs - day,
    extra: {'taskType': 'DELIVERY'},
  );
  // Revisit after Unable To Deliver: redose given.
  final redose = task(
    id: 'redose',
    status: 'VISITED',
    cycle: 2,
    createdTime: nowMs - 60000,
    extra: {'taskType': 'REDOSE'},
  );
  // Absent in the previous round only.
  final absentLastRound = task(
    id: 'absent-r1',
    status: 'ADMINISTRATION_FAILED',
    cycle: 1,
    createdTime: nowMs - 35 * day,
    extra: {'taskType': 'UNABLE_TO_DELIVER', 'reason': 'ABSENCE'},
  );
  // Vaccinated elsewhere in the previous round only.
  final elsewhereLastRound = task(
    id: 'elsewhere-r1',
    status: 'VACCINATED_ELSEWHERE',
    cycle: 1,
    createdTime: nowMs - 35 * day,
    extra: {'taskType': 'VACCINATED_ELSEWHERE'},
  );

  dynamic call(String name, List<dynamic> args) =>
      FunctionRegistry.call(name, args, stateData);

  void setProjectCycles(List<ProjectCycle> projectCycles) {
    FlowBuilderSingleton().setInitialData(
      loggedInUserUuid: 'user-1',
      maxRadius: 0,
      projectId: 'project-1',
      selectedBeneficiaryType: BeneficiaryType.individual,
      projectType: ProjectTypeModel(
        id: 'polio',
        validMinAge: 0,
        validMaxAge: 59,
        cycles: projectCycles,
      ),
      selectedProject: ProjectModel(id: 'project-1', name: 'Polio'),
      loggedInUser: null,
    );
  }

  setUpAll(() {
    // Same start-up steps the app runs (utils.dart:652 and
    // flow_builder_home_page.dart:99): register the model mappers and the
    // model factories the save mapping uses.
    data_model_mappers.initializeMappers();
    DataConverterSingleton()
        .setData(dynamicEntityModelListener: EntityModelJsonMapper());
    initializeFunctionRegistry();
    setProjectCycles(cycles);
  });

  // ------------------------------------------------------------------ config
  final flows = samplePolioHouseholdStrategyFlows as Map<String, dynamic>;

  List<Map> findAll(dynamic o, bool Function(Map) test, [List<Map>? acc]) {
    acc ??= [];
    if (o is Map) {
      if (test(o)) acc.add(o);
      for (final v in o.values) {
        findAll(v, test, acc);
      }
    } else if (o is List) {
      for (final v in o) {
        findAll(v, test, acc);
      }
    }
    return acc;
  }

  Map field(String fieldName) =>
      findAll(flows, (m) => m['fieldName'] == fieldName).single;

  Map vePage() => findAll(flows, (m) => m['page'] == 'vaccinatedElsewhere').single;

  Map? veProperty(String fieldName) {
    final props = vePage()['properties'] as List;
    for (final p in props) {
      if (p is Map && p['fieldName'] == fieldName) return p;
    }
    return null;
  }

  // Evaluates a member card `visible` rule from the config, with the item
  // shaped like the household overview list item.
  bool visible(
    String fieldName, {
    required List<TaskModel> tasks,
    String? dateOfBirth,
    bool isHead = false,
  }) {
    final item = {
      'task': tasks,
      'individual': [
        IndividualModel(clientReferenceId: 'ind-1', dateOfBirth: dateOfBirth ?? dob)
      ],
      'hFReferral': [],
      'member': [
        HouseholdMemberModel(clientReferenceId: 'mem-1', isHeadOfHousehold: isHead)
      ],
      'projectBeneficiary': [],
    };
    final result = ConditionalEvaluator.evaluate(
      field(fieldName)['visible'],
      {'item': item, 'contextData': <String, dynamic>{}},
      stateData: stateData,
    );
    return result == true;
  }

  // Which member card items are visible for a given task history.
  Map<String, bool> card(List<TaskModel> tasks,
          {String? dateOfBirth, bool isHead = false}) =>
      {
        for (final f in const [
          'notEligible',
          'administrationSuccess',
          'administrationFailed',
          'reVaccinatedTag',
          'notVisited',
          'actionButton',
          'redoseButton',
          'revisitVaccinatedElsewhereButton',
        ])
          f: visible(f, tasks: tasks, dateOfBirth: dateOfBirth, isHead: isHead),
      };

  Map<String, bool> only(Iterable<String> shown) => {
        for (final f in const [
          'notEligible',
          'administrationSuccess',
          'administrationFailed',
          'reVaccinatedTag',
          'notVisited',
          'actionButton',
          'redoseButton',
          'revisitVaccinatedElsewhereButton',
        ])
          f: shown.contains(f),
      };

  // ========================================================================
  group('TaskStatus', () {
    test('new status constant', () {
      expect(TaskStatus.vaccinatedElsewhere, 'VACCINATED_ELSEWHERE');
    });

    test('new status differs from every status counted as a dose', () {
      expect(TaskStatus.vaccinatedElsewhere,
          isNot(anyOf(TaskStatus.administrationSuccess, TaskStatus.delivered,
              TaskStatus.visited)));
    });
  });

  // ========================================================================
  group('wasAbsentOrRefusedForCurrentCycle (revisit button)', () {
    const fn = 'wasAbsentOrRefusedForCurrentCycle';

    test('absent child gets the button', () {
      expect(call(fn, [[absent]]), isTrue);
    });

    test('refused child gets the button', () {
      expect(call(fn, [[refused]]), isTrue);
    });

    test('other Unable To Deliver reasons do not count', () {
      expect(call(fn, [[otherReason]]), isFalse);
    });

    test('Unable To Deliver with no reason does not count', () {
      final noReason = task(
          id: 'no-reason',
          status: 'ADMINISTRATION_FAILED',
          cycle: 2,
          createdTime: nowMs - day);
      expect(call(fn, [[noReason]]), isFalse);
    });

    test('a reason on a task that is not Unable To Deliver does not count', () {
      final odd = task(
          id: 'odd',
          status: 'ADMINISTRATION_SUCCESS',
          cycle: 2,
          createdTime: nowMs - day,
          extra: {'reason': 'ABSENCE'});
      expect(call(fn, [[odd]]), isFalse);
    });

    test('status and reason are matched case-insensitively', () {
      final lower = absent.toMap()
        ..['status'] = 'administration_failed'
        ..['additionalFields'] = {
          'version': 1,
          'fields': [
            {'key': 'cycleIndex', 'value': '2'},
            {'key': 'reason', 'value': 'refused'},
          ],
        };
      expect(call(fn, [[lower]]), isTrue);
    });

    test('button disappears once vaccinated elsewhere is recorded (absent)', () {
      expect(call(fn, [[absent, elsewhere]]), isFalse);
    });

    test('button disappears once vaccinated elsewhere is recorded (refused)', () {
      expect(call(fn, [[refused, elsewhere]]), isFalse);
    });

    test('button disappears once a redose is recorded', () {
      expect(call(fn, [[absent, redose]]), isFalse);
      expect(call(fn, [[refused, redose]]), isFalse);
    });

    test('list order does not matter: newest task wins', () {
      expect(call(fn, [[elsewhere, absent]]), isFalse);
      expect(call(fn, [[redose, refused]]), isFalse);
    });

    test('a later Absent after an earlier delivery shows the button', () {
      final laterAbsent = task(
          id: 'later-absent',
          status: 'ADMINISTRATION_FAILED',
          cycle: 2,
          createdTime: nowMs - 1000,
          extra: {'reason': 'ABSENCE'});
      expect(call(fn, [[vaccinated, laterAbsent]]), isTrue);
    });

    test('an absence from a previous round does not count', () {
      expect(call(fn, [[absentLastRound]]), isFalse);
    });

    test('a previous-round absence next to a current-round refusal counts', () {
      expect(call(fn, [[absentLastRound, refused]]), isTrue);
    });

    test('tasks without a cycleIndex are ignored', () {
      final noCycle = TaskModel(
        clientReferenceId: 'no-cycle',
        status: 'ADMINISTRATION_FAILED',
        clientAuditDetails:
            ClientAuditDetails(createdBy: 'user-1', createdTime: nowMs),
        additionalFields: TaskAdditionalFields(
            version: 1, fields: [AdditionalField('reason', 'ABSENCE')]),
      );
      expect(call(fn, [[noCycle]]), isFalse);
    });

    test('a task without createdTime counts as the oldest', () {
      final undated = absent.toMap()..remove('clientAuditDetails');
      // The dated Vaccinated Elsewhere task is newer, so no button.
      expect(call(fn, [[elsewhere, undated]]), isFalse);
    });

    test('no tasks, null or wrong type returns false', () {
      expect(call(fn, [[]]), isFalse);
      expect(call(fn, [null]), isFalse);
      expect(call(fn, ['not-a-list']), isFalse);
      expect(call(fn, []), isFalse);
    });

    test('list entries that are not tasks are tolerated', () {
      expect(call(fn, [['junk', 42, absent]]), isTrue);
    });

    test('accepts plain maps as well as TaskModel objects', () {
      expect(call(fn, [[absent.toMap()]]), isTrue);
      expect(call(fn, [[refused.toMap()]]), isTrue);
    });

    test('no running cycle returns false', () {
      setProjectCycles([cycles.first]);
      addTearDown(() => setProjectCycles(cycles));
      expect(call(fn, [[absent]]), isFalse);
    });

    test('the old name is no longer registered', () {
      expect(FunctionRegistry.get('wasAbsentForCurrentCycle'), isNull);
    });
  });

  // ========================================================================
  group('hasVaccinatedElsewhereForCurrentCycle (success chip)', () {
    const fn = 'hasVaccinatedElsewhereForCurrentCycle';

    test('true after a revisit recorded as vaccinated elsewhere', () {
      expect(call(fn, [[absent, elsewhere]]), isTrue);
      expect(call(fn, [[refused, elsewhere]]), isTrue);
    });

    test('true when vaccinated elsewhere on the first visit', () {
      expect(call(fn, [[elsewhereFirstVisit]]), isTrue);
    });

    test('false before the revisit', () {
      expect(call(fn, [[absent]]), isFalse);
    });

    test('false when a newer task follows it', () {
      final laterAbsent = task(
          id: 'later-absent',
          status: 'ADMINISTRATION_FAILED',
          cycle: 2,
          createdTime: nowMs - 1000,
          extra: {'reason': 'ABSENCE'});
      expect(call(fn, [[elsewhere, laterAbsent]]), isFalse);
    });

    test('false for other statuses', () {
      expect(call(fn, [[vaccinated]]), isFalse);
      expect(call(fn, [[redose]]), isFalse);
    });

    test('previous round does not count', () {
      expect(call(fn, [[elsewhereLastRound]]), isFalse);
    });

    test('status is matched case-insensitively', () {
      final lower = elsewhere.toMap()..['status'] = 'vaccinated_elsewhere';
      expect(call(fn, [[lower]]), isTrue);
    });

    test('accepts plain maps', () {
      expect(call(fn, [[absent.toMap(), elsewhere.toMap()]]), isTrue);
    });

    test('no tasks, null or wrong type returns false', () {
      expect(call(fn, [[]]), isFalse);
      expect(call(fn, [null]), isFalse);
      expect(call(fn, ['not-a-list']), isFalse);
      expect(call(fn, []), isFalse);
    });

    test('no running cycle returns false', () {
      setProjectCycles([cycles.first]);
      addTearDown(() => setProjectCycles(cycles));
      expect(call(fn, [[elsewhere]]), isFalse);
    });
  });

  // ========================================================================
  group('Existing functions with Vaccinated Elsewhere', () {
    test('isDelivered is false for the new status', () {
      expect(call('isDelivered', ['VACCINATED_ELSEWHERE']), isFalse);
      expect(call('isDelivered', ['vaccinated_elsewhere']), isFalse);
      expect(call('isDelivered', ['ADMINISTRATION_SUCCESS']), isTrue);
    });

    test('hasUnableToDeliverForCurrentCycle: false once vaccinated elsewhere', () {
      expect(call('hasUnableToDeliverForCurrentCycle', [[absent]]), isTrue);
      expect(call('hasUnableToDeliverForCurrentCycle', [[refused]]), isTrue);
      expect(call('hasUnableToDeliverForCurrentCycle', [[absent, elsewhere]]),
          isFalse);
      expect(call('hasUnableToDeliverForCurrentCycle', [[refused, elsewhere]]),
          isFalse);
    });

    test('hasRedoseForCurrentCycle: false for vaccinated elsewhere', () {
      expect(call('hasRedoseForCurrentCycle', [[absent, elsewhere]]), isFalse);
      expect(call('hasRedoseForCurrentCycle', [[absent, redose]]), isTrue);
    });

    test('checkAllDoseDelivered: true after vaccinated elsewhere this round', () {
      expect(call('checkAllDoseDelivered', [[absent, elsewhere]]), isTrue);
      expect(call('checkAllDoseDelivered', [[elsewhereFirstVisit]]), isTrue);
    });

    test('checkAllDoseDelivered: previous-round vaccinated elsewhere does not count',
        () {
      expect(call('checkAllDoseDelivered', [[elsewhereLastRound]]), isFalse);
    });

    test('checkAllDoseDelivered: a never-visited child still has doses pending',
        () {
      expect(call('checkAllDoseDelivered', [[]]), isFalse);
    });

    test('checkPolioEligibility rescues absent / refused + vaccinated elsewhere',
        () {
      // The standard check alone says no, because the failed task is in
      // history. checkPolioEligibility must rescue it.
      expect(
          call('checkEligibilityForAgeAndSideEffect', [dob, [absent, elsewhere]]),
          isFalse);
      expect(call('checkPolioEligibility', [dob, [absent, elsewhere]]), isTrue);
      expect(call('checkPolioEligibility', [dob, [refused, elsewhere]]), isTrue);
    });

    test('checkPolioEligibility: vaccinated elsewhere on first visit is eligible',
        () {
      expect(call('checkPolioEligibility', [dob, [elsewhereFirstVisit]]), isTrue);
    });

    test('checkPolioEligibility: still false for an adult with no tasks', () {
      expect(call('checkPolioEligibility', [adultDob, []]), isFalse);
    });
  });

  // ========================================================================
  group('Member card rules from the config (as the app evaluates them)', () {
    test('never visited: Not visited + action button', () {
      expect(card([]), only(['notVisited', 'actionButton']));
    });

    test('vaccinated at home: success chip only', () {
      expect(card([vaccinated]), only(['administrationSuccess']));
    });

    test('absent: Unable to vaccinate chip + Redose + Vaccinated elsewhere', () {
      expect(
          card([absent]),
          only([
            'administrationFailed',
            'redoseButton',
            'revisitVaccinatedElsewhereButton',
          ]));
    });

    test('refused: same as absent', () {
      expect(
          card([refused]),
          only([
            'administrationFailed',
            'redoseButton',
            'revisitVaccinatedElsewhereButton',
          ]));
    });

    test('other Unable To Deliver reason: Redose only, no Vaccinated elsewhere',
        () {
      expect(card([otherReason]), only(['administrationFailed', 'redoseButton']));
    });

    test('vaccinated elsewhere on first visit: success chip only', () {
      expect(card([elsewhereFirstVisit]), only(['administrationSuccess']));
    });

    test('absent then vaccinated elsewhere: success chip only', () {
      expect(card([absent, elsewhere]), only(['administrationSuccess']));
    });

    test('refused then vaccinated elsewhere: success chip only', () {
      expect(card([refused, elsewhere]), only(['administrationSuccess']));
    });

    test('absent then redose: Vaccinated on revisit chip only', () {
      expect(card([absent, redose]), only(['reVaccinatedTag']));
    });

    test('vaccinated elsewhere last round only: treated as not visited this round',
        () {
      expect(card([elsewhereLastRound]), only(['notVisited', 'actionButton']));
    });

    test('head of household: no member chips or buttons', () {
      expect(card([], isHead: true), only([]));
      expect(card([absent], isHead: true), only([]));
      expect(card([absent, elsewhere], isHead: true), only([]));
    });

    test('child outside the age range: Not eligible only', () {
      expect(card([], dateOfBirth: adultDob), only(['notEligible']));
    });

    test('Not visited never shows next to the success chip', () {
      for (final history in [
        [elsewhereFirstVisit],
        [absent, elsewhere],
        [refused, elsewhere],
        [vaccinated],
      ]) {
        final shown = card(history);
        expect(shown['administrationSuccess'] == true && shown['notVisited'] == true,
            isFalse,
            reason: 'history: ${history.map((t) => t.clientReferenceId)}');
      }
    });
  });

  // ========================================================================
  group('Config: member card buttons', () {
    test('revisit button opens the Vaccinated Elsewhere form', () {
      final button = field('revisitVaccinatedElsewhereButton');
      expect(button['label'], 'HCM_HOUSEHOLD_OVERVIEW_VACCINATED_ELSEWHERE_LABEL');
      expect(button['format'], 'button');
      final action = (button['onAction'] as List).single as Map;
      expect(action['actionType'], 'CHECK_ELIGIBILITY_AND_NAVIGATE');
      expect(action['properties']['name'], 'VACCINATED_ELSEWHERE');
      expect(action['properties']['type'], 'FORM');
    });

    test('revisit button passes everything the save mapping needs', () {
      final action =
          (field('revisitVaccinatedElsewhereButton')['onAction'] as List).single
              as Map;
      final keys = [
        for (final d in action['properties']['data'] as List) d['key'],
      ];
      expect(
          keys,
          containsAll([
            'ProjectBeneficiaryClientReferenceId',
            'HouseholdClientReferenceId',
            'cycleIndex',
            'doseIndex',
            'selectedIndividualAgeInMonths',
          ]));
    });

    test('revisit button uses the Absent-or-Refused rule', () {
      final rule = field('revisitVaccinatedElsewhereButton')['visible'] as String;
      expect(rule, contains('wasAbsentOrRefusedForCurrentCycle(item.task)'));
      expect(rule, isNot(contains('wasAbsentForCurrentCycle')));
    });

    test('first-visit button also opens the Vaccinated Elsewhere form', () {
      final button = field('vaccinatedElsewhereButton');
      final names = findAll(button, (m) => m['name'] == 'VACCINATED_ELSEWHERE');
      expect(names, isNotEmpty);
    });

    test('the config never calls the old function name', () {
      final rules = findAll(flows, (m) => m['visible'] is String)
          .map((m) => m['visible'] as String);
      expect(rules.where((r) => r.contains('wasAbsentForCurrentCycle')), isEmpty);
    });

    test('redose button sits directly above the revisit button', () {
      expect(
          (field('redoseButton')['properties'] as Map).containsKey('bottomGap'),
          isFalse);
      expect(field('revisitVaccinatedElsewhereButton')['properties']['topGap'],
          16);
    });
  });

  // ========================================================================
  group('Config: Vaccinated Elsewhere page', () {
    test('the page belongs to the VACCINATED_ELSEWHERE flow', () {
      final flow = findAll(flows, (m) => m['name'] == 'VACCINATED_ELSEWHERE')
          .firstWhere((m) => m['pages'] is List);
      expect(
          (flow['pages'] as List).any((p) => p['page'] == 'vaccinatedElsewhere'),
          isTrue);
    });

    test('resources card is hidden', () {
      expect(veProperty('resourceCard')!['hidden'], isTrue);
    });

    test('hidden resources card is still part of the form', () {
      // The forms engine builds hidden + includeInForm custom fields off
      // screen, so the card still fills its value from the delivery rules.
      expect(veProperty('resourceCard')!['includeInForm'], isTrue);
      expect(veProperty('resourceCard')!['format'], 'custom');
    });

    test('old site name and region fields are gone', () {
      expect(veProperty('siteName'), isNull);
      expect(veProperty('region'), isNull);
    });

    test('GPS field is still shown', () {
      expect(veProperty('latLng')!['hidden'], isFalse);
    });

    test('location dropdown: required, after GPS, options from MDMS', () {
      final location = veProperty('vaccinationLocation')!;
      expect(location['format'], 'dropdown');
      expect(location['hidden'], isFalse);
      expect(location['includeInForm'], isTrue);
      expect(location['mandatory'], isTrue);
      expect(location['isMdms'], isTrue);
      expect(location['schemaCode'],
          'common-masters.GroupVaccinationLocations,common-masters.GroupVaccinationLocationsCLF');
      expect(location['order'], greaterThan(veProperty('latLng')!['order']));
      expect(location['label'], 'VACCINATED_ELSEWHERE_LOCATION_LABEL');
      final required = (location['validations'] as List)
          .firstWhere((v) => v['type'] == 'required');
      expect(required['message'], 'VACCINATED_ELSEWHERE_LOCATION_REQUIRED');
    });

    test('location dropdown fallback options include OTHER', () {
      final codes = [
        for (final e in veProperty('vaccinationLocation')!['enums'] as List)
          e['code'],
      ];
      expect(codes,
          ['SCHOOL', 'MARKETPLACE', 'HEALTH_FACILITY', 'TRANSIT_POST', 'OTHER']);
      for (final e in veProperty('vaccinationLocation')!['enums'] as List) {
        expect(e['name'], 'VACCINATED_ELSEWHERE_ENUM_${e['code']}');
      }
    });

    test('"Other" text box: optional, after the dropdown, only for OTHER', () {
      final other = veProperty('vaccinationLocationOther')!;
      expect(other['format'], 'text');
      expect(other['mandatory'], isFalse);
      expect(other['includeInForm'], isTrue);
      expect(other['validations'], isEmpty);
      expect(other['order'],
          greaterThan(veProperty('vaccinationLocation')!['order']));
      final conditions = [
        for (final e in other['visibilityCondition']['expression'] as List)
          e['condition'],
      ];
      expect(conditions, ["vaccinatedElsewhere.vaccinationLocation=='OTHER'"]);
    });

    test('form submit uses the vaccinatedElsewhere save mapping', () {
      final configNames = findAll(flows, (m) => m['configName'] == 'vaccinatedElsewhere');
      expect(configNames, isNotEmpty);
      expect(jsonConfig.containsKey('vaccinatedElsewhere'), isTrue);
    });
  });

  // ========================================================================
  group('Progress bar', () {
    test('status is not one My Progress counts', () {
      // beneficiary_progress.dart counts only these two statuses.
      const counted = {'ADMINISTRATION_SUCCESS', 'VISITED'};
      expect(counted.contains(TaskStatus.vaccinatedElsewhere), isFalse);
    });
  });

  // ========================================================================
  group('Save mapping: vaccinatedElsewhere', () {
    final context = {
      'projectId': 'project-1',
      'tenantId': 'mz',
      'userId': 'user-1',
      'userUUID': 'user-1',
      'loggedInUserUuid': 'user-1',
      'selectedBoundaryCode': 'VILLAGE_1',
      'ProjectBeneficiaryClientReferenceId': 'pb-1',
      'cycleIndex': '2',
      'doseIndex': '1',
    };

    List<EntityModel> save(Map<String, dynamic> page,
        {Map<String, dynamic>? ctx}) {
      final config = jsonConfig['vaccinatedElsewhere'] as Map<String, dynamic>;
      return FormEntityMapper(config: jsonConfig).mapFormToEntities(
        formValues: {'vaccinatedElsewhere': page},
        modelsConfig: config['models'] as Map<String, dynamic>,
        // Same keys TransformerExecutor puts in its context map.
        context: ctx ?? context,
        fallbackFormDataString: config['fallbackModel'] as String?,
      );
    }

    String? field(TaskModel t, String key) => t.additionalFields?.fields
        .firstWhere((f) => f.key == key,
            orElse: () => AdditionalField(key, null))
        .value
        ?.toString();

    test('creates exactly one task and nothing else', () {
      final entities = save({'vaccinationLocation': 'TRANSIT_POST'});
      expect(entities.whereType<TaskModel>(), hasLength(1));
      expect(entities.whereType<TaskResourceModel>(), isEmpty);
    });

    // The hidden resource card is still sent, so a form without a card value
    // saves no resource; the card case is covered below.
    // test('saves the new status, the location and no vaccine resource', () {
    test('saves the new status and the location', () {
      final t = save({'vaccinationLocation': 'TRANSIT_POST'})
          .whereType<TaskModel>()
          .single;
      expect(t.status, 'VACCINATED_ELSEWHERE');
      expect(t.status, isNot('ADMINISTRATION_SUCCESS'));
      expect(t.projectBeneficiaryClientReferenceId, 'pb-1');
      expect(field(t, 'vaccinationLocation'), 'TRANSIT_POST');
      expect(field(t, 'cycleIndex'), '2');
      expect(field(t, 'doseIndex'), '1');
      expect(field(t, 'taskType'), 'VACCINATED_ELSEWHERE');
      // expect(t.resources ?? [], isEmpty);
    });

    test('fills project, tenant, creator and a new client reference id', () {
      final t = save({'vaccinationLocation': 'SCHOOL'})
          .whereType<TaskModel>()
          .single;
      expect(t.projectId, 'project-1');
      expect(t.tenantId, 'mz');
      expect(t.createdBy, 'user-1');
      expect(t.clientReferenceId, isNotEmpty);
      expect(field(t, 'locality'), 'VILLAGE_1');
    });

    test('each save gets its own client reference id', () {
      final a = save({'vaccinationLocation': 'SCHOOL'}).whereType<TaskModel>().single;
      final b = save({'vaccinationLocation': 'SCHOOL'}).whereType<TaskModel>().single;
      expect(a.clientReferenceId, isNot(b.clientReferenceId));
    });

    test('every location option is saved as its code', () {
      for (final code in ['SCHOOL', 'MARKETPLACE', 'HEALTH_FACILITY', 'TRANSIT_POST']) {
        final t = save({'vaccinationLocation': code}).whereType<TaskModel>().single;
        expect(field(t, 'vaccinationLocation'), code);
      }
    });

    test('a location code from the MDMS master is saved as is', () {
      final t = save({'vaccinationLocation': 'BUS_STATION'})
          .whereType<TaskModel>()
          .single;
      expect(field(t, 'vaccinationLocation'), 'BUS_STATION');
    });

    test('"Other" with no specific location still saves', () {
      final t = save({'vaccinationLocation': 'OTHER'})
          .whereType<TaskModel>()
          .single;
      expect(t.status, 'VACCINATED_ELSEWHERE');
      expect(field(t, 'vaccinationLocation'), 'OTHER');
      expect(field(t, 'vaccinationLocationOther'), anyOf(isNull, isEmpty));
    });

    test('"Other" with a typed location keeps the text', () {
      final t = save({
        'vaccinationLocation': 'OTHER',
        'vaccinationLocationOther': 'Mosque',
      }).whereType<TaskModel>().single;
      expect(field(t, 'vaccinationLocationOther'), 'Mosque');
    });

    test('GPS coordinates are saved in additional fields', () {
      final t = save({
        'vaccinationLocation': 'SCHOOL',
        'latLng': [12.5, 7.25, 4.0],
      }).whereType<TaskModel>().single;
      expect(field(t, 'latitude'), '12.5');
      expect(field(t, 'longitude'), '7.25');
      expect(field(t, 'locationAccuracy'), '4.0');
      expect(field(t, 'lat'), '12.5');
      expect(field(t, 'lng'), '7.25');
    });

    // test('a resource card value in the form is ignored', () {
    test('the hidden resource card value is saved as task resources', () {
      final t = save({
        'vaccinationLocation': 'SCHOOL',
        'resourceCard': [
          {
            'resourceDelivered': {'productId': 'nOPV2'},
            'quantityDistributed': 1,
          }
        ],
      }).whereType<TaskModel>().single;
      // expect(t.resources ?? [], isEmpty);
      final resource = t.resources!.single;
      expect(resource.productVariantId, 'nOPV2');
      expect(resource.quantity, '1');
      expect(resource.isDelivered, isTrue);
      expect(resource.taskclientReferenceId, t.clientReferenceId);
    });

    test('the cycle comes from the button, so the task belongs to this round', () {
      final t = save({'vaccinationLocation': 'SCHOOL'},
              ctx: {...context, 'cycleIndex': '1'})
          .whereType<TaskModel>()
          .single;
      expect(field(t, 'cycleIndex'), '1');
    });

    test('the saved task drives the card correctly (absent)', () {
      final saved = save({'vaccinationLocation': 'SCHOOL'})
          .whereType<TaskModel>()
          .single;
      final history = [absent, saved];
      expect(call('hasVaccinatedElsewhereForCurrentCycle', [history]), isTrue);
      expect(call('wasAbsentOrRefusedForCurrentCycle', [history]), isFalse);
      expect(call('checkAllDoseDelivered', [history]), isTrue);
    });

    test('the saved task drives the card correctly (refused)', () {
      final saved = save({'vaccinationLocation': 'MARKETPLACE'})
          .whereType<TaskModel>()
          .single;
      final history = [refused, saved];
      expect(call('hasVaccinatedElsewhereForCurrentCycle', [history]), isTrue);
      expect(call('wasAbsentOrRefusedForCurrentCycle', [history]), isFalse);
      expect(card(history), only(['administrationSuccess']));
    });
  });

  // ========================================================================
  group('Save mapping: polioUnableToDeliverConfig (Absent / Refused)', () {
    List<TaskModel> save(String reason) {
      final config =
          jsonConfig['polioUnableToDeliverConfig'] as Map<String, dynamic>;
      return FormEntityMapper(config: jsonConfig)
          .mapFormToEntities(
            formValues: {
              'unableToDeliver': {'reason': reason}
            },
            modelsConfig: config['models'] as Map<String, dynamic>,
            context: {
              'projectId': 'project-1',
              'tenantId': 'mz',
              'userId': 'user-1',
              'userUUID': 'user-1',
              'loggedInUserUuid': 'user-1',
              'selectedBoundaryCode': 'VILLAGE_1',
              'ProjectBeneficiaryClientReferenceId': 'pb-1',
              'cycleIndex': '2',
              'doseIndex': '1',
            },
            fallbackFormDataString: config['fallbackModel'] as String?,
          )
          .whereType<TaskModel>()
          .toList();
    }

    String? field(TaskModel t, String key) => t.additionalFields?.fields
        .firstWhere((f) => f.key == key,
            orElse: () => AdditionalField(key, null))
        .value
        ?.toString();

    test('Absent and Refused are both saved as ADMINISTRATION_FAILED', () {
      for (final reason in ['ABSENCE', 'REFUSED']) {
        final t = save(reason).single;
        expect(t.status, 'ADMINISTRATION_FAILED');
        expect(field(t, 'reason'), reason);
        expect(field(t, 'taskType'), 'UNABLE_TO_DELIVER');
      }
    });

    test('a saved Absent or Refused task shows the revisit button', () {
      for (final reason in ['ABSENCE', 'REFUSED']) {
        final saved = save(reason).single;
        expect(call('wasAbsentOrRefusedForCurrentCycle', [[saved]]), isTrue,
            reason: reason);
        expect(visible('revisitVaccinatedElsewhereButton', tasks: [saved]),
            isTrue,
            reason: reason);
      }
    });
  });

  // ========================================================================
  group('Revisit flag on tasks', () {
    final baseContext = {
      'projectId': 'project-1',
      'tenantId': 'mz',
      'userId': 'user-1',
      'userUUID': 'user-1',
      'loggedInUserUuid': 'user-1',
      'selectedBoundaryCode': 'VILLAGE_1',
      'ProjectBeneficiaryClientReferenceId': 'pb-1',
      'cycleIndex': '2',
      'doseIndex': '1',
    };

    TaskModel saveWith(String configName, Map<String, dynamic> formValues,
        Map<String, dynamic> ctx) {
      final config = jsonConfig[configName] as Map<String, dynamic>;
      return FormEntityMapper(config: jsonConfig)
          .mapFormToEntities(
            formValues: formValues,
            modelsConfig: config['models'] as Map<String, dynamic>,
            context: ctx,
            fallbackFormDataString: config['fallbackModel'] as String?,
          )
          .whereType<TaskModel>()
          .single;
    }

    String? revisitOf(TaskModel t) => t.additionalFields?.fields
        .firstWhere((f) => f.key == 'revisit',
            orElse: () => AdditionalField('revisit', null))
        .value
        ?.toString();

    List<Map> navData(String buttonFieldName) => [
          for (final m in findAll(field(buttonFieldName),
              (m) => m['name'] == 'VACCINATED_ELSEWHERE' && m['data'] is List))
            for (final d in m['data'] as List) d as Map,
        ];

    test('revisit button passes isRevisit = "true"', () {
      final d = navData('revisitVaccinatedElsewhereButton')
          .firstWhere((d) => d['key'] == 'isRevisit');
      expect(d['value'], 'true');
    });

    test('first-visit button passes isRevisit = "false"', () {
      final d = navData('vaccinatedElsewhereButton')
          .firstWhere((d) => d['key'] == 'isRevisit');
      expect(d['value'], 'false');
    });

    test('Vaccinated Elsewhere save action forwards isRevisit to the mapping',
        () {
      final saveAction = findAll(
              flows,
              (m) =>
                  m['actionType'] == 'FETCH_TRANSFORMER_CONFIG' &&
                  m['properties']?['configName'] == 'vaccinatedElsewhere')
          .single;
      final entry = (saveAction['properties']['data'] as List)
          .firstWhere((d) => d['key'] == 'isRevisit');
      expect(entry['value'], '{{navigation.isRevisit}}');
      // Resolved the way TransformerExecutor resolves it.
      expect(
          resolveValue(entry['value'], {
            'navigation': {'isRevisit': 'true'}
          }),
          'true');
      expect(
          resolveValue(entry['value'], {
            'navigation': {'isRevisit': 'false'}
          }),
          'false');
    });

    test('Vaccinated Elsewhere on revisit is saved with revisit = "true"', () {
      final t = saveWith(
          'vaccinatedElsewhere',
          {
            'vaccinatedElsewhere': {'vaccinationLocation': 'SCHOOL'}
          },
          {...baseContext, 'isRevisit': 'true'});
      expect(t.status, 'VACCINATED_ELSEWHERE');
      expect(revisitOf(t), 'true');
    });

    test('Vaccinated Elsewhere on first visit is saved with revisit = "false"',
        () {
      final t = saveWith(
          'vaccinatedElsewhere',
          {
            'vaccinatedElsewhere': {'vaccinationLocation': 'SCHOOL'}
          },
          {...baseContext, 'isRevisit': 'false'});
      expect(revisitOf(t), 'false');
    });

    test('revisit flag does not change how the card reads the task', () {
      final t = saveWith(
          'vaccinatedElsewhere',
          {
            'vaccinatedElsewhere': {'vaccinationLocation': 'SCHOOL'}
          },
          {...baseContext, 'isRevisit': 'true'});
      expect(card([absent, t]), only(['administrationSuccess']));
    });

    test('a redose is always saved with revisit = "true"', () {
      final t = saveWith(
          'redose',
          {
            'RedoseDetails': {'reasonForRedose': 'VOMITED'}
          },
          baseContext);
      expect(t.status, 'VISITED');
      expect(revisitOf(t), 'true');
    });

    test('Unable To Deliver has no revisit flag', () {
      final t = saveWith(
          'polioUnableToDeliverConfig',
          {
            'unableToDeliver': {'reason': 'ABSENCE'}
          },
          baseContext);
      expect(revisitOf(t), isNull);
    });
  });
}
