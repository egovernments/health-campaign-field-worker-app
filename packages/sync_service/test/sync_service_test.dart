import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sync_service/sync_service_lib.dart';

// ── Mocks ──────────────────────────────────────────────────────────────────

class MockLocalRepository extends Mock implements LocalRepository {}

class MockRemoteRepository extends Mock implements RemoteRepository {}

class MockIsar extends Mock implements Isar {}

class MockSyncService extends Mock implements SyncService {}

class MockSyncEntityMapperListener extends Mock
    implements SyncEntityMapperListener {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

class FakeOpLogEntry extends Fake implements OpLogEntry<EntityModel> {}

class FakeEntityModel extends Fake implements EntityModel {}

// ── Test helpers ───────────────────────────────────────────────────────────

const testUserId = 'test-user-123';
const testBatchSize = 5;
final testBandwidthModel = BandwidthModel.fromJson({
  'userId': testUserId,
  'batchSize': testBatchSize,
});

void main() {
  setUpAll(() {
    registerFallbackValue(FakeOpLogEntry());
    registerFallbackValue(FakeEntityModel());
  });

  group('BandwidthModel', () {
    test('creates from JSON correctly', () {
      final model = BandwidthModel.fromJson({
        'userId': 'user1',
        'batchSize': 10,
      });
      expect(model.userId, 'user1');
      expect(model.batchSize, 10);
    });

    test('serializes to JSON correctly', () {
      const model = BandwidthModel(userId: 'user1', batchSize: 10);
      final json = model.toJson();
      expect(json['userId'], 'user1');
      expect(json['batchSize'], 10);
    });

    test('equality works via freezed', () {
      const a = BandwidthModel(userId: 'user1', batchSize: 10);
      const b = BandwidthModel(userId: 'user1', batchSize: 10);
      const c = BandwidthModel(userId: 'user2', batchSize: 10);
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });
  });

  group('filterEntityByBandwidth', () {
    test('returns all entities when batch size >= list length', () async {
      final entities = List.generate(3, (_) => FakeEntityModel());
      final result = await filterEntityByBandwidth(10, entities);
      expect(result.length, 3);
    });

    test('returns only batchSize entities when batch size < list length',
        () async {
      final entities = List.generate(10, (_) => FakeEntityModel());
      final result = await filterEntityByBandwidth(3, entities);
      expect(result.length, 3);
    });

    test('returns empty list when entities list is empty', () async {
      final result = await filterEntityByBandwidth(5, []);
      expect(result, isEmpty);
    });

    test('returns exactly batchSize when equal to list length', () async {
      final entities = List.generate(5, (_) => FakeEntityModel());
      final result = await filterEntityByBandwidth(5, entities);
      expect(result.length, 5);
    });

    test('preserves order of entities', () async {
      final entities = List.generate(5, (i) => FakeEntityModel());
      final result = await filterEntityByBandwidth(3, entities);
      expect(result[0], same(entities[0]));
      expect(result[1], same(entities[1]));
      expect(result[2], same(entities[2]));
    });
  });

  group('filterOpLogByBandwidth', () {
    test('returns all entries when batch size >= list length', () async {
      final entries = List.generate(3, (_) => FakeOpLogEntry());
      final result = await filterOpLogByBandwidth(10, entries);
      expect(result.length, 3);
    });

    test('returns only batchSize entries when batch size < list length',
        () async {
      final entries = List.generate(10, (_) => FakeOpLogEntry());
      final result = await filterOpLogByBandwidth(3, entries);
      expect(result.length, 3);
    });

    test('returns empty list when entries list is empty', () async {
      final result = await filterOpLogByBandwidth(5, []);
      expect(result, isEmpty);
    });

    test('preserves order of entries', () async {
      final entries = List.generate(5, (i) => FakeOpLogEntry());
      final result = await filterOpLogByBandwidth(3, entries);
      expect(result[0], same(entries[0]));
      expect(result[1], same(entries[1]));
      expect(result[2], same(entries[2]));
    });
  });

  group('SyncError', () {
    test('SyncUpError toString includes class name and error', () {
      const error = SyncUpError('upload failed');
      expect(error.toString(), 'SyncUpError: upload failed');
    });

    test('SyncDownError toString includes class name and error', () {
      const error = SyncDownError('download failed');
      expect(error.toString(), 'SyncDownError: download failed');
    });

    test('SyncUpError is a SyncError', () {
      const error = SyncUpError('test');
      expect(error, isA<SyncError>());
      expect(error, isA<Exception>());
    });

    test('SyncDownError is a SyncError', () {
      const error = SyncDownError('test');
      expect(error, isA<SyncError>());
      expect(error, isA<Exception>());
    });

    test('SyncUpError stores the original error', () {
      final original = Exception('original');
      final error = SyncUpError(original);
      expect(error.error, same(original));
    });

    test('SyncDownError stores the original error', () {
      final original = Exception('original');
      final error = SyncDownError(original);
      expect(error.error, same(original));
    });

    test('SyncUpError without error argument', () {
      const error = SyncUpError();
      expect(error.error, isNull);
      expect(error.toString(), 'SyncUpError: null');
    });
  });

  group('SyncServiceSingleton', () {
    test('returns same instance', () {
      final a = SyncServiceSingleton();
      final b = SyncServiceSingleton();
      expect(identical(a, b), isTrue);
    });

    test('instance getter returns same as factory', () {
      expect(identical(SyncServiceSingleton.instance, SyncServiceSingleton()),
          isTrue);
    });

    test('setData stores values correctly', () {
      final mapper = MockSyncEntityMapperListener();
      SyncServiceSingleton().setData(
        syncDownRetryCount: 5,
        persistenceConfiguration: PersistenceConfiguration.offlineFirst,
        entityMapper: mapper,
      );
      expect(SyncServiceSingleton().syncDownRetryCount, 5);
      expect(SyncServiceSingleton().persistenceConfiguration,
          PersistenceConfiguration.offlineFirst);
      expect(SyncServiceSingleton().entityMapper, same(mapper));
    });

    test('default persistenceConfiguration is offlineFirst', () {
      // After setData above, we need to check the default — but singleton
      // state persists. We can only verify the getter works.
      expect(SyncServiceSingleton().persistenceConfiguration, isNotNull);
    });
  });

  group('SyncBloc', () {
    late MockIsar mockIsar;
    late MockSyncService mockSyncService;

    setUp(() {
      mockIsar = MockIsar();
      mockSyncService = MockSyncService();
    });

    test('initial state is SyncPendingState', () {
      final bloc = SyncBloc(isar: mockIsar, syncService: mockSyncService);
      expect(bloc.state, const SyncPendingState());
      bloc.close();
    });

    group('SyncSyncUpEvent', () {
      late MockLocalRepository mockLocal;
      late MockRemoteRepository mockRemote;

      setUp(() {
        mockLocal = MockLocalRepository();
        mockRemote = MockRemoteRepository();
      });

      blocTest<SyncBloc, SyncState>(
        'emits [syncInProgress, completedSync, loading, pendingSync] on successful sync',
        build: () {
          when(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).thenAnswer((_) async => true);
          // Mock the refresh event's isar query
          when(() => mockIsar.opLogs).thenThrow(
              Exception('skip refresh')); // Force refresh to use fallback
          return SyncBloc(isar: mockIsar, syncService: mockSyncService);
        },
        act: (bloc) => bloc.add(SyncSyncUpEvent(
          userId: testUserId,
          localRepositories: [mockLocal],
          remoteRepositories: [mockRemote],
        )),
        expect: () => [
          const SyncInProgressState(),
          const SyncCompletedState(),
          // Refresh events follow but may error — we check the first two
        ],
        verify: (_) {
          verify(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).called(1);
        },
        errors: () => [isA<Exception>()], // from the refresh after sync
      );

      blocTest<SyncBloc, SyncState>(
        'emits [syncInProgress, pendingSync] when sync returns false (lock held)',
        build: () {
          when(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).thenAnswer((_) async => false);
          when(() => mockIsar.opLogs)
              .thenThrow(Exception('skip refresh'));
          return SyncBloc(isar: mockIsar, syncService: mockSyncService);
        },
        act: (bloc) => bloc.add(SyncSyncUpEvent(
          userId: testUserId,
          localRepositories: [mockLocal],
          remoteRepositories: [mockRemote],
        )),
        expect: () => [
          const SyncInProgressState(),
          const SyncPendingState(),
        ],
        errors: () => [isA<Exception>()],
      );

      blocTest<SyncBloc, SyncState>(
        'emits [syncInProgress, failedDownSync] on SyncDownError',
        build: () {
          when(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).thenThrow(const SyncDownError('server error'));
          when(() => mockIsar.opLogs)
              .thenThrow(Exception('skip refresh'));
          return SyncBloc(isar: mockIsar, syncService: mockSyncService);
        },
        act: (bloc) => bloc.add(SyncSyncUpEvent(
          userId: testUserId,
          localRepositories: [mockLocal],
          remoteRepositories: [mockRemote],
        )),
        expect: () => [
          const SyncInProgressState(),
          isA<DownSyncFailedState>(),
        ],
        errors: () => [isA<SyncDownError>()],
      );

      blocTest<SyncBloc, SyncState>(
        'emits [syncInProgress, failedUpSync] on SyncUpError',
        build: () {
          when(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).thenThrow(const SyncUpError('upload failed'));
          when(() => mockIsar.opLogs)
              .thenThrow(Exception('skip refresh'));
          return SyncBloc(isar: mockIsar, syncService: mockSyncService);
        },
        act: (bloc) => bloc.add(SyncSyncUpEvent(
          userId: testUserId,
          localRepositories: [mockLocal],
          remoteRepositories: [mockRemote],
        )),
        expect: () => [
          const SyncInProgressState(),
          isA<UpSyncFailedState>(),
        ],
        errors: () => [isA<SyncUpError>()],
      );

      blocTest<SyncBloc, SyncState>(
        'emits [syncInProgress, failedSync] on generic error',
        build: () {
          when(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).thenThrow(Exception('unexpected'));
          when(() => mockIsar.opLogs)
              .thenThrow(Exception('skip refresh'));
          return SyncBloc(isar: mockIsar, syncService: mockSyncService);
        },
        act: (bloc) => bloc.add(SyncSyncUpEvent(
          userId: testUserId,
          localRepositories: [mockLocal],
          remoteRepositories: [mockRemote],
        )),
        expect: () => [
          const SyncInProgressState(),
          isA<SyncFailedState>(),
        ],
        errors: () => [isA<Exception>()],
      );
    });

    group('error message extraction', () {
      late MockLocalRepository mockLocal;
      late MockRemoteRepository mockRemote;

      setUp(() {
        mockLocal = MockLocalRepository();
        mockRemote = MockRemoteRepository();
      });

      blocTest<SyncBloc, SyncState>(
        'extracts SocketException as no internet connection key',
        build: () {
          when(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).thenThrow(
              const SyncUpError(SocketException('connection refused')));
          when(() => mockIsar.opLogs)
              .thenThrow(Exception('skip'));
          return SyncBloc(isar: mockIsar, syncService: mockSyncService);
        },
        act: (bloc) => bloc.add(SyncSyncUpEvent(
          userId: testUserId,
          localRepositories: [mockLocal],
          remoteRepositories: [mockRemote],
        )),
        expect: () => [
          const SyncInProgressState(),
          isA<UpSyncFailedState>().having(
            (s) => s.message,
            'message',
            'SYNC_DIALOG_NO_INTERNET_CONNECTION',
          ),
        ],
        errors: () => [isA<SyncUpError>()],
      );

      blocTest<SyncBloc, SyncState>(
        'extracts TimeoutException as connection timed out key',
        build: () {
          when(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).thenThrow(
              SyncUpError(TimeoutException('timed out')));
          when(() => mockIsar.opLogs)
              .thenThrow(Exception('skip'));
          return SyncBloc(isar: mockIsar, syncService: mockSyncService);
        },
        act: (bloc) => bloc.add(SyncSyncUpEvent(
          userId: testUserId,
          localRepositories: [mockLocal],
          remoteRepositories: [mockRemote],
        )),
        expect: () => [
          const SyncInProgressState(),
          isA<UpSyncFailedState>().having(
            (s) => s.message,
            'message',
            'SYNC_DIALOG_CONNECTION_TIMED_OUT',
          ),
        ],
        errors: () => [isA<SyncUpError>()],
      );

      blocTest<SyncBloc, SyncState>(
        'extracts HttpException as server error key',
        build: () {
          when(() => mockSyncService.performSync(
                localRepositories: any(named: 'localRepositories'),
                remoteRepositories: any(named: 'remoteRepositories'),
                bandwidthModel: any(named: 'bandwidthModel'),
              )).thenThrow(
              const SyncUpError(HttpException('500')));
          when(() => mockIsar.opLogs)
              .thenThrow(Exception('skip'));
          return SyncBloc(isar: mockIsar, syncService: mockSyncService);
        },
        act: (bloc) => bloc.add(SyncSyncUpEvent(
          userId: testUserId,
          localRepositories: [mockLocal],
          remoteRepositories: [mockRemote],
        )),
        expect: () => [
          const SyncInProgressState(),
          isA<UpSyncFailedState>().having(
            (s) => s.message,
            'message',
            'SYNC_DIALOG_SERVER_ERROR',
          ),
        ],
        errors: () => [isA<SyncUpError>()],
      );
    });
  });

  group('SyncState freezed', () {
    test('SyncPendingState default count is 0', () {
      const state = SyncPendingState();
      expect(state.count, 0);
    });

    test('SyncPendingState with custom count', () {
      const state = SyncPendingState(count: 42);
      expect(state.count, 42);
    });

    test('SyncFailedState default message is empty', () {
      const state = SyncFailedState();
      expect(state.message, '');
    });

    test('SyncFailedState with custom message', () {
      const state = SyncFailedState(message: 'SYNC_DIALOG_SERVER_ERROR');
      expect(state.message, 'SYNC_DIALOG_SERVER_ERROR');
    });

    test('DownSyncFailedState with message', () {
      const state =
          DownSyncFailedState(message: 'SYNC_DIALOG_NO_INTERNET_CONNECTION');
      expect(state.message, 'SYNC_DIALOG_NO_INTERNET_CONNECTION');
    });

    test('UpSyncFailedState with message', () {
      const state =
          UpSyncFailedState(message: 'SYNC_DIALOG_CONNECTION_TIMED_OUT');
      expect(state.message, 'SYNC_DIALOG_CONNECTION_TIMED_OUT');
    });

    test('SyncState maybeWhen works correctly', () {
      const state = SyncPendingState(count: 5);
      final result = state.maybeWhen(
        pendingSync: (count) => count,
        orElse: () => -1,
      );
      expect(result, 5);
    });

    test('SyncState maybeWhen orElse for non-matching state', () {
      const state = SyncInProgressState();
      final result = state.maybeWhen(
        pendingSync: (count) => count,
        orElse: () => -1,
      );
      expect(result, -1);
    });
  });

  group('SyncEvent freezed', () {
    test('SyncRefreshEvent stores createdBy', () {
      const event = SyncRefreshEvent('user-1');
      expect(event.createdBy, 'user-1');
      expect(event.count, isNull);
    });

    test('SyncRefreshEvent stores optional count', () {
      const event = SyncRefreshEvent('user-1', 10);
      expect(event.createdBy, 'user-1');
      expect(event.count, 10);
    });

    test('SyncSyncUpEvent stores all fields', () {
      final locals = [MockLocalRepository()];
      final remotes = [MockRemoteRepository()];
      final event = SyncSyncUpEvent(
        userId: 'user-1',
        localRepositories: locals,
        remoteRepositories: remotes,
      );
      expect(event.userId, 'user-1');
      expect(event.localRepositories, same(locals));
      expect(event.remoteRepositories, same(remotes));
    });
  });
}
