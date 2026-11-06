import 'dart:math';

import 'package:digit_face_verification/utils/distance_metrics.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DistanceMetrics', () {
    group('cosineSimilarity', () {
      test('returns 1.0 for identical vectors', () {
        final a = [1.0, 2.0, 3.0, 4.0];
        final b = [1.0, 2.0, 3.0, 4.0];
        final similarity = DistanceMetrics.cosineSimilarity(a, b);
        expect(similarity, closeTo(1.0, 1e-6));
      });

      test('returns -1.0 for opposite vectors', () {
        final a = [1.0, 2.0, 3.0];
        final b = [-1.0, -2.0, -3.0];
        final similarity = DistanceMetrics.cosineSimilarity(a, b);
        expect(similarity, closeTo(-1.0, 1e-6));
      });

      test('returns 0.0 for orthogonal vectors', () {
        final a = [1.0, 0.0];
        final b = [0.0, 1.0];
        final similarity = DistanceMetrics.cosineSimilarity(a, b);
        expect(similarity, closeTo(0.0, 1e-6));
      });

      test('returns 0.0 for zero vector', () {
        final a = [0.0, 0.0, 0.0];
        final b = [1.0, 2.0, 3.0];
        final similarity = DistanceMetrics.cosineSimilarity(a, b);
        expect(similarity, equals(0.0));
      });

      test('throws for mismatched dimensions', () {
        final a = [1.0, 2.0];
        final b = [1.0, 2.0, 3.0];
        expect(
          () => DistanceMetrics.cosineSimilarity(a, b),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('handles high-dimensional vectors (192-dim)', () {
        final random = Random(42);
        final a = List.generate(192, (_) => random.nextDouble() * 2 - 1);
        final b = List.generate(192, (_) => random.nextDouble() * 2 - 1);

        final similarity = DistanceMetrics.cosineSimilarity(a, b);
        expect(similarity, inInclusiveRange(-1.0, 1.0));

        // Same vector should still be 1.0
        final selfSimilarity = DistanceMetrics.cosineSimilarity(a, a);
        expect(selfSimilarity, closeTo(1.0, 1e-6));
      });

      test('is symmetric: sim(a,b) == sim(b,a)', () {
        final a = [0.5, 0.3, 0.8, 0.1];
        final b = [0.2, 0.9, 0.4, 0.6];
        expect(
          DistanceMetrics.cosineSimilarity(a, b),
          closeTo(DistanceMetrics.cosineSimilarity(b, a), 1e-10),
        );
      });
    });

    group('euclideanDistance', () {
      test('returns 0.0 for identical vectors', () {
        final a = [1.0, 2.0, 3.0];
        final b = [1.0, 2.0, 3.0];
        expect(DistanceMetrics.euclideanDistance(a, b), closeTo(0.0, 1e-6));
      });

      test('returns correct distance for known vectors', () {
        final a = [0.0, 0.0];
        final b = [3.0, 4.0];
        expect(DistanceMetrics.euclideanDistance(a, b), closeTo(5.0, 1e-6));
      });

      test('throws for mismatched dimensions', () {
        final a = [1.0];
        final b = [1.0, 2.0];
        expect(
          () => DistanceMetrics.euclideanDistance(a, b),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('verify', () {
      test('returns isMatch true for similar embeddings above threshold', () {
        final a = [1.0, 2.0, 3.0, 4.0, 5.0];
        // Very similar vector (slightly perturbed)
        final b = [1.01, 2.02, 3.01, 4.0, 4.99];

        final result = DistanceMetrics.verify(a, b);
        expect(result.isMatch, isTrue);
        expect(result.similarity, greaterThan(0.6));
      });

      test('returns isMatch false for dissimilar embeddings', () {
        final a = [1.0, 0.0, 0.0, 0.0];
        final b = [0.0, 0.0, 0.0, 1.0];

        final result = DistanceMetrics.verify(a, b);
        expect(result.isMatch, isFalse);
        expect(result.similarity, closeTo(0.0, 1e-6));
      });

      test('uses custom threshold', () {
        final a = [1.0, 2.0, 3.0];
        final b = [1.5, 2.5, 3.5];

        final resultHighThreshold = DistanceMetrics.verify(
          a, b,
          threshold: 0.999,
        );
        final resultLowThreshold = DistanceMetrics.verify(
          a, b,
          threshold: 0.5,
        );

        // Same similarity, different threshold decisions
        expect(resultHighThreshold.similarity,
            closeTo(resultLowThreshold.similarity, 1e-10));
        expect(resultLowThreshold.isMatch, isTrue);
      });

      test('includes threshold in result', () {
        final result = DistanceMetrics.verify(
          [1.0, 0.0],
          [1.0, 0.0],
          threshold: 0.75,
        );
        expect(result.threshold, equals(0.75));
      });
    });
  });
}
