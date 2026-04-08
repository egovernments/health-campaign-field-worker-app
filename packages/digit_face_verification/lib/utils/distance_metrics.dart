import 'dart:math';

class DistanceMetrics {
  /// Default cosine similarity threshold for face verification.
  /// Typical range for MobileFaceNet: 0.5–0.7 for cosine similarity.
  static const double defaultThreshold = 0.80;

  /// Computes cosine similarity between two embedding vectors.
  /// Returns a value between -1.0 and 1.0, where 1.0 means identical.
  static double cosineSimilarity(List<double> a, List<double> b) {
    if (a.length != b.length) {
      throw ArgumentError(
        'Embedding dimensions must match: ${a.length} != ${b.length}',
      );
    }

    double dotProduct = 0.0;
    double normA = 0.0;
    double normB = 0.0;

    for (int i = 0; i < a.length; i++) {
      dotProduct += a[i] * b[i];
      normA += a[i] * a[i];
      normB += b[i] * b[i];
    }

    final denominator = sqrt(normA) * sqrt(normB);
    if (denominator == 0.0) return 0.0;

    return dotProduct / denominator;
  }

  /// Computes Euclidean distance between two embedding vectors.
  static double euclideanDistance(List<double> a, List<double> b) {
    if (a.length != b.length) {
      throw ArgumentError(
        'Embedding dimensions must match: ${a.length} != ${b.length}',
      );
    }

    double sum = 0.0;
    for (int i = 0; i < a.length; i++) {
      final diff = a[i] - b[i];
      sum += diff * diff;
    }

    return sqrt(sum);
  }

  /// Computes an adaptive verification threshold based on enrollment quality.
  ///
  /// Enrollment quality is measured by the consistency of angle embeddings:
  /// high inter-angle similarity → high quality → stricter threshold.
  /// Low inter-angle similarity → challenging capture → slightly relaxed threshold.
  ///
  /// Returns a threshold in [minThreshold, maxThreshold].
  static double adaptiveThreshold({
    required List<double> averagedEmbedding,
    required List<List<double>> angleEmbeddings,
    double baseThreshold = defaultThreshold,
    double minThreshold = 0.72,
    double maxThreshold = 0.88,
  }) {
    if (angleEmbeddings.length < 2) return baseThreshold;

    // Compute average pairwise cosine similarity among angle embeddings
    double totalSim = 0.0;
    int pairs = 0;
    for (int i = 0; i < angleEmbeddings.length; i++) {
      for (int j = i + 1; j < angleEmbeddings.length; j++) {
        totalSim += cosineSimilarity(angleEmbeddings[i], angleEmbeddings[j]);
        pairs++;
      }
    }
    final avgConsistency = pairs > 0 ? totalSim / pairs : 0.5;

    // Map consistency [0.5, 1.0] → threshold [minThreshold, maxThreshold]
    // Low consistency (≤0.5) → minThreshold, high consistency (≥1.0) → maxThreshold
    final normalized = ((avgConsistency - 0.5) / 0.5).clamp(0.0, 1.0);
    return minThreshold + normalized * (maxThreshold - minThreshold);
  }

  /// Verifies if two embeddings belong to the same person.
  /// Returns a [VerificationResult] with similarity score and pass/fail.
  static VerificationResult verify(
    List<double> embedding1,
    List<double> embedding2, {
    double threshold = defaultThreshold,
  }) {
    final similarity = cosineSimilarity(embedding1, embedding2);
    return VerificationResult(
      similarity: similarity,
      isMatch: similarity >= threshold,
      threshold: threshold,
    );
  }
}

class VerificationResult {
  final double similarity;
  final bool isMatch;
  final double threshold;

  const VerificationResult({
    required this.similarity,
    required this.isMatch,
    required this.threshold,
  });

  @override
  String toString() =>
      'VerificationResult(similarity: ${similarity.toStringAsFixed(4)}, '
      'isMatch: $isMatch, threshold: $threshold)';
}
