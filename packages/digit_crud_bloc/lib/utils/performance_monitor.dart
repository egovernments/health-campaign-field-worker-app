import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

/// Performance monitoring for search queries
class SearchPerformanceMonitor {
  static final SearchPerformanceMonitor _instance =
      SearchPerformanceMonitor._internal();
  factory SearchPerformanceMonitor() => _instance;
  SearchPerformanceMonitor._internal();

  final _queryMetrics = <QueryExecutionMetric>[];
  final _strategyUsage = <String, int>{};
  final _queryCache = LinkedHashMap<String, CachedResult>();
  static const _maxCacheSize = 100;
  static const _maxMetricsSize = 1000;

  bool _isEnabled = kDebugMode; // Enable in debug mode by default
  StreamController<PerformanceSnapshot>? _performanceStream;

  /// Enable/disable monitoring
  void setEnabled(bool enabled) {
    _isEnabled = enabled;
    if (!enabled) {
      clearMetrics();
    }
  }

  /// Get stream of performance updates
  Stream<PerformanceSnapshot> get performanceStream {
    _performanceStream ??= StreamController<PerformanceSnapshot>.broadcast();
    return _performanceStream!.stream;
  }

  /// Record query execution
  Future<T> recordQueryExecution<T>({
    required String queryId,
    required String strategy,
    required Map<String, dynamic> queryParams,
    required Future<T> Function() execution,
  }) async {
    if (!_isEnabled) {
      return await execution();
    }

    final stopwatch = Stopwatch()..start();
    final startMemory = _getCurrentMemoryUsage();

    try {
      // Check cache first
      final cacheKey = _generateCacheKey(queryParams);
      if (_queryCache.containsKey(cacheKey)) {
        final cached = _queryCache[cacheKey]!;
        if (cached.isValid) {
          _recordMetric(QueryExecutionMetric(
            queryId: queryId,
            strategy: strategy,
            executionTime: Duration.zero,
            fromCache: true,
            success: true,
            timestamp: DateTime.now(),
            queryComplexity: _calculateQueryComplexity(queryParams),
          ));
          return cached.result as T;
        }
      }

      // Execute query
      final result = await execution();

      stopwatch.stop();
      final endMemory = _getCurrentMemoryUsage();

      // Record metrics
      final metric = QueryExecutionMetric(
        queryId: queryId,
        strategy: strategy,
        executionTime: stopwatch.elapsed,
        memoryUsed: endMemory - startMemory,
        fromCache: false,
        success: true,
        timestamp: DateTime.now(),
        queryComplexity: _calculateQueryComplexity(queryParams),
      );

      _recordMetric(metric);
      _updateStrategyUsage(strategy);

      // Cache result
      _cacheResult(cacheKey, result);

      // Emit performance snapshot
      _emitSnapshot();

      return result;
    } catch (e) {
      stopwatch.stop();

      _recordMetric(QueryExecutionMetric(
        queryId: queryId,
        strategy: strategy,
        executionTime: stopwatch.elapsed,
        fromCache: false,
        success: false,
        error: e.toString(),
        timestamp: DateTime.now(),
        queryComplexity: _calculateQueryComplexity(queryParams),
      ));

      rethrow;
    }
  }

  /// Calculate query complexity score
  int _calculateQueryComplexity(Map<String, dynamic> queryParams) {
    int complexity = 0;

    // Count filters
    if (queryParams['filters'] != null) {
      complexity += (queryParams['filters'] as List).length * 2;
    }

    // Count tables
    if (queryParams['tables'] != null) {
      complexity += (queryParams['tables'] as List).length * 3;
    }

    // Add for joins
    if (queryParams['hasJoins'] == true) {
      complexity += 5;
    }

    // Add for nested models
    if (queryParams['hasNested'] == true) {
      complexity += 4;
    }

    return complexity;
  }

  /// Generate cache key from query parameters
  String _generateCacheKey(Map<String, dynamic> params) {
    final json = jsonEncode(params);
    return json.hashCode.toString();
  }

  /// Cache query result
  void _cacheResult(String key, dynamic result) {
    // Limit cache size
    if (_queryCache.length >= _maxCacheSize) {
      _queryCache.remove(_queryCache.keys.first);
    }

    _queryCache[key] = CachedResult(
      result: result,
      timestamp: DateTime.now(),
    );
  }

  /// Record metric
  void _recordMetric(QueryExecutionMetric metric) {
    _queryMetrics.add(metric);

    // Limit metrics size
    if (_queryMetrics.length > _maxMetricsSize) {
      _queryMetrics.removeAt(0);
    }
  }

  /// Update strategy usage counter
  void _updateStrategyUsage(String strategy) {
    _strategyUsage[strategy] = (_strategyUsage[strategy] ?? 0) + 1;
  }

  /// Emit performance snapshot
  void _emitSnapshot() {
    if (_performanceStream?.hasListener ?? false) {
      _performanceStream!.add(getSnapshot());
    }
  }

  /// Get current memory usage (simplified)
  int _getCurrentMemoryUsage() {
    // In production, use actual memory profiling
    return ProcessInfo.currentRss;
  }

  /// Get performance snapshot
  PerformanceSnapshot getSnapshot() {
    if (_queryMetrics.isEmpty) {
      return PerformanceSnapshot.empty();
    }

    final recentMetrics = _queryMetrics.length > 100
        ? _queryMetrics.sublist(_queryMetrics.length - 100)
        : _queryMetrics;

    return PerformanceSnapshot(
      totalQueries: _queryMetrics.length,
      averageExecutionTime: _calculateAverageTime(recentMetrics),
      medianExecutionTime: _calculateMedianTime(recentMetrics),
      p95ExecutionTime: _calculatePercentileTime(recentMetrics, 0.95),
      p99ExecutionTime: _calculatePercentileTime(recentMetrics, 0.99),
      cacheHitRate: _calculateCacheHitRate(recentMetrics),
      successRate: _calculateSuccessRate(recentMetrics),
      strategyUsage: Map.from(_strategyUsage),
      recentErrors: _getRecentErrors(),
      timestamp: DateTime.now(),
    );
  }

  /// Calculate average execution time
  Duration _calculateAverageTime(List<QueryExecutionMetric> metrics) {
    if (metrics.isEmpty) return Duration.zero;

    final total = metrics.fold<int>(
      0,
      (sum, m) => sum + m.executionTime.inMicroseconds,
    );

    return Duration(microseconds: total ~/ metrics.length);
  }

  /// Calculate median execution time
  Duration _calculateMedianTime(List<QueryExecutionMetric> metrics) {
    if (metrics.isEmpty) return Duration.zero;

    final times = metrics.map((m) => m.executionTime.inMicroseconds).toList()
      ..sort();

    final middle = times.length ~/ 2;

    if (times.length.isOdd) {
      return Duration(microseconds: times[middle]);
    } else {
      return Duration(
        microseconds: (times[middle - 1] + times[middle]) ~/ 2,
      );
    }
  }

  /// Calculate percentile execution time
  Duration _calculatePercentileTime(
      List<QueryExecutionMetric> metrics, double percentile) {
    if (metrics.isEmpty) return Duration.zero;

    final times = metrics.map((m) => m.executionTime.inMicroseconds).toList()
      ..sort();

    final index = (times.length * percentile).floor();
    return Duration(microseconds: times[index.clamp(0, times.length - 1)]);
  }

  /// Calculate cache hit rate
  double _calculateCacheHitRate(List<QueryExecutionMetric> metrics) {
    if (metrics.isEmpty) return 0;

    final cacheHits = metrics.where((m) => m.fromCache).length;
    return (cacheHits / metrics.length) * 100;
  }

  /// Calculate success rate
  double _calculateSuccessRate(List<QueryExecutionMetric> metrics) {
    if (metrics.isEmpty) return 100;

    final successful = metrics.where((m) => m.success).length;
    return (successful / metrics.length) * 100;
  }

  /// Get recent errors
  List<String> _getRecentErrors() {
    return _queryMetrics
        .where((m) => !m.success && m.error != null)
        .take(10)
        .map((m) => '${m.queryId}: ${m.error}')
        .toList();
  }

  /// Export metrics to JSON
  String exportMetrics() {
    final snapshot = getSnapshot();
    final detailedMetrics = _queryMetrics
        .map((m) => {
              'queryId': m.queryId,
              'strategy': m.strategy,
              'executionTime': m.executionTime.inMilliseconds,
              'memoryUsed': m.memoryUsed,
              'fromCache': m.fromCache,
              'success': m.success,
              'complexity': m.queryComplexity,
              'timestamp': m.timestamp.toIso8601String(),
            })
        .toList();

    return jsonEncode({
      'snapshot': snapshot.toJson(),
      'metrics': detailedMetrics,
    });
  }

  /// Clear all metrics
  void clearMetrics() {
    _queryMetrics.clear();
    _strategyUsage.clear();
    _queryCache.clear();
  }

  /// Dispose resources
  void dispose() {
    _performanceStream?.close();
    _performanceStream = null;
    clearMetrics();
  }
}

/// Query execution metric
class QueryExecutionMetric {
  final String queryId;
  final String strategy;
  final Duration executionTime;
  final int memoryUsed;
  final bool fromCache;
  final bool success;
  final String? error;
  final DateTime timestamp;
  final int queryComplexity;

  QueryExecutionMetric({
    required this.queryId,
    required this.strategy,
    required this.executionTime,
    this.memoryUsed = 0,
    required this.fromCache,
    required this.success,
    this.error,
    required this.timestamp,
    required this.queryComplexity,
  });
}

/// Performance snapshot
class PerformanceSnapshot {
  final int totalQueries;
  final Duration averageExecutionTime;
  final Duration medianExecutionTime;
  final Duration p95ExecutionTime;
  final Duration p99ExecutionTime;
  final double cacheHitRate;
  final double successRate;
  final Map<String, int> strategyUsage;
  final List<String> recentErrors;
  final DateTime timestamp;

  PerformanceSnapshot({
    required this.totalQueries,
    required this.averageExecutionTime,
    required this.medianExecutionTime,
    required this.p95ExecutionTime,
    required this.p99ExecutionTime,
    required this.cacheHitRate,
    required this.successRate,
    required this.strategyUsage,
    required this.recentErrors,
    required this.timestamp,
  });

  factory PerformanceSnapshot.empty() {
    return PerformanceSnapshot(
      totalQueries: 0,
      averageExecutionTime: Duration.zero,
      medianExecutionTime: Duration.zero,
      p95ExecutionTime: Duration.zero,
      p99ExecutionTime: Duration.zero,
      cacheHitRate: 0,
      successRate: 100,
      strategyUsage: {},
      recentErrors: [],
      timestamp: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalQueries': totalQueries,
      'averageExecutionTime': averageExecutionTime.inMilliseconds,
      'medianExecutionTime': medianExecutionTime.inMilliseconds,
      'p95ExecutionTime': p95ExecutionTime.inMilliseconds,
      'p99ExecutionTime': p99ExecutionTime.inMilliseconds,
      'cacheHitRate': cacheHitRate,
      'successRate': successRate,
      'strategyUsage': strategyUsage,
      'recentErrors': recentErrors,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  void printSummary() {
    print('\n📊 Performance Summary');
    print('=' * 50);
    print('Total Queries: $totalQueries');
    print('Average Time: ${averageExecutionTime.inMilliseconds}ms');
    print('Median Time: ${medianExecutionTime.inMilliseconds}ms');
    print('P95 Time: ${p95ExecutionTime.inMilliseconds}ms');
    print('P99 Time: ${p99ExecutionTime.inMilliseconds}ms');
    print('Cache Hit Rate: ${cacheHitRate.toStringAsFixed(1)}%');
    print('Success Rate: ${successRate.toStringAsFixed(1)}%');
    print('\nStrategy Usage:');
    strategyUsage.forEach((strategy, count) {
      print('  $strategy: $count queries');
    });
    if (recentErrors.isNotEmpty) {
      print('\nRecent Errors:');
      recentErrors.forEach((error) => print('  - $error'));
    }
    print('=' * 50);
  }
}

/// Cached result
class CachedResult {
  final dynamic result;
  final DateTime timestamp;
  static const _cacheTimeout = Duration(minutes: 5);

  CachedResult({
    required this.result,
    required this.timestamp,
  });

  bool get isValid => DateTime.now().difference(timestamp) < _cacheTimeout;
}
