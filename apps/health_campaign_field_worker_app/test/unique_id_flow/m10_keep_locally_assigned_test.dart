// T10 - RC-15 / DS-07: a re-download must not make a used, unsynced ID free.
//
// Reproduced on 2026-10-30: an ID used offline came back from the dispatch
// API as DISPATCHED (mapped to UN_ASSIGNED) until its record synced.
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/utils/beneficiary_id_allocator.dart';

import 'support/unique_id_test_support.dart';

void main() {
  setUpAll(setUpUniqueIdFlow);

  test('T10: a locally ASSIGNED row stays ASSIGNED after a re-download', () {
    final downloaded = [
      poolRow('SMC-0001'),
      poolRow('SMC-0002'),
    ];

    final kept = keepLocallyAssigned(downloaded, {'SMC-0001'});

    expect(kept.map((r) => r.status), [assigned, unAssigned]);
  });

  test('T10: nothing changes when no row is assigned locally', () {
    final downloaded = [poolRow('SMC-0001')];

    expect(identical(keepLocallyAssigned(downloaded, {}), downloaded), isTrue);
  });
}
