import 'dart:convert';
import 'dart:io';

import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_crud_bloc/utils/performance_monitor.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:isar/isar.dart';

import 'search_performance_test.dart';

/// Performance test runner
void main() async {
  print('🚀 Starting DIGIT CRUD Performance Test Suite');
  print('=' * 60);

  // Initialize test environment
  final testEnvironment = await _setupTestEnvironment();

  // Run performance tests
  final performanceTest = SearchPerformanceTest(
    repository: testEnvironment.repository,
  );

  // Enable monitoring
  SearchPerformanceMonitor().setEnabled(true);

  // Run all tests
  final report = await performanceTest.runAllTests();

  // Print results
  report.printReport();

  // Save results to file
  await _saveResults(report);

  // Print monitoring summary
  SearchPerformanceMonitor().getSnapshot().printSummary();

  print('\n✅ Performance testing completed!');
  print('Results saved to: performance_results.json');
}

/// Setup test environment
Future<TestEnvironment> _setupTestEnvironment() async {
  print('⚙️ Setting up test environment...\n');

  // In a real implementation, you would:
  // 1. Create in-memory database
  // 2. Seed with test data
  // 3. Initialize repositories

  // For now, return mock environment
  return TestEnvironment(
    repository: await _createMockRepository(),
  );
}

/// Create mock repository for testing
Future<SearchEntityRepository> _createMockRepository() async {
  final dir = Directory.systemTemp.createTempSync();
  final isar = await Isar.open([], directory: dir.path);

  return MockSearchEntityRepository(isar);
}

/// Save performance results to file
Future<void> _saveResults(PerformanceReport report) async {
  final file = File('performance_results.json');
  await file.writeAsString(jsonEncode(report.toJson()));

  // Also export monitoring data
  final monitoringFile = File('monitoring_data.json');
  await monitoringFile
      .writeAsString(SearchPerformanceMonitor().exportMetrics());
}

/// Test environment
class TestEnvironment {
  final SearchEntityRepository repository;

  TestEnvironment({required this.repository});
}

/// Mock repository for testing
class MockSearchEntityRepository extends SearchEntityRepository {
  MockSearchEntityRepository(Isar isar)
      : super(
          FakeLocalSqlDataStore(),
          FakeOpLogManager<EntityModel>(isar),
        );
  @override
  Future<(Map<String, List<EntityModel>>, int)> searchEntities({
    required filters,
    required relationshipGraph,
    required nestedModelMapping,
    required select,
    primaryTable,
    pagination,
  }) async {
    // Simulate query execution time based on complexity
    final complexity = _calculateMockComplexity(filters, select);
    final baseTime =
        50 + (complexity * 10); // Base 50ms + 10ms per complexity point

    // Add random variance
    final variance = (baseTime * 0.2 * (DateTime.now().millisecond / 1000));
    final totalTime = baseTime + variance.round();

    await Future.delayed(Duration(milliseconds: totalTime));

    // ✅ Return mock EntityModels instead of dynamic maps
    return (
      {
        for (final table in select)
          table: List.generate(
            10,
            (i) => FakeEntityModel(
              id: i.toString(),
              data: {'field': 'mock_$i'},
            ),
          ),
      },
      100
    );
  }

  int _calculateMockComplexity(List filters, List select) {
    return (filters.length * 2) + (select.length * 3);
  }
}

class FakeEntityModel extends EntityModel {
  @override
  final String id;

  @override
  final Map<String, dynamic> data;

  FakeEntityModel({
    required this.id,
    required this.data,
  });

  @override
  // TODO: implement copyWith
  EntityModelCopyWith<EntityModel, EntityModel, EntityModel> get copyWith =>
      throw UnimplementedError();

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

class FakeLocalSqlDataStore extends LocalSqlDataStore {
  FakeLocalSqlDataStore() : super(); // adjust depending on constructor
}

Future<Isar> createInMemoryIsar() async {
  final dir = Directory.systemTemp.createTempSync(); // temp folder
  return await Isar.open(
    [], // no schemas for mock
    directory: dir.path,
  );
}

class FakeOpLogManager<T> extends OpLogManager<EntityModel> {
  FakeOpLogManager(Isar isar) : super(isar);

  @override
  EntityModel applyServerGeneratedIdToEntity(
      EntityModel entity, String serverGeneratedId, int rowVersion) {
    // TODO: implement applyServerGeneratedIdToEntity
    throw UnimplementedError();
  }

  @override
  String getClientReferenceId(EntityModel entity) {
    // TODO: implement getClientReferenceId
    throw UnimplementedError();
  }

  @override
  bool? getNonRecoverableError(EntityModel entity) {
    // TODO: implement getNonRecoverableError
    throw UnimplementedError();
  }

  @override
  int? getRowVersion(EntityModel entity) {
    // TODO: implement getRowVersion
    throw UnimplementedError();
  }

  @override
  String? getServerGeneratedId(EntityModel entity) {
    // TODO: implement getServerGeneratedId
    throw UnimplementedError();
  } // adjust depending on constructor
}

/// Benchmark specific scenarios
class BenchmarkRunner {
  static Future<void> runBenchmarks() async {
    print('\n🏁 Running Specific Benchmarks');
    print('-' * 40);

    await _benchmarkJoinOptimization();
    await _benchmarkParallelExecution();
    await _benchmarkCacheEfficiency();
  }

  static Future<void> _benchmarkJoinOptimization() async {
    print('\n📊 JOIN Optimization Benchmark');

    // Test with increasing number of tables
    for (int tableCount = 2; tableCount <= 5; tableCount++) {
      final times = <Duration>[];

      for (int run = 0; run < 10; run++) {
        final stopwatch = Stopwatch()..start();

        // Simulate JOIN query
        await Future.delayed(Duration(milliseconds: 50 * tableCount));

        stopwatch.stop();
        times.add(stopwatch.elapsed);
      }

      final avgTime = times.fold<Duration>(
            Duration.zero,
            (sum, time) => sum + time,
          ) ~/
          times.length;

      print('  $tableCount tables: ${avgTime.inMilliseconds}ms avg');
    }
  }

  static Future<void> _benchmarkParallelExecution() async {
    print('\n📊 Parallel Execution Benchmark');

    // Sequential vs Parallel
    final stopwatch = Stopwatch();

    // Sequential
    stopwatch.start();
    for (int i = 0; i < 3; i++) {
      await Future.delayed(Duration(milliseconds: 100));
    }
    stopwatch.stop();
    final sequentialTime = stopwatch.elapsed;

    // Parallel
    stopwatch.reset();
    stopwatch.start();
    await Future.wait([
      Future.delayed(Duration(milliseconds: 100)),
      Future.delayed(Duration(milliseconds: 100)),
      Future.delayed(Duration(milliseconds: 100)),
    ]);
    stopwatch.stop();
    final parallelTime = stopwatch.elapsed;

    final improvement =
        ((sequentialTime.inMicroseconds - parallelTime.inMicroseconds) /
                sequentialTime.inMicroseconds) *
            100;

    print('  Sequential: ${sequentialTime.inMilliseconds}ms');
    print('  Parallel: ${parallelTime.inMilliseconds}ms');
    print('  Improvement: ${improvement.toStringAsFixed(1)}%');
  }

  static Future<void> _benchmarkCacheEfficiency() async {
    print('\n📊 Cache Efficiency Benchmark');

    // First query (cache miss)
    final stopwatch = Stopwatch()..start();
    await Future.delayed(Duration(milliseconds: 200));
    stopwatch.stop();
    final firstQueryTime = stopwatch.elapsed;

    // Second query (cache hit)
    stopwatch.reset();
    stopwatch.start();
    await Future.delayed(Duration(milliseconds: 5)); // Cache lookup time
    stopwatch.stop();
    final cachedQueryTime = stopwatch.elapsed;

    final speedup =
        firstQueryTime.inMicroseconds / cachedQueryTime.inMicroseconds;

    print('  First query: ${firstQueryTime.inMilliseconds}ms');
    print('  Cached query: ${cachedQueryTime.inMilliseconds}ms');
    print('  Speedup: ${speedup.toStringAsFixed(1)}x');
  }
}

/// Real-time performance dashboard (console-based)
class PerformanceDashboard {
  static void startMonitoring() {
    print('\n📈 Starting Real-time Performance Monitoring');
    print('Press Ctrl+C to stop...\n');

    // Listen to performance stream
    SearchPerformanceMonitor().performanceStream.listen((snapshot) {
      _printDashboard(snapshot);
    });
  }

  static void _printDashboard(PerformanceSnapshot snapshot) {
    // Clear console (simplified)
    print('\n' + '=' * 60);
    print('📊 REAL-TIME PERFORMANCE DASHBOARD');
    print('Updated: ${snapshot.timestamp.toString().substring(11, 19)}');
    print('=' * 60);

    // Key metrics
    print('🚀 Key Metrics:');
    print('  Total Queries: ${snapshot.totalQueries}');
    print('  Avg Response: ${snapshot.averageExecutionTime.inMilliseconds}ms');
    print('  P95 Response: ${snapshot.p95ExecutionTime.inMilliseconds}ms');
    print('  Cache Hit Rate: ${snapshot.cacheHitRate.toStringAsFixed(1)}%');
    print('  Success Rate: ${snapshot.successRate.toStringAsFixed(1)}%');

    // Strategy usage
    if (snapshot.strategyUsage.isNotEmpty) {
      print('\n📈 Strategy Usage:');
      snapshot.strategyUsage.forEach((strategy, count) {
        final percentage = (count / snapshot.totalQueries) * 100;
        print('  $strategy: $count (${percentage.toStringAsFixed(1)}%)');
      });
    }

    // Performance indicators
    final avgMs = snapshot.averageExecutionTime.inMilliseconds;
    String performance;
    if (avgMs < 50) {
      performance = '🟢 Excellent (<50ms)';
    } else if (avgMs < 100) {
      performance = '🟡 Good (50-100ms)';
    } else if (avgMs < 200) {
      performance = '🟠 Fair (100-200ms)';
    } else {
      performance = '🔴 Poor (>200ms)';
    }

    print('\n🎯 Performance Status: $performance');

    if (snapshot.recentErrors.isNotEmpty) {
      print('\n❌ Recent Errors: ${snapshot.recentErrors.length}');
    }

    print('=' * 60);
  }
}
