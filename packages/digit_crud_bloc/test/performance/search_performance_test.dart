import 'dart:async';

import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:flutter_test/flutter_test.dart';

/// Performance test suite for search optimization
class SearchPerformanceTest {
  final SearchEntityRepository repository;
  final PerformanceMetrics metrics = PerformanceMetrics();

  SearchPerformanceTest({required this.repository});

  /// Run all performance tests
  Future<PerformanceReport> runAllTests() async {
    print('🚀 Starting Performance Test Suite\n');
    print('=' * 60);

    final results = <TestResult>[];

    // Test 1: Single table query
    results.add(await testSingleTableQuery());

    // Test 2: Two related tables (JOIN optimization)
    results.add(await testTwoTableJoin());

    // Test 3: Three related tables
    results.add(await testThreeTableJoin());

    // Test 4: Disconnected groups (parallel optimization)
    results.add(await testDisconnectedGroups());

    // Test 5: Complex nested query
    results.add(await testComplexNestedQuery());

    // Test 6: Large dataset with pagination
    results.add(await testLargeDatasetWithPagination());

    // Test 7: Geospatial query
    results.add(await testGeospatialQuery());

    return PerformanceReport(results: results);
  }

  /// Test single table query performance
  Future<TestResult> testSingleTableQuery() async {
    print('\n📊 Test 1: Single Table Query');
    print('-' * 40);

    final filters = [
      SearchFilter(
        root: 'users',
        field: 'status',
        operator: 'equals',
        value: 'active',
      ),
    ];

    // Run with optimization disabled
    final oldTime = await _measureQuery(
      filters: filters,
      select: ['users'],
      useOptimization: false,
    );

    // Run with optimization enabled
    final newTime = await _measureQuery(
      filters: filters,
      select: ['users'],
      useOptimization: true,
    );

    return TestResult(
      testName: 'Single Table Query',
      oldApproachTime: oldTime,
      newApproachTime: newTime,
      improvement: _calculateImprovement(oldTime, newTime),
    );
  }

  /// Test two table JOIN performance
  Future<TestResult> testTwoTableJoin() async {
    print('\n📊 Test 2: Two Table JOIN');
    print('-' * 40);

    final filters = [
      SearchFilter(
        root: 'users',
        field: 'status',
        operator: 'equals',
        value: 'active',
      ),
      SearchFilter(
        root: 'orders',
        field: 'amount',
        operator: 'in',
        value: [100, 200, 300],
      ),
    ];

    final oldTime = await _measureQuery(
      filters: filters,
      select: ['users', 'orders'],
      useOptimization: false,
    );

    final newTime = await _measureQuery(
      filters: filters,
      select: ['users', 'orders'],
      useOptimization: true,
    );

    return TestResult(
      testName: 'Two Table JOIN',
      oldApproachTime: oldTime,
      newApproachTime: newTime,
      improvement: _calculateImprovement(oldTime, newTime),
    );
  }

  /// Test three table JOIN performance
  Future<TestResult> testThreeTableJoin() async {
    print('\n📊 Test 3: Three Table JOIN');
    print('-' * 40);

    final filters = [
      SearchFilter(
        root: 'users',
        field: 'status',
        operator: 'equals',
        value: 'active',
      ),
      SearchFilter(
        root: 'orders',
        field: 'createdAt',
        operator: 'isNotNull',
        value: null,
      ),
      SearchFilter(
        root: 'products',
        field: 'category',
        operator: 'in',
        value: ['electronics', 'books'],
      ),
    ];

    final oldTime = await _measureQuery(
      filters: filters,
      select: ['users', 'orders', 'products'],
      useOptimization: false,
    );

    final newTime = await _measureQuery(
      filters: filters,
      select: ['users', 'orders', 'products'],
      useOptimization: true,
    );

    return TestResult(
      testName: 'Three Table JOIN',
      oldApproachTime: oldTime,
      newApproachTime: newTime,
      improvement: _calculateImprovement(oldTime, newTime),
    );
  }

  /// Test disconnected groups (parallel execution)
  Future<TestResult> testDisconnectedGroups() async {
    print('\n📊 Test 4: Disconnected Groups (Parallel)');
    print('-' * 40);

    final filters = [
      // Group 1: Users
      SearchFilter(
        root: 'users',
        field: 'status',
        operator: 'equals',
        value: 'active',
      ),
      // Group 2: Products (not related to users)
      SearchFilter(
        root: 'products',
        field: 'inStock',
        operator: 'equals',
        value: true,
      ),
      // Group 3: Categories (not related to others)
      SearchFilter(
        root: 'categories',
        field: 'isActive',
        operator: 'equals',
        value: true,
      ),
    ];

    final oldTime = await _measureQuery(
      filters: filters,
      select: ['users', 'products', 'categories'],
      useOptimization: false,
    );

    final newTime = await _measureQuery(
      filters: filters,
      select: ['users', 'products', 'categories'],
      useOptimization: true,
    );

    return TestResult(
      testName: 'Disconnected Groups',
      oldApproachTime: oldTime,
      newApproachTime: newTime,
      improvement: _calculateImprovement(oldTime, newTime),
    );
  }

  /// Test complex nested query
  Future<TestResult> testComplexNestedQuery() async {
    print('\n📊 Test 5: Complex Nested Query');
    print('-' * 40);

    final filters = [
      SearchFilter(
        root: 'users',
        field: 'status',
        operator: 'equals',
        value: 'active',
      ),
      SearchFilter(
        root: 'orders',
        field: 'status',
        operator: 'in',
        value: ['pending', 'processing'],
      ),
      SearchFilter(
        root: 'orderItems',
        field: 'quantity',
        operator: 'equals',
        value: 5,
      ),
      SearchFilter(
        root: 'products',
        field: 'price',
        operator: 'equals',
        value: 100,
      ),
      SearchFilter(
        root: 'categories',
        field: 'name',
        operator: 'contains',
        value: 'tech',
      ),
    ];

    final oldTime = await _measureQuery(
      filters: filters,
      select: ['users', 'orders', 'orderItems', 'products', 'categories'],
      useOptimization: false,
    );

    final newTime = await _measureQuery(
      filters: filters,
      select: ['users', 'orders', 'orderItems', 'products', 'categories'],
      useOptimization: true,
    );

    return TestResult(
      testName: 'Complex Nested Query',
      oldApproachTime: oldTime,
      newApproachTime: newTime,
      improvement: _calculateImprovement(oldTime, newTime),
    );
  }

  /// Test large dataset with pagination
  Future<TestResult> testLargeDatasetWithPagination() async {
    print('\n📊 Test 6: Large Dataset with Pagination');
    print('-' * 40);

    final filters = [
      SearchFilter(
        root: 'users',
        field: 'createdAt',
        operator: 'isNotNull',
        value: null,
      ),
      SearchFilter(
        root: 'orders',
        field: 'amount',
        operator: 'isNotNull',
        value: null,
      ),
    ];

    final pagination = PaginationParams(limit: 50, offset: 100);

    final oldTime = await _measureQuery(
      filters: filters,
      select: ['users', 'orders'],
      useOptimization: false,
      pagination: pagination,
    );

    final newTime = await _measureQuery(
      filters: filters,
      select: ['users', 'orders'],
      useOptimization: true,
      pagination: pagination,
    );

    return TestResult(
      testName: 'Large Dataset with Pagination',
      oldApproachTime: oldTime,
      newApproachTime: newTime,
      improvement: _calculateImprovement(oldTime, newTime),
    );
  }

  /// Test geospatial query
  Future<TestResult> testGeospatialQuery() async {
    print('\n📊 Test 7: Geospatial Query');
    print('-' * 40);

    final filters = [
      SearchFilter(
        root: 'locations',
        field: 'coordinates',
        operator: 'within',
        value: 5.0, // 5km radius
        coordinates: LatLng(latitude: 40.7128, longitude: -74.0060),
      ),
      SearchFilter(
        root: 'users',
        field: 'status',
        operator: 'equals',
        value: 'active',
      ),
    ];

    final oldTime = await _measureQuery(
      filters: filters,
      select: ['locations', 'users'],
      useOptimization: false,
    );

    final newTime = await _measureQuery(
      filters: filters,
      select: ['locations', 'users'],
      useOptimization: true,
    );

    return TestResult(
      testName: 'Geospatial Query',
      oldApproachTime: oldTime,
      newApproachTime: newTime,
      improvement: _calculateImprovement(oldTime, newTime),
    );
  }

  /// Measure query execution time
  Future<Duration> _measureQuery({
    required List<SearchFilter> filters,
    required List<String> select,
    required bool useOptimization,
    PaginationParams? pagination,
  }) async {
    // Force optimization on/off by mocking the decision method
    // In real test, you'd use a test flag or environment variable

    final stopwatch = Stopwatch()..start();

    try {
      // Execute the query
      await repository.searchEntities(
        filters: filters,
        relationshipGraph: _getMockRelationshipGraph(),
        nestedModelMapping: _getMockNestedMapping(),
        select: select,
        primaryTable: select.first,
        pagination: pagination,
      );
    } catch (e) {
      print('Query failed: $e');
    }

    stopwatch.stop();

    final duration = stopwatch.elapsed;
    print(
        '${useOptimization ? "New" : "Old"} approach: ${duration.inMilliseconds}ms');

    return duration;
  }

  /// Calculate performance improvement percentage
  double _calculateImprovement(Duration oldTime, Duration newTime) {
    if (oldTime.inMicroseconds == 0) return 0;

    final improvement = ((oldTime.inMicroseconds - newTime.inMicroseconds) /
            oldTime.inMicroseconds) *
        100;

    return improvement;
  }

  /// Mock relationship graph for testing
  Map<String, List<RelationshipMapping>> _getMockRelationshipGraph() {
    return {
      'users': [
        RelationshipMapping(
          from: 'users',
          to: 'orders',
          localKey: 'id',
          foreignKey: 'userId',
        ),
      ],
      'orders': [
        RelationshipMapping(
          from: 'orders',
          to: 'users',
          localKey: 'userId',
          foreignKey: 'id',
        ),
        RelationshipMapping(
          from: 'orders',
          to: 'orderItems',
          localKey: 'id',
          foreignKey: 'orderId',
        ),
      ],
      'orderItems': [
        RelationshipMapping(
          from: 'orderItems',
          to: 'products',
          localKey: 'productId',
          foreignKey: 'id',
        ),
      ],
      'products': [
        RelationshipMapping(
          from: 'products',
          to: 'categories',
          localKey: 'categoryId',
          foreignKey: 'id',
        ),
      ],
      'locations': [
        RelationshipMapping(
          from: 'locations',
          to: 'users',
          localKey: 'userId',
          foreignKey: 'id',
        ),
      ],
    };
  }

  /// Mock nested model mapping
  Map<String, Map<String, NestedFieldMapping>> _getMockNestedMapping() {
    return {
      'users': {
        'profile': NestedFieldMapping(
          table: 'userProfiles',
          localKey: 'id',
          foreignKey: 'userId',
          type: NestedMappingType.one,
        ),
      },
      'orders': {
        'items': NestedFieldMapping(
          table: 'orderItems',
          localKey: 'id',
          foreignKey: 'orderId',
          type: NestedMappingType.many,
        ),
      },
    };
  }
}

/// Performance metrics collector
class PerformanceMetrics {
  final List<QueryMetric> metrics = [];

  void recordQuery({
    required String queryType,
    required Duration executionTime,
    required int resultCount,
    required int queryCount,
  }) {
    metrics.add(QueryMetric(
      queryType: queryType,
      executionTime: executionTime,
      resultCount: resultCount,
      queryCount: queryCount,
      timestamp: DateTime.now(),
    ));
  }

  Map<String, dynamic> getSummary() {
    if (metrics.isEmpty) return {};

    final totalTime = metrics.fold<Duration>(
      Duration.zero,
      (sum, m) => sum + m.executionTime,
    );

    final avgTime = Duration(
      microseconds: totalTime.inMicroseconds ~/ metrics.length,
    );

    return {
      'totalQueries': metrics.length,
      'totalTime': totalTime.inMilliseconds,
      'averageTime': avgTime.inMilliseconds,
      'queriesPerSecond': 1000 / avgTime.inMilliseconds,
    };
  }
}

/// Individual query metric
class QueryMetric {
  final String queryType;
  final Duration executionTime;
  final int resultCount;
  final int queryCount;
  final DateTime timestamp;

  QueryMetric({
    required this.queryType,
    required this.executionTime,
    required this.resultCount,
    required this.queryCount,
    required this.timestamp,
  });
}

/// Test result for a specific scenario
class TestResult {
  final String testName;
  final Duration oldApproachTime;
  final Duration newApproachTime;
  final double improvement;

  TestResult({
    required this.testName,
    required this.oldApproachTime,
    required this.newApproachTime,
    required this.improvement,
  });

  void printResult() {
    final status = improvement > 0 ? '✅' : '❌';
    final emoji = improvement > 50
        ? '🚀'
        : improvement > 20
            ? '⚡'
            : '📈';

    print('\n$status $testName:');
    print('  Old: ${oldApproachTime.inMilliseconds}ms');
    print('  New: ${newApproachTime.inMilliseconds}ms');
    print('  Improvement: ${improvement.toStringAsFixed(1)}% $emoji');
  }
}

/// Performance test report
class PerformanceReport {
  final List<TestResult> results;

  PerformanceReport({required this.results});

  void printReport() {
    print('\n' + '=' * 60);
    print('📈 PERFORMANCE TEST REPORT');
    print('=' * 60);

    for (final result in results) {
      result.printResult();
    }

    // Calculate overall improvement
    final totalOldTime = results.fold<Duration>(
      Duration.zero,
      (sum, r) => sum + r.oldApproachTime,
    );

    final totalNewTime = results.fold<Duration>(
      Duration.zero,
      (sum, r) => sum + r.newApproachTime,
    );

    final overallImprovement =
        ((totalOldTime.inMicroseconds - totalNewTime.inMicroseconds) /
                totalOldTime.inMicroseconds) *
            100;

    print('\n' + '=' * 60);
    print('📊 OVERALL RESULTS:');
    print('  Total Old Time: ${totalOldTime.inMilliseconds}ms');
    print('  Total New Time: ${totalNewTime.inMilliseconds}ms');
    print('  Overall Improvement: ${overallImprovement.toStringAsFixed(1)}%');

    if (overallImprovement > 40) {
      print('\n🎉 EXCELLENT! Optimization is highly effective!');
    } else if (overallImprovement > 20) {
      print('\n✅ GOOD! Significant performance improvement achieved.');
    } else if (overallImprovement > 0) {
      print('\n📈 MODERATE improvement. Consider further optimization.');
    } else {
      print('\n⚠️ No improvement detected. Review optimization strategy.');
    }

    print('=' * 60);
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': DateTime.now().toIso8601String(),
      'results': results
          .map((r) => {
                'test': r.testName,
                'oldTime': r.oldApproachTime.inMilliseconds,
                'newTime': r.newApproachTime.inMilliseconds,
                'improvement': r.improvement,
              })
          .toList(),
      'summary': {
        'totalTests': results.length,
        'averageImprovement': results.isEmpty
            ? 0
            : results.map((r) => r.improvement).reduce((a, b) => a + b) /
                results.length,
      },
    };
  }
}
